# Permanences CPM - Equipe SUD

Site statique (GitHub Pages) + base gratuite Supabase pour enregistrer les positionnements.
Les noms des membres sont stockés dans la base, pas dans le code de ce dépôt.

## 1. Créer la base (Supabase, gratuit)

1. Créez un compte sur supabase.com, puis un nouveau projet (région Europe).
2. Ouvrez **SQL Editor > New query**, collez le contenu de `supabase-setup.sql`, cliquez **Run**.
3. Collez ensuite le contenu de `supabase-donnees.sql` (fichier fourni à part, à ne jamais déposer dans le dépôt), cliquez **Run**.
4. Ouvrez **Project Settings > API** et copiez :
   - **Project URL**
   - la clé **anon public** (jamais la clé `service_role`)

## 2. Renseigner la configuration

Dans `config.js`, remplacez les deux valeurs par celles copiées ci-dessus.

## 3. Mettre en ligne

Le dépôt contient `index.html`, `config.js`, `supabase-setup.sql` et ce fichier.
Activez GitHub Pages : **Settings > Pages**, source **Deploy from a branch**, branche **main**, dossier **/ (root)**.

## À savoir

- Il n'y a pas de comptes : toute personne qui a l'adresse peut se positionner à la place d'un membre. Ne diffusez le lien qu'à l'équipe.
- La clé `anon` est publique par conception. Elle permet de lire la liste des membres depuis la page ; ceux qui lisent seulement le code du dépôt ne voient aucun nom.
- Supabase met en pause un projet gratuit inactif pendant une semaine. Ouvrez simplement son tableau de bord pour le relancer.
