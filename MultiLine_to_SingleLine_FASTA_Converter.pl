#	SCRIPT BY NAMAN MANGUKIA
#	This script converts the multiline fasta file into a single-line fasta file

$arg1=$#ARGV+1;
if($arg1!=2)
{
	print "USAGE : perl	$0	<input-FASTA>	<output-FASTA>\n";
	exit 0;
}

open(IN,"$ARGV[0]");
open(OUT,">$ARGV[1]");
while (<IN>)
{
	if (/>/)
	{	chomp;$_=~s/[\r]//g;
		if ($. == 1)
		{
			print OUT "$_\n";
		}
		else {print OUT "\n$_\n";}
	}
	else
	{
		chomp;$_=~s/[ \t\n\r]//g;
		print OUT $_;
	}
}
close IN;


