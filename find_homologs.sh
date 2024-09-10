#!/bin/bash

query="$1"
subject="$2"
outputfile="$3"

tblastn -query "$query" -subject "$subject" -task blastn-short -outfmt "6 sseq sseqid pident length qlen" -out blast_output.txt

# Filter
awk -v OFS="\t" '$3 > 30 && $4 / $5 > 0.9 { print $0 }' blast_output.txt > "%$outputfile"

cat "$outputfile" | wc -l
