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
