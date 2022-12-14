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
latexmk -pdf main.tex 1>/dev/null
mv main.pdf ../out/analisi_capitolati.pdf
latexmk -c 1>/dev/null
cd ..

# Dichirazione di impegni
cd dichiarazione_impegni/
echo "Dichiarazione impegni"
latexmk -pdf main.tex 1>/dev/null
mv main.pdf ../out/dichiarazione_impegni.pdf
latexmk -c 1>/dev/null
cd ..

# Lettera
cd lettera_candidatura/
echo "Lettera di candidatura"
latexmk -pdf main.tex 1>/dev/null
mv main.pdf ../out/lettera_candidatura.pdf
latexmk -c 1>/dev/null
cd ..

# Analisi requisiti
cd analisi_requisiti/
echo "Analisi requisiti"
latexmk -pdf main.tex 1>/dev/null
mv main.pdf ../out/analisi_requisiti.pdf
latexmk -c 1>/dev/null
cd ..

# Glossario
cd glossario/
echo "Glossario"
latexmk -pdf main.tex 2>/dev/null 1>/dev/null
mv main.pdf ../out/glossario.pdf
latexmk -c 1>/dev/null
rm main.gl* main.ist
cd ..

# Norme di progetto
cd norme_progetto/
echo "Norme progetto"
latexmk -pdf main.tex 2>/dev/null 1>/dev/null
mv main.pdf ../out/norme_progetto.pdf
latexmk -c 1>/dev/null
cd ..

# Verbali
cd verbali/
echo "Verbali"
mkdir -p out/
for D in `find ./* -type d -not -name "out" -not -name "src" -not -name "template_verbale"`
do
	ver=$(cut -c2- <<< $D)
	echo $ver
	cd $D
	latexmk -pdf main.tex 1>/dev/null
	mv main.pdf ../out/$ver.pdf
	latexmk -c 1>/dev/null
	cd ..
done
mv out/ ../out/verbali
