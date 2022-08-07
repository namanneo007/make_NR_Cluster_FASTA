# make_NR_Cluster_FASTA
This perl script remove 100% identical duplicates with keeping one representative from FASTA sequences.
It requires the input FASTA file in single line format i.e. each FASTA sequence in the input file must be present in a single line.
A supplementary perl script "MultiLine_to_SingleLine_FASTA_Converter.pl" is provided to generate single line FASTA file from Multi line FASTA file.

USAGE
perl <program-name> <input-FASTA>	<outfile-FASTA>	<outfile-Clustered-file>
  Means, this file requires 1 input FASTA file and 2 outfiles' name from user.
  <input-fasta> : single-line format FASTA file
  <outfile-FASTA>	: output FASTA file name
  <outfile-Clustered-file> : output cluster file name
    
Example:
_____________
Input1.fasta

>Seq1
ATGC
>Seq2
TGGA
>Seq3
ATTGAGG
>Seq4
TGGA
>Seq5
ATGC
>Seq6
TGGA
>Seq7
ATGC

____________________
Running the program

perl make_NR_Cluster_FASTA.pl Input1.fasta Output1.fasta Output1_cluster.txt

_______________
Output1. fasta

>Seq6
TGGA
>Seq7
ATGC
>Seq3
ATTGAGG

____________________
Output1_cluster.txt

Seq2	Seq4	Seq6
Seq1	Seq5	Seq7
Seq3

Additional Information:
This program will keep the last occurred identical sequence of a cluster in the result file.

The above example files are also provided in this package to test a sample.

Additional Information:
This program will keep the last occurred identical sequence of a cluster in the result file. The order of the representative sequences may vary but it will make the result file non-redundant.

    
