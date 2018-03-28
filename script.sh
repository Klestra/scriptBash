#! /bin/bash

#Plusieurs variables dont des variables de couleurs
GREEN="\033[32m"
CLOSE="\033[0m"
KIDDING="Are you kidding me ?"
TOPLANE="T'es au courant qu'il y a des gens sur la map ?"

#Debut du questionnaire
echo -e "$GREEN Connais tu League Of Legends ? $CLOSE"

#création de la première questions à choix ouvert
read ANSWER1

#Gestion des différente réponses
if [ $ANSWER1 = "Non" ] || [ $ANSWER1 = "non" ];
then
	echo -e "$GREEN Pas grave à quoi joues tu ? $CLOSE"
	read ANSWER2
#Gestion de la réponse en chiffre ou chiffre romain
	if [ $ANSWER2 = "FFVIII" ] || [ $ANSWER2 = "FF8" ];
	then
		echo -e "$GREEN T'es au courant qu'on en est au 15 ?! $CLOSE"
	else
		echo -e "$GREEN C'est un super jeu. $CLOSE"
	fi
elif [ $ANSWER1 = "Oui" ] || [ $ANSWER1 = "oui" ];
then
	#Création d'une sélection de réponses grâce à select et do case
	echo -e "$GREEN Quel est ta lane principale ? $CLOSE"
	select ANSWER3 in "Toplane" "Jungle" "Midlane" "ADC" "Support"; do
	case $ANSWER3 in
	 "Toplane") echo -e "$GREEN $TOPLANE $CLOSE"; break;;
	 "Support") echo -e "$GREEN Sérieusement ?!! $CLOSE"; break;;
	 "Midlane") echo -e "$GREEN T'as tout compris, skills, tout ça tout ça.. $CLOSE"; break;;
	 "ADC") echo -e "$GREEN Apprécies-tu les noobs qui vont supp par défaut ? $CLOSE";
	  read ANSWER4;
	  echo -e "$GREEN Ca s'appelle du masochisme. $CLOSE"; break;;
	 "Jungle") echo -e "$GREEN Quel est ton style de jeu ? $CLOSE";
	  select ANSWER5 in "Tu fais du PvE" "Tu campes jusqu'à ce que le type en face craque ?" "T'es à gauche, à droite, partout et nulle part à la fois ?"; do
	  case $ANSWER5 in
	   "Tu fais du PvE") echo -e "$GREEN $TOPLANE $CLOSE"; break;;
	   "Tu campes jusqu'à ce que le type en face craque ?") echo -e "$GREEN T'as compris comment monter ! $CLOSE"; break;;
	   "T'es à gauche, à droite, partout et nulle part à la fois ?") echo -e "$GREEN Tu slack en bronze alors. $CLOSE"; break;;
	#On stop à chaque fois avec break ainsi que la fin des choix avec esac et done
	   esac
 	 done
	 break;
	esac 
done
else 	
	echo -e "$GREEN $KIDDING $CLOSE"
fi

#Permet de sauvegarder toute les réponses faite dans le questionnaire dans un fichier reponse.txt
RESPONSES="$ANSWER1 $ANSWER2 $ANSWER3 $ANSWER4 $ANSWER5"

echo $RESPONSES > ./reponse.txt
