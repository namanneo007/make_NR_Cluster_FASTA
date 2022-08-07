#	SCRIPT BY NAMAN MANGUKIA
#	This script is designed to remove 100% identical sequence duplicates in FASTA file
#	This script also shows the clusterd sequences using HEADER information
#	The input sequence is must be in 1-line FASTA format i.e each FASTA record must have the sequence information in 1-line

$arg1=$#ARGV+1;
if($arg1!=3)
{
	print "USAGE : perl	$0	<input-FASTA>	<outfile-FASTA>	<outfile-Clustered-file>\n";
	exit 0;
}

%hash_nr=();
open(IN,"$ARGV[0]");
while(<IN>)
{
	if(/^>/)
	{
		chomp;
		$head='';
		$head=$_;
	}
	else
	{
		chomp;
		$hash_nr{$_}=$head."\n".$_."\n";
	}
}
close IN;

open(OUT1,">$ARGV[1]");
foreach $line (keys %hash_nr)
{
	print OUT1 $hash_nr{$line};
}
close OUT1;

open(OUT2,">$ARGV[2]");
foreach $line (keys %hash_nr)
{
	$join1='';
	open(IN,"$ARGV[0]");
	while(<IN>)
	{
		if(/^>/)
		{
			chomp;$head='';$head=$_;$head=~s/>//;
		}
		else
		{
			chomp;
			if($line eq $_){$join1.=$head."\t";}
		}
	}
	close IN;
	$join1=~s/\t$//;
	print OUT2 $join1."\n";	
}
close OUT2;


