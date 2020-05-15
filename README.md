# Nick-seq
The repository contains R scripts for Nick-seq data processing. DOI: 10.1101/845768. Here you will find R scripts used for data mining, access to the reads data and description of our workflow.

# Access to read data
The raw data of the format **.fq.gz** and **.tabular** has been released on NCBI GEO database with the assigned accession number GSE138173 (nickase site mapping), GSE138476 (DNA phosphorothioate modification mapping), GSE138070 (DNA damage mapping).
The table below outlined the descriptions of the data in GEO database.

**GSE138173 (nickase site mapping)**

|title	|organism	|treatment	|role	|library prep|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|NOnickase-NT	|E.coli K12 DH10B	|none	|negative control	|R1-Nick translation|
|Nb.BsmI-nickase-NT	|E.coli K12 DH10B	|Nb.BsmI	|experiment sample 	|R1-Nick translation|
|Nb.BsmI-NO-TdT	|E.coli K12 DH10B	|none	|negative control	|R2-TdT dependent|
|Nb.BsmI-nickase-TdT	|E.coli K12 DH10B	|Nb.BsmI	|experiment sample 	|R2-TdT dependent|
|NbBsrDI-nickase-NT	|E.coli K12 DH10B	|Nb.BsrDI	|experiment sample 	|R1-Nick translation|
|NbBsrDI-NO-TdT	|E.coli K12 DH10B	|none	|negative control	|R2-TdT dependent|
|NbBsrDI-nickase-TdT	|E.coli K12 DH10B	|Nb.BsrDI	|experiment sample 	|R2-TdT dependent|

**GSE138476 (DNA phosphorothioate modification mapping)**

|title	|organism	|treatment	|role	|library prep|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|S87-TdT-ctrl	|Salmonella enterica serovar Cerro 87	|none	|negative control	|R2-TdT dependent|
|S87-TdT-iodine	|Salmonella enterica serovar Cerro 87	|iodine	|experiment sample 	|R2-TdT dependent|
|S87-NT-ctrl	|Salmonella enterica serovar Cerro 87	|none	|negative control	|R1-Nick translation|
|S87-NT-iodine	|Salmonella enterica serovar Cerro 87	|iodine	|experiment sample 	|R1-Nick translation|

**GSE138070 (DNA damage mapping)**

|title	|organism	|treatment	|role	|library prep|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|0mM-NO-NT	|E.coli K12 DH10B	|none	|negative control	|R1-Nick translation|
|0mM-EndoIV-NT	|E.coli K12 DH10B	|none	|experiment sample 	|R1-Nick translation|
|0.2mM-NO-NT	|E.coli K12 DH10B	|H2O2	|negative control	|R1-Nick translation|
|0.2mM-EndoIV-NT	|E.coli K12 DH10B	|H2O2	|experiment sample 	|R1-Nick translation|
|0mM-NO-TdT	|E.coli K12 DH10B	|none	|negative control	|R2-TdT dependent|
|0mM-EndoIV-TdT	|E.coli K12 DH10B	|none	|experiment sample 	|R2-TdT dependent|
|0.2mM-NO-TdT	|E.coli K12 DH10B	|H2O2	|negative control	|R2-TdT dependent|
|0.2mM-EndoIV-TdT	|E.coli K12 DH10B	|H2O2	|experiment sample 	|R2-TdT dependent|

# Description of the Nick-seq data processing pipeline

## Step 1: 
**From raw .fq.gz data to .tabular data containing read coverage information on each position (on Galaxy website)**
Sequencing results were processed on the Galaxy web platform (https://usegalaxy.org/). Initially, the paired-end reads were pre-processed by **Trim Galore!** to remove adapters, as well as trimming the first 3 bp on the 5’ end of read 1. All the reads were aligned to the corresponding genome using tie 2. A custom method for peak calling of sequencing data was developed with **BamTools**, **BEDTools** and **Rstudio**. Briefly, the BamTools results were filtered based on R1 (selected for NT data) or R2 (selected for TdT data). The 5’ coverage (experiment sample and controls) or full coverage (controls) on each position were calculated based on the filtered **BamTools** results by **BEDTools** (positive and negative strand separately).

**Tools used:**

- Trim Galore!
- Bowtie 2
- BamTools
- BEDTools
- Rstudio

**GSE138173 (nickase site mapping)**

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|NOnickase-NT	|NOnickase-NT_5CoverageForward.tabular	|NOnickase-NT_5CoverageReverse.tabular	|NOnickase-NT_FullCoverageForward.tabular	|NOnickase-NT_FullCoverageReverse.tabular|
|Nb.BsmI-nickase-NT	|Nb.BsmI-nickase-NT_5CoverageForward.tabular	|Nb.BsmI-nickase-NT_5CoverageReverse.tabular	| 	| |
|Nb.BsmI-NO-TdT	|Nb.BsmI-NO-TdT_5CoverageForward.tabular	|Nb.BsmI-NO-TdT_5CoverageReverse.tabular	|Nb.BsmI-NO-TdT_FullCoverageForward.tabular	|Nb.BsmI-NO-TdT_FullCoverageReverse.tabular|
|Nb.BsmI-nickase-TdT	|Nb.BsmI-nickase-TdT_5CoverageForward.tabular	|Nb.BsmI-nickase-TdT_5CoverageReverse.tabular	| 	| |
|NbBsrDI-nickase-NT	|NbBsrDI-nickase-NT_5CoverageForward.tabular	|NbBsrDI-nickase-NT_5CoverageReverse.tabular	| 	| |
|NbBsrDI-NO-TdT	|NbBsrDI-NO-TdT_5CoverageForward.tabular	|NbBsrDI-NO-TdT_5CoverageReverse.tabular	|NbBsrDI-NO-TdT_FullCoverageForward.tabular	|NbBsrDI-NO-TdT_FullCoverageReverse.tabular|
|NbBsrDI-nickase-TdT	|NbBsrDI-nickase-TdT_5CoverageForward.tabular	|NbBsrDI-nickase-TdT_5CoverageReverse.tabular	| 	| |

**GSE138476 (DNA phosphorothioate modification mapping)**

 |sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|S87-TdT-ctrl	|S87-TdT-ctrl_5CoverageForward.tabular	|S87-TdT-ctrl_5CoverageReverse.tabular	|S87-TdT-ctrl_FullCoverageForward.tabular	|S87-TdT-ctrl_FullCoverageReverse.tabular|
|S87-TdT-iodine	|S87-TdT-iodine_5CoverageForward.tabular	|S87-TdT-iodine_5CoverageReverse.tabular	| 	| |
|S87-NT-ctrl	|S87-NT-ctrl_5CoverageForward.tabular	|S87-NT-ctrl_5CoverageReverse.tabular	|S87-NT-ctrl_FullCoverageForward.tabular	|S87-NT-ctrl_FullCoverageReverse.tabular|
|S87-NT-iodine	|S87-NT-iodine_5CoverageForward.tabular	|S87-NT-iodine_5CoverageReverse.tabular	| 	| |

**GSE138070 (DNA damage mapping)**

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|0mM-NO-NT	|0mM-NO-NT_5CoverageForward.tabular	|0mM-NO-NT_5CoverageReverse.tabular	|0mM-NO-NT_FullCoverageForward.tabular	|0mM-NO-NT_FullCoverageReverse.tabular|
|0mM-EndoIV-NT	|0mM-EndoIV-NT_5CoverageForward.tabular	|0mM-EndoIV-NT_5CoverageReverse.tabular	| 	| |
|0.2mM-NO-NT	|0.2mM-NO-NT_5CoverageForward.tabular	|0.2mM-NO-NT_5CoverageReverse.tabular	|0.2mM-NO-NT_FullCoverageForward.tabular	|0.2mM-NO-NT_FullCoverageReverse.tabular|
|0.2mM-EndoIV-NT	|0.2mM-EndoIV-NT_5CoverageForward.tabular	|0.2mM-EndoIV-NT_5CoverageReverse.tabular	| 	| |
|0mM-NO-TdT	|0mM-NO-TdT_5CoverageForward.tabular	|0mM-NO-TdT_5CoverageReverse.tabular	|0mM-NO-TdT_FullCoverageForward.tabular	|0mM-NO-TdT_FullCoverageReverse.tabular|
|0mM-EndoIV-TdT	|0mM-EndoIV-TdT_5CoverageForward.tabular	|0mM-EndoIV-TdT_5CoverageReverse.tabular	| 	| |
|0.2mM-NO-TdT	|0.2mM-NO-TdT_5CoverageForward.tabular	|0.2mM-NO-TdT_5CoverageReverse.tabular	|0.2mM-NO-TdT_FullCoverageForward.tabular	|0.2mM-NO-TdT_FullCoverageReverse.tabular|
|0.2mM-EndoIV-TdT	|0.2mM-EndoIV-TdT_5CoverageForward.tabular	|0.2mM-EndoIV-TdT_5CoverageReverse.tabular	| 	| |

For both NT or TdT data on each strand, three “.tabular” files containing the genome position and their corresponding read coverage (sample_coverage_5.tabular, control_coverage_5.tabular, control_coverage_full.tabular) were analyzed and exported from **Galaxy** following analysis in **BEDTools**. These data were used to normalize the read coverage by the sequencing depth and then calculate the read coverage ratio of a specific position compared to its up- downstream position in the same sample and the same sample in negative controls by R.

## Step 2: 
**Using R to calculate coverage ratios of each position and combine the NT result and TdT result.**

In detail, the .tabular files generated from Step 1 are used to calculate the coverage ratio of each position. Three ratios were calculated at each position by RStudio for modification site calling: coverage of position N (sample)/coverage of position N-1(sample), coverage of position N(sample)/coverage of position N+1(sample), and coverage of position N(sample)/coverage of position N(control). Positions with a ratio > 1 were obtained using the following R scripts: **TdT_positive_strand.R TdT_negative_strand.R NT_positive_strand.R NT_negative_strand.R**.  
From these datasets, the intersection of the datasets from the NT and TdT methods were calculated using the following R scripts: **TdT_positive+NT_negative.R TdT_negative+NT_positive.R**. The output files (CSV files; Excel format) contain the read coverage ratio information for the putative nick sites.

**For Nb.BsmI nickase mapping:**

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|NOnickase-NT	|NOnickase-NT_5CoverageForward.tabular	|NOnickase-NT_5CoverageReverse.tabular	|NOnickase-NT_FullCoverageForward.tabular	|NOnickase-NT_FullCoverageReverse.tabular|
|Nb.BsmI-nickase-NT	|Nb.BsmI-nickase-NT_5CoverageForward.tabular	|Nb.BsmI-nickase-NT_5CoverageReverse.tabular	| 	| |

The datasets as listed in the table above were used as input for R scripts: **NT_positive_strand.R NT_negative_strand.R.** to get the NT results of Nb.BsmI.

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|Nb.BsmI-NO-TdT	|Nb.BsmI-NO-TdT_5CoverageForward.tabular	|Nb.BsmI-NO-TdT_5CoverageReverse.tabular	|Nb.BsmI-NO-TdT_FullCoverageForward.tabular	|Nb.BsmI-NO-TdT_FullCoverageReverse.tabular|
|Nb.BsmI-nickase-TdT	|Nb.BsmI-nickase-TdT_5CoverageForward.tabular	|Nb.BsmI-nickase-TdT_5CoverageReverse.tabular	| 	| |

The datasets as listed in the table above were used as input for R scripts: **TdT_positive_strand.R TdT_negative_strand.R** to get the TdT results of Nb.BsmI.

Then the NT and TdT results analyzed and output by the previous R scripts were merged using **TdT_positive+NT_negative.R, TdT_negative+NT_positive.R**. The output files (CSV files; Excel format) contain the read coverage ratio information for the putative nick sites. 
The output data were further analized in excel and used for preparing final tables and figures: **Figure 2**, **Supplementary Table 2**.

**For Nb.BsrDI nickase mapping:**

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|NOnickase-NT	|NOnickase-NT_5CoverageForward.tabular	|NOnickase-NT_5CoverageReverse.tabular	|NOnickase-NT_FullCoverageForward.tabular	|NOnickase-NT_FullCoverageReverse.tabular|
|NbBsrDI-nickase-NT	|NbBsrDI-nickase-NT_5CoverageForward.tabular	|NbBsrDI-nickase-NT_5CoverageReverse.tabular	| 	| |

The datasets as listed in the table above were used as input for R scripts: **NT_positive_strand.R NT_negative_strand.R.** to get the NT results of Nb.BsrDI.

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|NbBsrDI-NO-TdT	|NbBsrDI-NO-TdT_5CoverageForward.tabular	|NbBsrDI-NO-TdT_5CoverageReverse.tabular	|NbBsrDI-NO-TdT_FullCoverageForward.tabular	|NbBsrDI-NO-TdT_FullCoverageReverse.tabular|
|NbBsrDI-nickase-TdT	|NbBsrDI-nickase-TdT_5CoverageForward.tabular	|NbBsrDI-nickase-TdT_5CoverageReverse.tabular	| 	| |

The datasets as listed in the table above were used as input for R scripts: **TdT_positive_strand.R TdT_negative_strand.R** to get the TdT results of Nb.BsrDI.
Then the NT and TdT results analyzed and output by the previous R scripts were merged using **TdT_positive+NT_negative.R**, **TdT_negative+NT_positive.R**. The output files (CSV files; Excel format) contain the read coverage ratio information for the putative nick sites. 
The output data were further analized in excel and used for preparing final tables and figures: **Supplementary Figure 1, Supplementary Table 3**.

**For PT mapping:**

**GSE138476 (DNA phosphorothioate modification mapping)**

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|S87-NT-ctrl	|S87-NT-ctrl_5CoverageForward.tabular	|S87-NT-ctrl_5CoverageReverse.tabular	|S87-NT-ctrl_FullCoverageForward.tabular	|S87-NT-ctrl_FullCoverageReverse.tabular|
|S87-NT-iodine	|S87-NT-iodine_5CoverageForward.tabular	|S87-NT-iodine_5CoverageReverse.tabular	| 	| |


The datasets as listed in the table above were used as input for R scripts: **NT_positive_strand.R NT_negative_strand.R.** to get the NT results of PT.

**GSE138476 (DNA phosphorothioate modification mapping)**

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|S87-TdT-ctrl	|S87-TdT-ctrl_5CoverageForward.tabular	|S87-TdT-ctrl_5CoverageReverse.tabular	|S87-TdT-ctrl_FullCoverageForward.tabular	|S87-TdT-ctrl_FullCoverageReverse.tabular|
|S87-TdT-iodine	|S87-TdT-iodine_5CoverageForward.tabular	|S87-TdT-iodine_5CoverageReverse.tabular	| 	| |

The datasets as listed in the table above were used as input for R scripts: **TdT_positive_strand.R TdT_negative_strand.R** to get the TdT results of PT.
Then the NT and TdT results analyzed and output by the previous R scripts were merged using **TdT_positive+NT_negative.R**, **TdT_negative+NT_positive.R**. The output files (CSV files; Excel format) contain the read coverage ratio information for the putative nick sites. 
The output data were further analyzed in excel and used for preparing final tables and figures: **Figure 3, Supplementary Table 4**.

**For AP site mapping:**

**At 0 mM H2O2(on genome):**

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|0mM-NO-NT	|0mM-NO-NT_5CoverageForward.tabular	|0mM-NO-NT_5CoverageReverse.tabular	|0mM-NO-NT_FullCoverageForward.tabular	|0mM-NO-NT_FullCoverageReverse.tabular|
|0mM-EndoIV-NT	|0mM-EndoIV-NT_5CoverageForward.tabular	|0mM-EndoIV-NT_5CoverageReverse.tabular	| 	| |

The datasets as listed in the table above were used as input for R scripts: **NT_positive_strand.R NT_negative_strand.R.** to get the NT results of 0 mM H2O2.

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|0mM-NO-TdT	|0mM-NO-TdT_5CoverageForward.tabular	|0mM-NO-TdT_5CoverageReverse.tabular	|0mM-NO-TdT_FullCoverageForward.tabular	|0mM-NO-TdT_FullCoverageReverse.tabular|
|0mM-EndoIV-TdT	|0mM-EndoIV-TdT_5CoverageForward.tabular	|0mM-EndoIV-TdT_5CoverageReverse.tabular	| 	| |


The datasets as listed in the table above were used as input for R scripts: **TdT_positive_strand.R TdT_negative_strand.R** to get the TdT results of 0 mM H2O2.
Then the NT and TdT results analyzed and output by the previous R script were merged using **TdT_positive+NT_negative.R, TdT_negative+NT_positive.R**. The output files (CSV files; Excel format) contain the read coverage ratio information for the putative nick sites. 
The output data were further analyzed in excel and used for preparing final tables and figures: **Figure 4, Supplementary Table 5**.

**At 0.2 mM H2O2(on genome):**

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|0.2mM-NO-NT	|0.2mM-NO-NT_5CoverageForward.tabular	|0.2mM-NO-NT_5CoverageReverse.tabular	|0.2mM-NO-NT_FullCoverageForward.tabular	|0.2mM-NO-NT_FullCoverageReverse.tabular|
|0.2mM-EndoIV-NT	|0.2mM-EndoIV-NT_5CoverageForward.tabular	|0.2mM-EndoIV-NT_5CoverageReverse.tabular	| 	| |

The datasets as listed in the table above were used as input for R scripts: **NT_positive_strand.R NT_negative_strand.R.** to get the NT results of 0.2 mM H2O2.

|sample	|processed data file: 5’ coverage_positive strand 	|processed data file: 5’ coverage_negative strand	|processed data file: full coverage_positive strand 	|processed data file: full coverage_negative strand|
| -------------	| -------------	| -------------	| -------------	| ------------- |
|0.2mM-NO-TdT	|0.2mM-NO-TdT_5CoverageForward.tabular	|0.2mM-NO-TdT_5CoverageReverse.tabular	|0.2mM-NO-TdT_FullCoverageForward.tabular	|0.2mM-NO-TdT_FullCoverageReverse.tabular|
|0.2mM-EndoIV-TdT	|0.2mM-EndoIV-TdT_5CoverageForward.tabular	|0.2mM-EndoIV-TdT_5CoverageReverse.tabular	| 	| |

The datasets as listed in the table above were used as input for R scripts: **TdT_positive_strand.R TdT_negative_strand.R** to get the TdT results of 0.2 mM H2O2.
Then the NT and TdT results analyzed and output by the previous R script were merged using **TdT_positive+NT_negative.R**, **TdT_negative+NT_positive.R**. The output files (CSV files; Excel format) contain the read coverage ratio information for the putative nick sites. 
The output data were further analyzed in excel and used for preparing final tables and figures: **Figure 4, Supplementary Figure 2, Supplementary Table 5**.

The same workfflow is applied for analyzing AP site on plasmid except for using a different reference sequence in **Bowtie2** with the plasmid sequence. The final outputs were analyzed in excel and used for preparing the final tables and figures: **Figure 4, Table 2, Supplementary Figure 2, Supplementary Table 6**.



