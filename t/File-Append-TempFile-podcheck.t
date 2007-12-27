# $Ringlet: File-Append-TempFile-podcheck.t 1636 2007-12-27 14:06:46Z roam $
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl File-Append-TempFile-coverage.t'

use Pod::Checker;
use Test;
plan tests => 8;

my ($c, $res);

$c = new Pod::Checker '-warnings' => 1;
ok($c);
$res = $c->parse_from_file('lib/File/Append/TempFile.pm', \*STDERR);
if ($res == -1) {
	warn "No POD data found in File::Append::TempFile\n";
}
ok(!$res);
ok($c->num_errors() == 0);
if ($c->can('num_warnings')) {
	ok($c->num_warnings() == 0);
} else {
	skip('Pod::Checker does not support num_warnings', 1);
}

$c = new Pod::Checker '-warnings' => 5;
ok($c);
$res = $c->parse_from_file('lib/File/Append/TempFile.pm', \*STDERR);
if ($res == -1) {
	warn "No POD data found in File::Append::TempFile\n";
}
ok(!$res);
ok($c->num_errors() == 0);
if ($c->can('num_warnings')) {
	ok($c->num_warnings() == 0);
} else {
	skip('Pod::Checker does not support num_warnings', 1);
}
