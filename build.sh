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
latexmk -pdf analisi_capitolati.tex 1>/dev/null
mv analisi_capitolati.pdf ../out
latexmk -c 1>/dev/null
cd ..

# Dichirazione di impegni
cd dichiarazione_impegni/
echo "Dichiarazione impegni"
latexmk -pdf dichiarazione_impegni.tex 1>/dev/null
mv dichiarazione_impegni.pdf ../out
latexmk -c 1>/dev/null
cd ..

# Lettera
cd lettera_candidatura/
echo "Lettera di candidatura"
latexmk -pdf lettera_candidatura.tex 1>/dev/null
mv lettera_candidatura.pdf ../out
latexmk -c 1>/dev/null
cd ..

# Glossario
cd glossario/
echo "Glossario"
latexmk -pdf glossario.tex 2>/dev/null 1>/dev/null
mv glossario.pdf ../out
latexmk -c 1>/dev/null
rm glossario.gl* glossario.ist
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
	latexmk -c 1>/dev/null
	cd ..
done
mv out/ ../out/verbali
