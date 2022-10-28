#!/bin/sh
shopt -s expand_aliases
alias cleanup="rm *.aux *fdb_latexmk *.fls *.log *.out *.synctex.gz *.toc"

echo "Compilazioni documenti"
if [ -d "out" ]; then
	rm -rf out
fi
mkdir out

# Candidatura
# Analisi capitolati
cd analisi_capitolati/
echo "Analisi capitolati"
pdflatex analisi_capitolati.tex 1>/dev/null
pdflatex analisi_capitolati.tex 1>/dev/null # Seconda per avere indice 
mv analisi_capitolati.pdf ../out
cleanup 2>/dev/null
cd ..

# Dichirazione di impegni
cd dichiarazione_impegni/
echo "Dichirazione impegni"
pdflatex dichiarazione_impegni.tex 1>/dev/null
pdflatex dichiarazione_impegni.tex 1>/dev/null # Seconda per avere indice 
mv dichiarazione_impegni.pdf ../out
cleanup 2>/dev/null
cd ..

# Lettera
cd lettera_candidatura/
echo "Lettera di candidatura"
pdflatex lettera_candidatura.tex 1>/dev/null
mv lettera_candidatura.pdf ../out
cleanup 2>/dev/null
cd ..

# Verbali
cd verbali/
echo "Verbali"
mkdir -p out/
for D in `find ./* -type d -not -name "out" -not -name "src" -not -name "template_verbale"`
do
	echo $D
	cd $D
	pdflatex verbale*.tex 1>/dev/null
	pdflatex verbale*.tex 1>/dev/null
	mv verbale*.pdf ../out
	cleanup 2>/dev/null
	cd ..
done
mv out/ ../out/verbali
