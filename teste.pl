use PrefixTree;
use strict;
use Data::Dumper;

#my $teste = PrefixTree->new('dicio.txt');
my @files = qw ();
my $nArgs;
my $i = 0;

	if(@ARGV) {

foreach my $a (@ARGV) {
	$files[$i]= $a;
	$i++;
		}

	} else {
		print "Não foram passados passados ficheiros como argumentos.";

	}
print "::Files::\n";	
print @files;
print "\n";
my $teste = PrefixTree->new(@files);