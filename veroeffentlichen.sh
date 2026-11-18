#!/bin/zsh
# Veröffentlicht die App „Die Methode“ auf GitHub Pages (https://juno51.github.io/methode/).
# Erster Lauf: legt das öffentliche Repo Juno51/methode an und schaltet GitHub Pages ein.
# Spätere Läufe: lädt nur die Änderungen hoch.
set -e
cd "$(dirname "$0")"
if ! gh repo view Juno51/methode >/dev/null 2>&1; then
  gh repo create Juno51/methode --public --source=. --push --description "Trainings-App: Die Methode (6 Bausteine, Körpergewicht)"
  gh api -X POST repos/Juno51/methode/pages -f build_type=legacy -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 || true
else
  git push -u origin main
fi
echo ""
echo "Fertig. Die App ist in 1–2 Minuten erreichbar unter:"
echo "https://juno51.github.io/methode/"
