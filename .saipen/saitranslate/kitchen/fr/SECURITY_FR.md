# Politique de Sécurité

## Portée

SAIPEN est une spécification plus un petit ensemble de scripts d'installation/exportation
locaux (`bootstrap/inject.ps1`/`.sh`, `uninstall.ps1`/`.sh`,
`export.ps1`/`.sh`). Il n'exécute pas de serveur, ne collecte pas
de télémétrie, et ne transmet aucune donnée nulle part. Tout ce que
font les scripts, ce sont des écritures locales dans le système de fichiers vers des fichiers que vous contrôlez déjà
(votre propre `~/.claude`, `~/.gemini`, `.saipen/` du projet, etc.), chacun
protégé par une sauvegarde `.bak` automatique avant la première modification.

Les deux seules choses qui méritent vraiment un rapport de sécurité :
1. Un script d'amorçage faisant quelque chose à votre système de fichiers ou historique git
   au-delà de ce que ses propres commentaires/README décrivent.
2. La propre règle d'hygiène des secrets du protocole (RFC.md § 1.1 -- ne jamais écrire
   de clés d'API, jetons, mots de passe dans `STATE.md`/`BOARD.md`/`LOG.md`/
   `KNOWLEDGE/`/`kitchen/`) ayant une véritable faille qui amènerait un
   agent suivant SAIPEN à divulguer un secret dans un fichier commité.

## Versions Supportées

Seule la dernière release taguée sur `main` est supportée. Ceci est une
spécification de protocole, pas un service à longue durée de vie -- il n'y a pas de branche
LTS.

## Signaler une Vulnérabilité

Ouvrez une issue GitHub. Si le rapport implique un vrai problème
actuellement exploitable (pas une hypothèse), marquez-le comme un avis privé/de sécurité via
l'onglet **Sécurité** ("Report a vulnerability") de ce dépôt au lieu
d'une issue publique, afin qu'il ne soit visible publiquement avant le déploiement d'un correctif.

Incluez : quel script ou règle RFC, le scénario concret, et ce
qui se passe réellement vs ce qui devrait se passer. Même norme de preuve que pour tout
autre rapport de bug (voir `CONTRIBUTING.md`).
