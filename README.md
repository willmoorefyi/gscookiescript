# Script to Extract cookeie data from PDF

Probably only useful in DC council.

## How to use

- use `pdftotext` to convert pdf to txt file

```
pdftotext -layout CookiePromiseParticipantSupporterByOrderLevelSales.pdf cookies.txt
```

- Remove blank lines (e.g. `cat cookies.txt | egrep -v '^\s*$' > cookies2.txt`)
- Strip header lines (e.g. `tail -n +21 <cookies2.txt > cookies3.txt`)
- Remove "Page" lines (e.g. `cat cookies3.txt | egrep -v "^\s*Page\s*\d*" > cookies4.txt`)
- Remove any special characters (just use an editor)

Finally, run the program
```
./cookie.rb > cookie.csv
```

use excel to convert the pipe-delimited result into a spreadsheet
