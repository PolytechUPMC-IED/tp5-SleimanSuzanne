#!/bin/bash


#question 1

tar xvzf $1

#question 2

l_jpg=`ls *.jpg`

#question 3 La commande cut nous permet de découper une ligne

#question 5;6

touch filieres.txt
for image in $l_jpg
do
    nom=`echo $image | cut -d_ -f2`
    prenom=`echo $image | cut -d_ -f1`
    spe=`echo $image | cut -d_ -f3`
    annee=`echo $image | cut -d_ -f4 | cut -d. -f1`
    name=$nom.$prenom.jpg #nom de l'image ds nv fichier
    rep=$spe$annee

    mkdir -p $rep
    convert -resize 90x120 $image $rep/$name
    rm $image
     if [[ -z `grep $rep filieres.txt` ]];
     then echo "$rep" >> filieres.txt
     fi
       
    
done
 
#question 5
#Au début de la boucle je separe chaque partie du nom du fichier dans une variable lui correspondant pour pouvoir les réutilisesr plus facilement. Ensuite je renomme les photos en nom.prenom.jpg et les mets dans le nouveau repertoire crée.

#question 6
# -z permet de savoir si la chaine de caractere rentrée ensuite est nulle ou non

while read line; do
    fichier=$line/index.html
    touch $fichier
    echo "<html><head><title> Trombinoscope Spé $line</title></head>
<body>
<h1 align='center'>Trombinoscope Spé $line</h1>
<table cols=2 align='center'>
<tr>" > $fichier

    liste=`ls $line/*.jpg`
    for i in $liste
    do
        
	photo=`basename $i`

	p=`echo $photo | cut -d. -f2`
	n=`echo $photo | cut -d. -f1`
	echo "<td><img src=$photo width=90 height=120/><br/>$p $n</td>" >> $fichier
    done
    echo "</tr>
</table>
</body></html>" >> $fichier
    
done < filieres.txt

#question 7
#on parcout chaque ligne de filieres.txt cest à dire le nom de chaque repertoire crée, et pour chacun on recrit au dessus du precedent le debut et la fin de la page html, et on parcourt les images du repertoires, on les inclut dedans grace à >> pour le pas quelles soient effacées par les suivantes.
