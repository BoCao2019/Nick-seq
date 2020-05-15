# Nick-seq
The repository contains R scripts for Nick-seq data processing. DOI: 10.1101/845768. Here you will find scripts used to generate our data and figures, access to the reads data, and summaries of our results.

# Description of the Nick-seq data processing pipeline
Access to read data
You can find the raw .fq.gz data and .tabular generate before running it using R on NCBI GEO database under GSE138173 (nickase site mapping), GSE138476 (DNA phosphorothioate modification mapping), GSE138070 (DNA damage mapping).
Here is the sample description for the different samples in GEO database.
GSE138173 (nickase site mapping)
|title	|organism	|treatment	|role	|library prep|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|NOnickase-NT	|E.coli K12 DH10B	|none	|negative control	|R1-Nick translation|
|Nb.BsmI-nickase-NT	|E.coli K12 DH10B	|Nb.BsmI	|experiment sample 	|R1-Nick translation|
|Nb.BsmI-NO-TdT	|E.coli K12 DH10B	|none	|negative control	|R2-TdT dependent|
|Nb.BsmI-nickase-TdT	|E.coli K12 DH10B	|Nb.BsmI	|experiment sample 	|R2-TdT dependent|
|NbBsrDI-nickase-NT	|E.coli K12 DH10B	|Nb.BsrDI	|experiment sample 	|R1-Nick translation|
|NbBsrDI-NO-TdT	|E.coli K12 DH10B	|none	|negative control	|R2-TdT dependent|
|NbBsrDI-nickase-TdT	|E.coli K12 DH10B	|Nb.BsrDI	|experiment sample 	|R2-TdT dependent|
GSE138476 (DNA phosphorothioate modification mapping)
