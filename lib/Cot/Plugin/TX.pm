package Cot::Plugin::TX;
use strict;
use warnings;
use 5.008005;
our $VERSION = "0.01";
use Text::Xslate;
use File::Spec ();
use parent qw(Cot::Plugin);

sub init {
    my ( $self, $c ) = @_;
    $c->tx($self);
}

sub _root {
    File::Spec->catdir( $ENV{COT_ROOT} || '.', 'tmpl' );
}

sub output {
    my $self          = shift;
    my $txfile        = shift;
    my $param         = shift;
    my %param_for_new = @_;
    my $tx            = Text::Xslate->new(
        path      => [ __PACKAGE__->_root ],
        cache_dir => $ENV{TMPDIR} || '/tmp',
        %param_for_new,
    );
    $tx->render( $txfile, $param );
}

1;
__END__

=encoding utf-8

=head1 NAME

Cot::Plugin::TX - It is a Text::Xslate View module for Cot framework.

=head1 SYNOPSIS

    use Cot;
    use Cot::Plugin qw/TX/;

    get '/' => sub {
        my $self = shift;
        $self->res->status(200);
        $self->res->headers({'Content-Type' => 'text/html', charset => 'utf8'});
        my $out = $self->tx->output('index.tmpl',{sample:'hello world!'});
        $self->res->body($out);
    };

=head1 FUNCTIONS

=head2 output

Template file must be installed in B<$ENV{COT_ROOT}/tmpl> dir.
First argument is templatefile path relative to B<$ENV{COT_ROOT}/tmpl>.
Second argument is parameters.
After arguments is Text::Xslate options.

    my $out = $self->tx->output('index.tmpl',
                                {sample:'hello world!'},
                                syntax => 'TTerse',);

=head1 DESCRIPTION

Cot::Plugin::TX - It is a Text::Xslate View module for Cot framework.

=head1 LICENSE

Copyright (C) Yusuke Shibata

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Yusuke Shibata E<lt>shibata@yusukeshibata.jpE<gt>

