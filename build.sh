#!/bin/bash
shopt -s expand_aliases

# Aliases
alias compile='latexmk -pdf -pdflatex="pdflatex -shell-escape" main.tex'
alias clean='latexmk -C'

if [ -d "documenti_compilati" ]; then
	rm -rf documenti_compilati
fi
mkdir documenti_compilati

echo "Compilazioni documenti"
echo "----------------------"

# Candidatura
# Analisi capitolati
cd analisi_capitolati/
echo "Analisi capitolati"
echo "----------------------"
compile  
mv main.pdf ../documenti_compilati/analisi_capitolati.pdf
clean 
cd ..

# Piano qualifica
cd piano_qualifica/
echo "Piano qualifica"
echo "----------------------"
compile  
mv main.pdf ../documenti_compilati/piano_qualifica.pdf
clean 
cd ..

# Dichirazione di impegni
cd dichiarazione_impegni/
echo "Dichiarazione impegni"
echo "----------------------"
compile 
mv main.pdf ../documenti_compilati/dichiarazione_impegni.pdf
clean 
cd ..

# Lettera candidatura
cd lettera_candidatura/
echo "Lettera di candidatura"
echo "----------------------"
compile 
mv main.pdf ../documenti_compilati/lettera_candidatura.pdf
clean  
cd ..

# Lettera rtb
cd lettera_rtb/
echo "Lettera presentazione RTB"
echo "----------------------"
compile 
mv main.pdf ../documenti_compilati/lettera_rtb.pdf
clean  
cd ..

# Analisi requisiti
cd analisi_requisiti/
echo "Analisi requisiti"
echo "----------------------"
compile 
mv main.pdf ../documenti_compilati/analisi_requisiti.pdf
clean  
cd ..

# Glossario
cd glossario/
echo "Glossario"
echo "----------------------"
compile 
mv main.pdf ../documenti_compilati/glossario.pdf
clean  
rm main.gl* main.ist
cd ..

# Norme di progetto
cd norme_progetto/
echo "Norme progetto"
echo "----------------------"
compile 
mv main.pdf ../documenti_compilati/norme_progetto.pdf
clean  
cd ..

# Piano di progetto
cd piano_progetto/
echo "Piano progetto"
echo "----------------------"
compile 
mv main.pdf ../documenti_compilati/piano_progetto.pdf
clean  
cd ..


# Piano di qualifica
cd piano_qualifica/
echo "Piano qualifica"
echo "----------------------"
compile
mv main.pdf ../documenti_compilati/piano_qualifica.pdf
clean
cd ..

# Manuale utente
cd manuale_utente/
echo "Manuale utente"
echo "----------------------"
compile
mv main.pdf ../documenti_compilati/manuale_utente.pdf
clean
cd ..

# Verbali
cd verbali/
echo "Verbali"
echo "----------------------"
mkdir -p verbali/
dirs=$( \
	find ./* -type d \
	-not -name "verbali" \
	-not -name "src" \
	-not -name "svg-inkscape" \
	-not -name "template_verbale" )
for D in $dirs
do
	ver=$(cut -c2- <<< $D)
	echo $ver
	echo "----------------------"
	cd $D
	compile 
	mv main.pdf ../verbali/$ver.pdf
	clean  
	cd ..
done
mv verbali/ ../documenti_compilati/verbali