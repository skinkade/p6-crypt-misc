use v6;
use strict;
use Crypt::Misc::PGP-Words::Words;

sub pgp-words-enc(Buf $bytes) is export {
    my @words;
    my $list = 0;

    for ^$bytes.elems {
        @words[$_] = @pgp-words[$list][$bytes[$_]].key;
        $list = !$list;
    }

    @words;
}

sub pgp-words-dec(@words) is export {
    my $bytes = Buf.new;
    my $list = 0;

    my %even = @pgp-words[0];
    my %odd = @pgp-words[1];
    my @pgp-hashes;
    @pgp-hashes[0] = &%even;
    @pgp-hashes[1] = &%odd;

    for ^@words.elems {
        $bytes[$_] = @pgp-hashes[$list]{@words[$_]};
        $list = !$list;
    }

    $bytes;
}
