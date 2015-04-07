package PrefixTree;
use strict;

sub new
{
	my $class = shift;
	my $file;
	my @lista;
	my $i=0;

	
	print "Creating new $class\n";

	my $self = { };
	bless $self;
	$self->{"filename"} = shift;
	
	open $file, "<", $self->{"filename"} or die "Erro na leitura!";
		while(<$file>)
		{
		chomp;
		$lista[$i]= $_;

		$i++;

		}

		close $file;

$i = 0;

while(<@lista>){
	$self->{"palavras"}[$i] = $lista[$i];
	print $self->{"palavras"}[$i];
	$i++;
	}

	return $self;
}

1;
