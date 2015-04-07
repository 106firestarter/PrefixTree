my $file;
my @lista;
my $i=0;

open $file, "<", "dicio.txt" or die "Erro na leitura!";
while(<$file>)
{
chomp;
$lista[$i]= $_;

$i++;

}

close $file;
