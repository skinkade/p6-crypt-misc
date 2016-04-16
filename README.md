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

## Passphrase generation
Defaults to reading from `/usr/share/dict/words`, with a single five-word phrase.
```
$ p6-passphrase --help
Usage:
  p6-passphrase [--wordfile=<Str>] [--length=<Int>] [--count=<Int>] [--dashes] [--diceware] [--entropy]
$ p6-passphrase
intransparency acanthaceous threnetical unread unknelled
$ p6-passphrase --diceware --entropy --length=6 --count=5
The following phrase(s) have 78.00 bits of entropy:
--------------------------------------------------
else yl olaf washy ridge n4
bayed hip seven whelm avid 6q
affix skiff bowen pease wept hr
ym chase shy duly altar calve
swing spooky leapt yv leek year
```
