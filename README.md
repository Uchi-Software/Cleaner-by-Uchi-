Cleaner by Uchi
Nettoyage, diagnostic et optimisation Windows pour joueurs — avec un compte protégé par e-mail et mot de passe.

Cleaner by Uchi est un utilitaire Windows (WPF, .NET Framework 4.8) pensé pour les joueurs sur PC : nettoyer les fichiers inutiles, diagnostiquer les causes usuelles de micro-saccades, optimiser le démarrage et gérer ses jeux et logiciels, sans jamais toucher à ce qui pourrait casser le système.

Sommaire
Aperçu
Installation
Première connexion
Les 9 sections
Sécurité et vie privée
Architecture
Compiler depuis les sources
Aperçu
Interface sombre façon Discord, redimensionnable, avec coins arrondis natifs (Windows 11).
Chaque action potentiellement risquée demande une confirmation explicite, et peut créer un point de restauration Windows avant de s'exécuter.
Un rapport HTML récapitule chaque session : ce qui a été fait, l'espace libéré, les éventuelles erreurs.
Accès réservé : chaque utilisateur se connecte avec son e-mail et un mot de passe qu'il choisit lui-même.
Installation
Téléchargez Cleaner by Uchi.exe depuis la page Releases du projet.
Lancez-le. Une élévation administrateur est demandée (le programme en a besoin pour nettoyer certains dossiers système et modifier le démarrage).
Windows peut afficher un avertissement SmartScreen (l'exécutable n'est pas encore signé numériquement) : cliquez sur « Informations complémentaires », puis « Exécuter quand même ».
Première connexion
Vous recevez un code d'activation par e-mail de la part de l'administrateur.
Sur l'écran de connexion, cliquez sur « Première connexion / mot de passe oublié ? », saisissez votre e-mail, le code reçu, puis choisissez votre mot de passe (10 caractères minimum, avec au moins une lettre et un chiffre ou un symbole).
Cochez « Mémoriser sur cet ordinateur » pour ne pas ressaisir vos identifiants à chaque lancement.
Mot de passe oublié ? Le même bouton permet de recevoir un nouveau code par e-mail.
Votre mot de passe n'est jamais connu de l'administrateur ni transmis par e-mail : seul un code d'activation à usage unique circule.

Les 9 sections
#	Section	Ce qu'elle fait
1	Diagnostic	État du disque, détection de Windows.old, et une analyse approfondie du système (redémarrage en attente, entrées de démarrage cassées, pilotes en erreur, erreurs système récentes, état de Windows Defender) avec un score de santé sur 100. Inclut aussi une checklist anti-stutter dédiée aux jeux (mode d'alimentation, Mode Jeu, Game DVR, charge CPU/RAM).
2	Nettoyage	Fichiers temporaires, caches navigateur, vignettes, journaux techniques (CBS/DISM), cache de polices, Delivery Optimization. Un bouton « Analyser » estime l'espace récupérable avant toute suppression.
3	Windows Update	Compacte les composants Windows Update (DISM /ResetBase) pour libérer de l'espace — action irréversible, confirmation requise.
4	Téléchargements	Liste le contenu du dossier Téléchargements avec sélection multiple, envoi à la Corbeille (jamais de suppression définitive directe).
5	Sensible	Suppression définitive de Windows.old, masquée par défaut et affichée seulement si ce dossier est détecté. Action irréversible avec confirmation explicite.
6	Optimisation	Gestion des applications au démarrage avec impact mesuré (RAM/CPU) et une recommandation (« peut être désactivé », « à garder », jamais pour les antivirus ou pilotes). Vide aussi les journaux d'événements (hors journal Sécurité).
7	Gaming	Mode « session jeu » (plan d'alimentation dédié, désactivation temporaire du Mode Jeu/Game DVR), nettoyage des caches de shaders choisi logiciel par logiciel (GPU/DirectX, et un par jeu Steam avec son vrai nom), test et réinitialisation réseau, désactivation optionnelle de services à gain marginal (Windows Search, Spouleur, SysMain).
8	Logiciels	Catalogue prêt à installer (jeux/launchers, navigateurs, utilitaires) via winget, recherche libre, et suivi des mises à jour disponibles. Un onglet Assistant IA propose l'installation de Claude Desktop et Claude Code (Anthropic), via leurs paquets winget officiels.
9	Terminer	Vidage définitif optionnel de la Corbeille, puis génération et ouverture automatique du rapport HTML de la session. Étape obligatoire pour fermer l'outil après toute action.
Sécurité et vie privée
Aucune télémétrie : le logiciel ne renvoie rien sur son fonctionnement à un serveur tiers, hormis les appels d'authentification.
Les mots de passe ne sont jamais stockés ni transmis en clair : seul un hash (PBKDF2/SHA-256, sel propre à chaque compte) est conservé côté serveur.
Toute action destructrice (Windows.old, DISM /ResetBase, réseau, services) propose la création d'un point de restauration Windows avant de s'exécuter.
Aucun nettoyage de registre : les gains de performance sont nuls et le risque de casser Windows est réel — Cleaner by Uchi ne le propose pas.
Architecture
Logiciel (WPF/.NET 4.8) ──HTTPS──▶ Serveur d'authentification (Cloudflare Worker)
                                        │
                                        ├─ Cloudflare KV : comptes, mots de passe (hachés), codes d'activation
                                        └─ Resend : envoi des e-mails (codes d'activation)
Le serveur ne connaît jamais le mot de passe en clair, et l'administrateur ne le voit jamais non plus : il est choisi par l'utilisateur au moment de l'activation et haché avant d'être stocké.

Compiler depuis les sources
Prérequis : .NET SDK 8 (utilisé pour compiler une cible net48) et le Developer Pack .NET Framework 4.8.

dotnet build "4. C#\CleanerByUchi\CleanerByUchi.csproj" -c Release
L'exécutable est généré dans 4. C#\CleanerByUchi\bin\Release\net48\Cleaner by Uchi.exe.

Cleaner by Uchi est né d'une idée d'Uchi et a été conçu et programmé avec Claude, l'IA d'Anthropic.
