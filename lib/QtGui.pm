package QtGui;

use 5.008000;
use strict;
use warnings;

require Exporter;
require DynaLoader;

our @ISA = qw(DynaLoader Exporter);
our $VERSION = '4.001';

our @EXPORT = qw(qref);
our @EXPORT_OK = @EXPORT;


# find in Win32::Gui  :)
sub bootstrap_subpackage {
    my($package) = @_;
    $package = 'Qt::' . $package;
    my $symbol = $package;
    $symbol =~ s/\W/_/g;
    no strict 'refs';
    DynaLoader::dl_install_xsub(
        "${package}::bootstrap",
        DynaLoader::dl_find_symbol_anywhere( "boot_$symbol" )
    );
    &{ "${package}::bootstrap" };
}


bootstrap QtGui $VERSION;

# Preloaded methods go here.

sub qref {
    my $q = shift;
    return "" unless ref($q);
    my $r = ref($q);
    if ( $r eq 'SCALAR' ) {
	return 'S';}
    elsif ( $r eq 'ARRAY' ) {
	return 'A';}
    elsif ( $r eq 'HASH' ) {
	return 'H';}
    elsif ( $r eq 'REF' ) {
	return 'R';}
    else {
	return "O"; }
}

1;

__END__

=head1 QtCore

QtGui is a library for working with Qt4 QtGui in Perl.

=head1 SYNOPSIS

    use Qt::QString;
    use Qt::QApplication;
    use Qt::QPushButton;

    unshift @ARGV, 'tutorial_1';

    my $app = QApplication(\@ARGV);
    my $hello = QPushButton(QString("Hello world!"));
    $hello->resize(100,30);
    $hello->show();
    $app->exec();
    
    # See other instances in examples directory.

=head1 DESCRIPTION

Creating this library we aimed to use the Perl functionality as much as possible,
but to make the syntax similar to C++ Qt4.
This allows to use the original Qt4 documentation.
All the list classes (QVector,QList) are replaced by the Perl arrays.
All the associated arrays (QMap,QHash,QPair) are replaced by Perl hashes.
The classes of modules are completely coincide with the corresponding  ones of C++ Qt4.
One can use all the protected functions from the object classes (QObject children)
except of those that use *Private classes as input parameter.

It's advisable to study the examples attached before writing programs.

=head2 EXPORT

None by default.

=head1 SEE ALSO

Qt Reference Documentation http://doc.trolltech.com/

=head1 AUTHOR

Vadim Likhota, E<lt>vadim-lvv@yandex.ruE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2007-2008 by Vadim Likhota

This library is free software;
you can redistribute Perl/Qt4 modules under the GPL2 or any other Qt4 licencies.

=cut
