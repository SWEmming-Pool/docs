#!/bin/sh
shopt -s expand_aliases

# Alias
alias compile='latexmk -pdf -pdflatex="pdflatex -shell-escape"'
alias clean='latexmk -c 1>/dev/null'

echo "Compilazioni documenti"
if [ -d "out" ]; then
	rm -rf out
fi
mkdir out

# Candidatura
# Analisi capitolati
cd analisi_capitolati/
echo "Analisi capitolati"
compile main.tex 1>/dev/null
mv main.pdf ../out/analisi_capitolati.pdf
clean
cd ..

# Dichirazione di impegni
cd dichiarazione_impegni/
echo "Dichiarazione impegni"
compile main.tex 1>/dev/null
mv main.pdf ../out/dichiarazione_impegni.pdf
clean
cd ..

# Lettera
cd lettera_candidatura/
echo "Lettera di candidatura"
compile main.tex 1>/dev/null
mv main.pdf ../out/lettera_candidatura.pdf
clean
cd ..

# Analisi requisiti
cd analisi_requisiti/
echo "Analisi requisiti"
compile main.tex 1>/dev/null
mv main.pdf ../out/analisi_requisiti.pdf
clean
cd ..

# Glossario
cd glossario/
echo "Glossario"
compile main.tex 2>/dev/null 1>/dev/null
mv main.pdf ../out/glossario.pdf
clean
rm main.gl* main.ist
cd ..

# Norme di progetto
cd norme_progetto/
echo "Norme progetto"
compile main.tex 2>/dev/null 1>/dev/null
mv main.pdf ../out/norme_progetto.pdf
clean
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
	compile main.tex 1>/dev/null
	mv main.pdf ../out/$ver.pdf
	clean
	cd ..
done
mv out/ ../out/verbali
