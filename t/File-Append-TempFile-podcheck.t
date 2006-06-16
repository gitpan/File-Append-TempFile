# $Ringlet: File-Append-TempFile-podcheck.t 308 2006-02-13 15:18:57Z roam $
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl File-Append-TempFile-coverage.t'

use Pod::Checker;
use Test;
plan tests => 6;

my ($c, $res);

$c = new Pod::Checker '-warnings' => 1;
ok($c);
$res = $c->parse_from_file('lib/File/Append/TempFile.pm', \*STDERR);
if ($res == -1) {
	warn "No POD data found in File::Append::TempFile\n";
}
ok(!$res);
ok($c->num_errors() == 0 && $c->num_warnings() == 0);

$c = new Pod::Checker '-warnings' => 5;
ok($c);
$res = $c->parse_from_file('lib/File/Append/TempFile.pm', \*STDERR);
if ($res == -1) {
	warn "No POD data found in File::Append::TempFile\n";
}
ok(!$res);
ok($c->num_errors() == 0 && $c->num_warnings() == 0);