#!/bin/bash

query="$1"
subject="$2"

blastn -query "$query" -subject "$subject" -task blastn-short -outfmt "6 sseq sseqid pident length" -out blast_output.txt

# Filter for perfect matches (100% identity and equal length)
awk -v OFS="\t" '$3 == 100 && $4 == 28 { print $0 }' blast_output.txt > output.txt

cat output.txt | wc -l
