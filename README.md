# Nick-seq
The repository contains R scripts for Nick-seq data processing. DOI: 10.1101/845768

# Description of the Nick-seq data processing pipeline
Sequencing results were processed on the Galaxy web platform (https://usegalaxy.org/). Initially,the paired-end reads were pre-processed by Trim Galore! to remove adapters, as well as trimming the first 3 bp on the 5’ end of read 1. All the reads were aligned to the corresponding genome using Bowtie 2. A custom method for peak calling of sequencing data was developed with BamTools, BEDTools and Rstudio. Briefly, the BamTools results were filtered based on R1 (selected for NT data) or R2 (selected for TdT data). The 5’ coverage (experiment sample and controls) or full coverage (controls) on each position were calculated based on the filtered BamTools results by BEDTools (positive and negative strand separately).

For both NT or TdT data on each strand, three “.tabular” files containing the genome position and their corresponding read coverage (sample_coverage_5.tabular, control_coverage_5.tabular, control_coverage_full.tabular) were analyzed and exported from Galaxy after the previous BEDTools. These data were used to normalize the read coverage by the sequencing depth and then calculate the read coverage ratio of specific position compared to its up- downstream position in the same sample and the same sample in negative controls by R.

Three ratios were calculated at each position by RStudio for modification site calling: coverage of position N (sample)/coverage of position N-1(sample), coverage of position N(sample)/coverage of position N+1(sample), and coverage of position N(sample)/coverage of position N(control). Positions with a ratio>1 were retained using the following R scripts: TdT_positive_strand.R TdT_negative_strand.R NT_positive_strand.R NT_negative_strand.R From these datasets, the intersection of the datasets from the NT and TdT methods were calculated using the following R scripts: TdT_positive+NT_negative.R TdT_negative+NT_positive.R The output files (CSV files; Excel format) contain the read coverage ratio information for the putative nick sites.

The ratio cutoffs can be varied in the Excel spreadsheet as needed. For example, for site-specific nicking by Nb. BsmI and Nb. BsrDI, we determined that a ratio >2 was adequate to capture nearly all sites, while for variable sites (PT) or unknown samples (H2O2), the ratio was increased to 5-10.




|title	|organism	|treatment	|role	|library prep|
| ------------- | ------------- |------------- |------------- |------------- |------------- |
|NOnickase-NT	|E.coli K12 DH10B	|none	|negative control	|R1-Nick translation|
|Nb.BsmI-nickase-NT	|E.coli K12 DH10B	|Nb.BsmI	|experiment sample 	|R1-Nick translation|
|Nb.BsmI-NO-TdT	|E.coli K12 DH10B	|none	|negative control	|R2-TdT dependent|
|Nb.BsmI-nickase-TdT	|E.coli K12 DH10B	|Nb.BsmI	|experiment sample 	|R2-TdT dependent|
|NbBsrDI-nickase-NT	|E.coli K12 DH10B	|Nb.BsrDI	|experiment sample 	|R1-Nick translation|
|NbBsrDI-NO-TdT	|E.coli K12 DH10B	|none	|negative control	|R2-TdT dependent|
|NbBsrDI-nickase-TdT	|E.coli K12 DH10B	|Nb.BsrDI	|experiment sample 	|R2-TdT dependent|

