# LaTeX sjabloon HoGent examenopgave

LaTeX-sjabloon voor examenopgave HoGent conform het "officiële" sjabloon (academiejaar 19-20) zoals [gepubliceerd op het hnet](https://hnet.hogent.be/themas/ik-geef-les/examens-en-evaluatie/).

- Kopieer `voorbeeldopgave.tex` of `example-exam.tex` naar een nieuw bestand of hernoem het.
- `hogent-exam.cls` bevat de stijldefinitie, hier zijn in principe geen wijzigingen nodig.
- Merk op dat PDF-bestanden in deze directory genegeerd worden door `.gitignore`. Pas dus `.gitignore` aan waneer je de PDFs in Git wil bijhouden.
- Gebruik XeLaTeX voor het compileren. Dit sjabloon maakt o.a. gebruik van TTF-lettertypes (Arial en Courier New), wat niet ondersteund wordt door `pdflatex`.

Opmerkingen, verbeteringen, enz. zijn welkom! Maak een issue aan of stuur een pull-request.

## Taal: Nederlands en Engels

Het sjabloon voorziet de mogelijkheid om een examenopgave hetzij in het Nederlands (standaard), hetzij in het Engels op te stellen. In het laatste geval geef je de optie `english` mee bij de documentclass-definitie:

```latex
\documentclass[english]{hogent-exam}
```

## Gebruik van hulpmiddelen tijdens het examen

Gebruik het commando `\Supports` om aan te geven of studenten al dan niet gebruik mogen maken van hulpmiddelen. Indien ze er geen mogen gebruiken, schrijf je het volgende:

```latex
\Supports{}
```

In de opgave komt een gepaste boodschap.

Als studenten wel gebruik mogen maken van hulpmiddelen kan je dat bv. op deze manier invoegen:

```latex
\Supports{%
  \begin{itemize}
    \item Rekenmachine
    \item Formulariom
  \end{itemize}
}
```

## Examenrichtlijnen

Voeg de algemene richtlijnen voor elk examen (zoals in het originele sjabloon gespecifieerd) toe met:

```latex
\Instructions{}
```

Indien je extra instructies wil toevoegen, dan kan dat ook. De instructies worden toegevoegd aan een tabel, dus je moet de juiste markup gebruiken. Meer bepaald moet voor een correct resultaat elke regel voorafgegaan worden door `\midrule` en afgesloten worden met `\\`.

```latex
\Instructions{%
  \midrule
  \textbf{Kijk a.u.b.~je antwoorden grondig na voor indienen.} \\
  \midrule
  Als het antwoord op een vraag een reëel getal is, rond dat telkens af tot vier cijfers na de komma. Niet drie. Niet vijf. \textbf{Vier.} \\
}
```

## Kladruimte toevoegen

Indien gewenst kan je als laatste bladzijde kladruimte invoegen. Gebruik hiervoor het commando `\ScratchNotes` net voor het einde van het document.

## Voorbeeldoplossing

Om een voorbeeldoplossing te genereren, verander je `\solutionfalse`, in `\solutiontrue`. Elementen die niet van belang zijn voor de voorbeeldoplossing (invullijnen voor studentnaam en dergelijke, exameninstructies, kladruimte, enz.) worden dan verborgen.

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

Met het commando `make all` kan je PDFs genereren voor alle .tex-bestanden in de huidige directory (die elk de broncode voor een examenreeks bevatten). Zowel de examenopgave (NAAM.pdf) als de voorbeeldoplossing (NAAM-opl.pdf) worden aangemaakt.

Je kan ook individuele PDFs genereren voor opgaven met `make NAAM.pdf`, voor voorbeeldoplossingen met `make NAAM-opl.pdf`. Alle mogelijkheden worden getoond in de hulpboodschap.

```console
$ make reeks1.pdf
$ make reeks2-opl.pdf
```

## Lettertypes

Dit sjabloon maakt gebruik van de lettertypes Arial en Courier New, waarvan verondersteld wordt dat deze al geïnstalleerd zijn. Linux-gebruikers kunnen deze installeren via het `msttcorefonts` package. Omdat Arial niet geschikt is voor wiskundige formules, wordt in plaats daarvan [Fira Math](https://github.com/firamath/firamath) gebruikt. Het lettertype (in OTF-formaat) is meegeleverd voor het geval het nog niet geïnstalleerd is op je systeem.
