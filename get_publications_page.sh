#!/bin/bash

rm _pages/publications.html
bibtex2html -s assets/bib/mylib.bst -d -r -o _pages/publications assets/bib/mylib.bib
cp _pages/publications.html _pages/publications2.html
cp assets/bib/header.md _pages/publications2.html
cat _pages/publications.html >> _pages/publications2.html
sed 's/_pages/{{ site.baseurl }}\/assets\/bib/g' _pages/publications2.html > _pages/publications.html
sed 's/_pages/{{ site.baseurl }}\/assets\/bib/g' _pages/publications_bib.html > _pages/publications_bib2.html

rm _pages/publications2.html
mv _pages/publications_bib2.html _pages/publications_bib.html
mv _pages/publications_bib.html assets/bib/publications_bib.html
rm bibtex2html*
