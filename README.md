Groupe 7: 

Le projet se situe sur la branche Master
</br></br>

Partie 1 : 
Concernant la première partie, une fois le projet télécharger, faites la commande .\setup_manual.ps1. </br>
Une fois les trois conteneurs créés, faites un curl de l'addresse http://app:4743/heath et observé le résultat </br>
Pareil pour http://app:4743/data

Partie 2 : 
Dans le dossier du projet, lancez la commande suivante :
docker compose up --build
Une fois les services lancés :
http://localhost:5423/health
http://localhost:4743/data
