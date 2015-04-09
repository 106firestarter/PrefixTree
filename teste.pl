use PrefixTree;
use strict;
use Data::Dumper;

my @files = qw ();
my $nArgs;
my $i = 0;
my $tree; 
my $saveFile = 'teste.txt';

	if(@ARGV) {

			foreach my $a (@ARGV) {
				$files[$i]= $a;
				$i++;
					}


			print "::Files::\n";	
			print @files;
			print "\n";
			$tree = PrefixTree->new(@files);
			#teste->save($saveFile);
			print Dumper(\$tree->{tree});

			if($tree->word_exists("ola")){
					print "Existe!";
				}


				
			$tree->get_words_with_prefix('a');	

	} else {
		print "Nao foram passados ficheiros como argumentos. \n";
		$tree = PrefixTree->new(@files);
		$tree->load($saveFile);
		print Dumper($tree);
		$tree->get_words_with_prefix('a');	
	}


