package Iglu::LMLM::Types::Iglu;

use strict;

use Mail::LMLM::Types::Ezmlm;

use vars qw(@ISA);

@ISA=qw(Mail::LMLM::Types::Ezmlm);

sub initialize
{
    my $self = shift;

    $self->SUPER::initialize(@_);

    if (! exists($self->{'hostname'}) )
    {
        $self->{'hostname'} = "iglu.org.il";
    }
}

sub get_homepage
{
    my $self = shift;

    if ( exists($self->{'homepage'}) )
    {
        return $self->{'homepage'};
    }
    else
    {
        return "http://www.iglu.org.il/";
    }
}

sub get_online_archive
{
    my $self = shift;

    if ( exists($self->{'online_archive'}) )
    {
        return $self->{'online_archive'};
    }
    else
    {
        return "http://www.mail-archive.com/" .
            $self->get_group_base() . '@' .
            $self->get_hostname() . "/";
            
    }
}

1;
