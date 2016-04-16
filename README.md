# Perl6: Miscellaneous Crypto

Random stuff - oddball scripts and libs, experiments, etc.

## PGP Words
As a library:
```
> use Crypt::Random;
> use Crypt::Misc::PGP-Words;
> my $buf = crypt_random_buf(8);
Buf[uint8]:0x<d6 b3 ab cf 93 69 bb a2>
> my @words = pgp-words-enc($buf);
[stockman pocketful rhythm Saturday playhouse guitarist shamrock Pacific]
> pgp-words-dec(@words)
Buf:0x<d6 b3 ab cf 93 69 bb a2>
```

An example script is included:
```
$ dd if=/dev/urandom bs=1 count=8 of=/tmp/bin
$ p6-pgp-words /tmp/bin
cement autopsy sentence December
playhouse company vapor celebrate
$ p6-pgp-words
Words: cement autopsy sentence December playhouse company vapor celebrate
Bytes: 2f10b9429331f527
```

