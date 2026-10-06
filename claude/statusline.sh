#!/bin/bash
# Claude Code status line, powerline style, Solarized colours for a light terminal.
# Segments: path > git > model > context > 5h limit > 7d limit > session $ > month $
# Requires: jq, git, a Nerd Font, a truecolor terminal. Works with bash 3.2+.
input=$(cat); now=$(date +%s)

IFS=$'\t' read -r DIR MODEL CTX COST FH FHR WK WKR SPU SPP < <(jq -r '[
  (.workspace.current_dir // .cwd // "-"),
  .model.display_name,
  (.context_window.used_percentage // 0 | floor),
  (.cost.total_cost_usd // 0),
  (.rate_limits.five_hour.used_percentage // "-"),
  (.rate_limits.five_hour.resets_at // "-"),
  (.rate_limits.seven_day.used_percentage // "-"),
  (.rate_limits.seven_day.resets_at // "-"),
  (.rate_limits.spend_limit.used_usd // "-"),
  (.rate_limits.spend_limit.period // "-")] | @tsv' <<<"$input")

# --- Solarized palette ---
BASE3='#fdf6e3'; BASE03='#002b36'; BASE01='#586e75'
YELLOW='#b58900'; ORANGE='#cb4b16'; RED='#dc322f'
VIOLET='#6c71c4'; BLUE='#268bd2'; CYAN='#2aa198'; GREEN='#859900'

# Each visible segment takes the next colour. The list repeats from the start.
# Red is not a segment colour. A segment changes to red above its high threshold.
PAL=("$BLUE" "$CYAN" "$GREEN" "$YELLOW" "$ORANGE" "$VIOLET" "$BASE01")

# --- glyphs as UTF-8 bytes (bash 3.2 has no \u escape) ---
ARROW=$(printf '\xee\x82\xb0')    # U+E0B0
LCAP=$(printf '\xee\x82\xb6')     # U+E0B6
RCAP=$(printf '\xee\x82\xb4')     # U+E0B4
I_BRANCH=$(printf '\xee\x82\xa0') # U+E0A0
I_CLOCK=$(printf '\xef\x80\x97')  # U+F017
I_CAL=$(printf '\xef\x81\xb3')    # U+F073
ESC=$(printf '\033'); RST="${ESC}[0m"; BOLD="${ESC}[1m"; NOBOLD="${ESC}[22m"

rgb() { printf '%d;%d;%d' "0x${1:1:2}" "0x${1:3:2}" "0x${1:5:2}"; }
fg()  { printf '%s[38;2;%sm' "$ESC" "$(rgb "$1")"; }
bg()  { printf '%s[48;2;%sm' "$ESC" "$(rgb "$1")"; }

bar() { # pct -> 5-cell bar
  local p=${1%.*} f e b=""
  f=$(( p * 5 / 100 )); (( f > 5 )) && f=5; (( f < 0 )) && f=0; e=$(( 5 - f ))
  while (( f-- > 0 )); do b+="█"; done
  while (( e-- > 0 )); do b+="░"; done
  echo "$b"
}
left() { # epoch -> time remaining
  local s=$(( ${1%.*} - now )); (( s < 0 )) && s=0
  if (( s >= 86400 )); then echo "$(( s / 86400 ))d$(( s % 86400 / 3600 ))h"
  else echo "$(( s / 3600 ))h$(( s % 3600 / 60 ))m"; fi
}

# --- segments: parallel arrays of background, foreground, text ---
BGS=(); FGS=(); TXT=()
seg() { # text [fg] [bg]
  BGS+=("${3:-${PAL[${#BGS[@]} % ${#PAL[@]}]}}"); FGS+=("${2:-$BASE3}"); TXT+=("$1")
}
meter() { # pct warn high text: dark bold text above warn, red segment above high
  local p=${1%.*}
  if (( p > $3 )); then seg "$BOLD$4$NOBOLD" "$BASE3" "$RED"
  elif (( p > $2 )); then seg "$BOLD$4$NOBOLD" "$BASE03"
  else seg "$4"; fi
}

# 1. path: ~ for home, last 3 path components
SHORT=$DIR
case "$SHORT" in "$HOME") SHORT="~";; "$HOME"/*) SHORT="~${SHORT#"$HOME"}";; esac
SHORT=$(awk -F/ '{ n = NF; if (n <= 3) { print; exit }
  print $(n-2) "/" $(n-1) "/" $n }' <<<"$SHORT")
seg " $SHORT "

# 2. git: branch (short SHA if detached), * dirty, ↑ ahead, ↓ behind
if git -C "$DIR" rev-parse --git-dir >/dev/null 2>&1; then
  G=$(git -C "$DIR" branch --show-current 2>/dev/null)
  [ -z "$G" ] && G=$(git -C "$DIR" rev-parse --short HEAD 2>/dev/null)
  [ -n "$(git -C "$DIR" --no-optional-locks status --porcelain 2>/dev/null | head -n 1)" ] && G+=" *"
  read -r BEHIND AHEAD < <(git -C "$DIR" rev-list --left-right --count '@{upstream}...HEAD' 2>/dev/null)
  [ "${AHEAD:-0}" -gt 0 ] && G+=" ↑$AHEAD"
  [ "${BEHIND:-0}" -gt 0 ] && G+=" ↓$BEHIND"
  seg " $I_BRANCH $G "
fi

# 3. model
seg "$BOLD $MODEL $NOBOLD"

# 4. context
meter "$CTX" 50 90 " $(bar "$CTX") ${CTX}% "

# 5. 5-hour limit, 6. 7-day limit (omitted when Claude Code does not send them)
if [ "$FH" != "-" ]; then
  p=$(printf '%.0f' "$FH"); meter "$p" 100 90 " $I_CLOCK 5h ${p}% $(left "$FHR") "
fi
if [ "$WK" != "-" ]; then
  p=$(printf '%.0f' "$WK"); meter "$p" 100 90 " $I_CAL 7d ${p}% $(left "$WKR") "
fi

# 7. session $
seg " \$$(printf '%.2f' "$COST") "

# 8. month $: gateway value if present, else cached ccusage estimate
MONTH=""
if [ "$SPP" = "monthly" ] && [ "$SPU" != "-" ]; then MONTH=$SPU
else
  C="$HOME/.claude/statusline-month.cache"
  age=$(( now - $(stat -c %Y "$C" 2>/dev/null || stat -f %m "$C" 2>/dev/null || echo 0) ))
  if (( age > 600 )); then
    touch "$C"
    ( v=$(npx -y ccusage@latest monthly --json 2>/dev/null | jq -r '.monthly[-1].totalCost // empty')
      [ -n "$v" ] && echo "$v" > "$C" ) >/dev/null 2>&1 &
  fi
  MONTH=$(cat "$C" 2>/dev/null)
fi
[ -n "$MONTH" ] && seg " $I_CAL \$$(printf '%.2f' "$MONTH")/mo "

# --- render: left cap, arrow transitions, right cap ---
n=${#TXT[@]}; OUT="$(fg "${BGS[0]}")$LCAP"
for (( i = 0; i < n; i++ )); do
  OUT+="$(bg "${BGS[i]}")$(fg "${FGS[i]}")${TXT[i]}"
  if (( i + 1 < n )); then OUT+="$(fg "${BGS[i]}")$(bg "${BGS[i+1]}")$ARROW"
  else OUT+="$RST$(fg "${BGS[i]}")$RCAP$RST"; fi
done
printf '%s\n' "$OUT"
