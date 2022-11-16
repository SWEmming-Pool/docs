#!/bin/sh
echo "Compilazioni documenti"
if [ -d "out" ]; then
	rm -rf out
fi
mkdir out

# Candidatura
# Analisi capitolati
cd analisi_capitolati/
echo "Analisi capitolati"
latexmk -pdf analisi.capitolati.tex 1>/dev/null
mv analisi_capitolati.pdf ../out
latexmk -c
cd ..

# Dichirazione di impegni
cd dichiarazione_impegni/
echo "Dichiarazione impegni"
latexmk -pdf dichiarazione_impegni.tex 1>/dev/null
mv dichiarazione_impegni.pdf ../out
latexmk -c
cd ..

# Lettera
cd lettera_candidatura/
echo "Lettera di candidatura"
latexmk -pdf lettera_candidatura.tex 1>/dev/null
mv lettera_candidatura.pdf ../out
latexmk -c
cd ..

# Verbali
cd verbali/
echo "Verbali"
mkdir -p out/
for D in `find ./* -type d -not -name "out" -not -name "src" -not -name "template_verbale"`
do
	echo $D
	cd $D
	latexmk -pdf verbale*.tex 1>/dev/null
	mv verbale*.pdf ../out
	latexmk -c
	cd ..
done
mv out/ ../out/verbali
