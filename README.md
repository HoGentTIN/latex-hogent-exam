# LaTeX sjabloon HoGent examenopgave

LaTeX-sjabloon voor examenopgave HoGent dat conform het "officiële" sjabloon (academiejaar 17-18).

- Kopieer `voorbeeldopgave.tex` naar een nieuw bestand of hernoem het
- `hogent-examen.sty` bevat de stijldefinitie, hier zijn in principe geen wijzigingen nodig
- Merk op dat PDF-bestanden in deze directory genegeerd worden door `.gitignore`. Pas dus `.gitignore` aan waneer je de PDFs in Git wil bijhouden.

Opmerkingen, verbeteringen, enz. zijn welkom! Maak een issue aan of stuur een pull-request.

## Genereren PDF opgaven en voorbeeldoplossingen

PDFs kunnen gegenereerd worden aan de hand van de `Makefile`. `make` zonder argumenten toont deze hulpboodschap, bv.:

```console
$ make
help                 Toon deze hulpboodschap
all                  Genereer alle opgaven
Opgave genereren: make NAAM.pdf
reeks1.pdf
reeks2.pdf
reeks3.pdf
Oplossing genereren: make NAAM-opl.pdf
reeks1-opl.pdf
reeks2-opl.pdf
reeks3-opl.pdf
```

**Let op:** het script gaat er van uit dat in het broncodebestand de oplossing *niet* getoond wordt:

```latex
\solutionfalse
```

Met het commando `make all` kan je PDFs genereren voor alle .tex-bestanden in de huidige directory (die elk de broncode voor een examenreeks bevatten). Zowel de examenopgave (NAAM.pdf) als de voorbeeldoplossing (NAAM-opl.pdf) worden aangemaakt. Blijf het commando herhalen zolang je in de uitvoer de gekende boodschap blijft zien:

```
LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.
```

Je kan ook individuele PDFs genereren voor opgaven met `make NAAM.pdf`, voor voorbeeldoplossingen met `make NAAM-opl.pdf`. Alle mogelijkheden worden getoond in de hulpboodschap.

```console
$ make reeks1.pdf
$ make reeks2-opl.pdf
```

