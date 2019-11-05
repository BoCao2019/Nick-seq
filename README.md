# Nick-seq
The repository contains R scripts for Nick-seq data processing.
# Description of the Nick-seq data processing pipeline
Raw Illumina Sequencing results were processed on the Galaxy web platform (https://usegalaxy.org/). Initially, the paired-end reads were pre-processed by trim galore to remove adapters and the first 3 bp on the 5’ of read 1. All the reads were aligned to the corresponding genome using Bowtie 2. The bam results were filtered based on R1 (selected for NT data) or R2 (selected for TdT data). The 5’ coverages (experiment sample and controls) or full coverages (controls) on each position were calculated based on the filtered bam result by BEDTools (positive and negative strand separately). For each specific part (NT or TdT) on each strand, we will get three “.tabular” files containing the genome position and their corresponding read coverage (sample_coverage_5.tabular, control_coverage_5.tabular, control_coverage_full.tabular). Download these files from Galaxy web platform and process these files using R.
First, we normalized the read coverage by sequencing depth and calculate the read coverage ratio of specific position compare to its up- downstream position in the same sample and the same sample in negative controls, keep the positions with ratio>1 using the following R scripts.
TdT_positive_strand.R
TdT_negative_strand.R
NT_positive_strand.R
NT_negative_strand.R

Then we find the intersection part of NT and TdT method using the following R scripts.
TdT_positive+NT_negative.R
TdT_negative+NT_positive.R

Output files are CSV files containing read coverage ratio information for those “possible nick sites”. These files can be opened by excel. We can set different ratio cutoffs in the excel for final results depend on sample type.(For nick enzyme created nick sites, ratio>2 is enough, for unknown samples, increase the ratio to 5-10.)

