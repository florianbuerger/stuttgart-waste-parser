# doesn't work anymore

>Sehr geehrte Bürgerinnen und Bürger,
>
>ab dem 1. Januar 2014 ist SITA nicht mehr zuständig für die Sammlung der gelben Säcke in Stuttgart. Dieser Abfuhrkalender steht daher ab dem 1. Januar 2014 nicht mehr zur Verfügung.
>
>Ihre neuen Ansprechpartner sowie die Abfuhrtage entnehmen Sie bitte den örtlichen Medien oder den Informationsplattformen der AWS (Abfallentsorgung Stuttgart). 
>
>Wir wünschen Ihnen eine schöne Weihnachtszeit und einen guten Rutsch.
>Ihr SITA-Team
>

# stuttgart-waste-parser

A Ruby script to create iCal file for waste calendar in stuttgart, germany

## Installation

```bash
git clone git@github.com:pfleidi/stuttgart-waste-parser.git
cd stuttgart-waste-parser
bundle install
```

## Usage

```
Usage: waste-parser.rb [options]
    -z, --zipcode ZIPCODE            Your zipcode
    -s, --street STREET              Your street
    -o, --outfile FILE               The file to write to
```

The file will, by default, be created at ~/Desktop/waste.ics

Default alert time is 7 pm the day before
