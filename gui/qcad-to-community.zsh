#!/bin/zsh
#
# Converts an installed QCAD Professional trial into QCAD Community Edition
# by removing the professional-only plugins, per QCAD's own documented
# procedure (the same files their in-app trial widget's "Remove" button
# lists): https://forum.qcad.org/t/removing-the-trial-add-ons/3089
#
# Re-run `brew reinstall --cask qcad` to restore the Professional trial.

set -e

app=${1:-/Applications/QCAD.app}
plugins="${app}/Contents/PlugIns"

[[ -d ${plugins} ]] || { echo "QCAD PlugIns folder not found at ${plugins}" >&2; exit 1; }

if pgrep -qx QCAD; then
  echo "Quit QCAD before running this script." >&2
  exit 1
fi

# Professional-only plugins. Do NOT add libqcaddxf.dylib here: QCAD needs it
# to load or save any drawing, in Community Edition or Professional alike.
pro_plugins=(
  libqcaddarkstyle.dylib
  libqcaddwg.dylib
  libqcadpdf.dylib
  libqcadpolygon.dylib
  libqcadproj.dylib
  libqcadproscripts.dylib
  libqcadproxies.dylib
  libqcadshp.dylib
  libqcadspatialindexpro.dylib
  libqcadtrace.dylib
)

for plugin in ${pro_plugins}; do
  file="${plugins}/${plugin}"
  if [[ -f ${file} ]]; then
    rm ${file}
    echo "Removed ${plugin}"
  else
    echo "Skipped ${plugin} (not present in this QCAD version)"
  fi
done

echo "Done. QCAD will now run as Community Edition."
