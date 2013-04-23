# NAME

Cot::Plugin::TX - It is a Text::Xslate View module for Cot framework.

# SYNOPSIS

    use Cot;
    use Cot::Plugin qw/TX/;

    get '/' => sub {
        my $self = shift;
        $self->res->status(200);
        $self->res->headers({'Content-Type' => 'text/html', charset => 'utf8'});
        my $out = $self->tx->output('index.tmpl',{sample:'hello world!'});
        $self->res->body($out);
    };

# FUNCTIONS

## output

Template file must be installed in __$ENV{COT\_ROOT}/tmpl__ dir.
First argument is templatefile path relative to __$ENV{COT\_ROOT}/tmpl__.
Second argument is parameters.
After arguments is Text::Xslate options.

    my $out = $self->tx->output('index.tmpl',
                                {sample:'hello world!'},
                                syntax => 'TTerse',);

# DESCRIPTION

Cot::Plugin::TX - It is a Text::Xslate View module for Cot framework.

# LICENSE

Copyright (C) Yusuke Shibata

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Yusuke Shibata <shibata@yusukeshibata.jp>
