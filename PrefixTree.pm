package PrefixTree;
use strict;
use Data::Dumper;


sub new
{
	my $class = shift;
	my (@nomeFiles) = @_;

	my $nFiles = @nomeFiles;

	my $file;
	my @lista;
	my $i=0;
	my $f = 0;
	
	print "::Creating new $class ::\n";

	my $self= bless {tree => {}};


	$self->add_dict(@nomeFiles);


# while($f < $nFiles){
		
# 		$i = 0;
# 		open $file, "<", $nomeFiles[$f] or die "Erro na leitura!";
# 				while(<$file>)
# 				{
# 				chomp;
# 				$lista[$i]= $_;

# 				$i++;

# 				}

# 				close $file;

# 		$i = 0;

# 		while(<@lista>){
# 			$self->add_word($lista[$i]);
# 			$i++;
# 			}
	
# 	$f++;

# }
	





$self->rem_word("pica");

if($self->word_exists("ola")){
	
}
my $asd = 'a';
$self->get_words_with_prefix($asd);


print Dumper(\$self->{tree});
	return $self;
}

sub aux_remove{

	my @aux;
	my ($self, $hash) = @_;
	if(exists ($hash->{'palavra'}) && keys $hash == 1){
		print "Pode mandar para o lixo";
		
		return 1;
	}
	else {if(keys $hash == 1){
		@aux = keys $hash;
		return $self->aux_remove($hash->{$aux[0]});
	}
	else{
		return 0;
	}
}

}

sub rem_word{

	my ($self, $palavra) = @_;

	my $hash = $self->{tree};
	my $letra;
	my $res = 1;
	my $aux;
	my $flag = 1;
	my $aux2;
	for $letra (split //, $palavra){
		if($flag){
		
		
			if($self->aux_remove($hash->{$letra}) == 1){
				$aux2 = $letra;
				
				$flag = 0;
				
			}
			else{
				$aux = $hash;
			$hash = $hash->{$letra};
		}
	}
		}

		delete $hash->{$aux2};
		


	}



sub add_word{
my ($self, $palavra) = @_;
my $hash = $self->{tree};
my $i = 0;

	my $aux;
	
	for $aux (split //, $palavra) {
		

		if( exists ($hash->{$aux}) ){}
		else{
		$hash->{$aux} = {};}

		$hash =  $hash->{$aux};

	}
	$hash->{'palavra'} = {};


}

sub add_dict{

my ($self, @nomeFiles) = @_;

	my $nFiles = @nomeFiles;
	my $f = 0;
	my $file;
	my @lista;
	my $i = 0;

while($f < $nFiles){
	$i = 0;

	if($nomeFiles[$f]=~ /w+\.gz/ ){

		open $file, "gunzip -c $nomeFiles[$f] |" or die "Erro na leitura!";
				while(<$file>)
				{
				chomp;
				$lista[$i]= $_;

				$i++;

				}

				close $file;

		$i = 0;

		while(<@lista>){
			$self->add_word($lista[$i]);
			$i++;
			}
	}

	else {

		if($nomeFiles[$f]=~ /w+\.bz2/ ){

			open $file, "bunzip2 -c $nomeFiles[$f] |" or die "Erro na leitura!";
				while(<$file>)
				{
				chomp;
				$lista[$i]= $_;

				$i++;

				}

				close $file;

		$i = 0;

		while(<@lista>){
			$self->add_word($lista[$i]);
			$i++;
			}
	

	}else{
		open $file, "<", $nomeFiles[$f] or die "Erro na leitura!";
				while(<$file>)
				{
				chomp;
				$lista[$i]= $_;

				$i++;

				}

				close $file;

		$i = 0;

		while(<@lista>){
			$self->add_word($lista[$i]);
			$i++;
			}
	
	

		}
	}
		$f++;
	}
}

sub prefix_exists{

my ($self, $prefix) = @_;

	my $hash = $self->{tree};
	my $letra;
	my $res = 1;
	for $letra (split //, $prefix){
		if(exists ($hash->{$letra})){
			$hash = $hash->{$letra};
		}
		else{
			$res = 0;
			last;
		}


	}

	return $res;

}


sub word_exists{

my ($self, $prefix) = @_;

	my $hash = $self->{tree};
	my $letra;
	my $res = 1;
	for $letra (split //, $prefix){
		if(exists ($hash->{$letra})){
			$hash = $hash->{$letra};
		}
		else{
			$res = 0;
			last;
		}
		

	}
if(!exists ($hash->{'palavra'})){
			$res = 0;
		}
	return $res;

}

sub aux_prefix{

	my ($self, $listapalavras, $auxprefix, $hash) = @_;

	my @lista = @{$listapalavras};
	
	

	
	my $auxinha;
	my $nfilhos;
	my @nomefilhos;
	my $i = 0;
	if(exists ($hash->{'palavra'})){
		
		push @$listapalavras, $auxprefix;
		#print $lista[$cenas];
		
	

	}
	$nfilhos = keys $hash;
	@nomefilhos = keys $hash;

	
	
	while($i<$nfilhos){
		$auxinha = $auxprefix . $nomefilhos[$i];
		$self->aux_prefix(\@$listapalavras,$auxinha,$hash->{$nomefilhos[$i]});
		$i++;
	}


}



sub get_words_with_prefix{

my ($self, $prefix) = @_;

	my $hash = $self->{tree};
	my $letra;
	my @listapalavras = qw ();
	my $auxprefix = $prefix;
	my $palavra;
	my $i = 0;
	my $cont;

	if ($self->prefix_exists($prefix)){
		
		for $letra (split //, $prefix){
				$hash = $hash->{$letra};

		}
		
		$self->aux_prefix(\@listapalavras,$auxprefix,$hash);


		foreach (@listapalavras){
			print $_;
			print "\n";
		}

	}else{


	}

	

}




1;
