# $Id: File-Append-TempFile.t 135 2006-01-27 17:54:46Z roam $
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl File-Append-TempFile.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 16 };
use File::Append::TempFile;
ok(1); # If we made it this far, we're ok.

sub testf($ $)
{
	my ($f, $expr) = @_;

	print STDERR "A test failed: ".$f->err()."\n" unless $expr;
	return $expr;
}

open(SF, '>', 'testfile.txt') or die("Could not open testfile.txt: $!\n");
print SF "This is a test.\nThis is only a test.\n";
close SF;
ok(1);

my $f = new File::Append::TempFile();
ok($f);
$f->diag(1) if defined($ENV{'TEMPFILE_DEBUG'});
ok(testf($f, $f->begin_work('testfile.txt')));
ok(testf($f, $f->add_line("Huh?\n")));
ok(testf($f, $f->rollback()));
ok(testf($f, $f->begin_work('testfile.txt')));
ok(testf($f, $f->add_line("If this were an actual emergency, do you think\n")));
ok(testf($f, $f->add_line("we'd have bothered to tell you?\n")));
ok(testf($f, $f->commit()));
ok(testf($f, $f->begin_work('testfile.txt')));
ok(testf($f, $f->add_line("This ought to be rolled back\n")));
if (open(SF, '<', 'testfile.txt')) {
	ok(1);
} else {
	warn "Could not open testfile.txt: $!\n";
	ok(0);
}
my $contents;
{ local $/; $contents = <SF>; }
ok($contents eq "This is a test.\n".
    "This is only a test.\n".
    "If this were an actual emergency, do you think\n".
    "we'd have bothered to tell you?\n");
close(SF);

if (defined($ENV{'TEMPFILE_DEBUG'})) {
	ok($f->diag() == 1);
	$f->diag(undef);
} else {
	ok(!defined($f->diag()));
	$f->diag(0);
}
ok(!$f->diag());

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

