# LaTeX sjabloon HoGent examenopgave

LaTeX-sjabloon voor examenopgave HoGent, conform aan "officieel" sjabloon (academiejaar 17-18).

- Kopieer `voorbeeldopgave.tex` naar een nieuw bestand
- `hogent-examen.tex` bevat de stijldefinitie, hier zijn in principe geen wijzigingen nodig
- Merk op dat PDF-bestanden genegeerd worden door `.gitignore`

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

Met het commando `make all` kan je PDFs genereren voor alle .tex-bestanden (elk met een examenopgave), zowel de examenopgave (NAAM.pdf) als voorbeeldoplossing (NAAM-opl.pdf). Blijf dit herhalen zolang je in de uitvoer de gekende boodschap blijft zien:

```
LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.
```

Je kan ook individuele PDFs genereren voor opgaven met `make NAAM.pdf`, voor voorbeeldoplossingen met `make NAAM-opl.pdf`. Alle mogelijkheden worden getoond in de hulpboodschap.

```console
$ make reeks1.pdf
$ make reeks2-opl.pdf
```
