#!/bin/bash

query="$1"
subject="$2"
output="$3"


tblastn -query "$query" -subject "$subject" -outfmt "6 sseq sseqid pident length qlen" -out blast_output.txt

# Filter
awk -v OFS="\t" '$3 > 30 && $4 / $5 > 0.9 { print $0 }' blast_output.txt > "$output"

cat "$output" | wc -l

rm blast_output.txt
