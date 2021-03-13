#
# utf8html.pl: Convert Literal UTF-8 characters to HTML characters
#   0.01: 2021-03-14 Yutaka Sasaki@TTI
#   License: GPL2.0
# 
# Usage: uti8html.pl < file_with_literal_utf8_chars > file_with_HTML_chars
#

printf( stderr "utf8html.pl (v0.01) Yutaka Sasaki, TTI\n\n" );

$table_file = "UTF8HTML-table.txt";

@before = ();
@after = ();

# --- Read conversion table ---

open(IN, "< $table_file") || die "$! $table_file";
while ($line=<IN>) {
    chomp( $line );
    if ( $line =~ /^\\x/ ) {
	@item = split( /\t/, $line );
	printf( stderr "[$item[0]] --> [$item[1]]\n" );
	push( @before, quotemeta($item[0]) );
	push( @after, $item[1] );
    }
}
close( IN );

printf( stderr $#before." conversion pairs have been read.\n");

# --- Convert each line ---

while ($line=<STDIN>){
    chomp( $line );
    for( my $i=0 ; $i<=$#before ; $i++ ){
	my $s = $before[$i];
	my $t = $after[$i];
	$line =~ s/$s/$t/g;
    }
    print( "$line\n" );
}

# end of code
