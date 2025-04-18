# 📦 Projet Docker - Groupe 7

🔍 Pour tester le projet, **assurez-vous d'être sur la branche `master`**. C'est **cette branche qui contient le code à utiliser et tester**.


Partie 1 : 
Concernant la première partie, une fois le projet télécharger, faites la commande .\setup_manual.ps1. </br>
Une fois les trois conteneurs créés, faites un curl de l'addresse http://app:4743/heath et observé le résultat </br>
Pareil pour http://app:4743/data

Partie 2 : 
Placez-vous à la racine du projet et exécutez :
docker compose up --build
Une fois les services démarrés, testez dans votre navigateur ou avec curl :
http://localhost:4743/health
http://localhost:4743/data
