# $Id: File-Append-TempFile-coverage.t 135 2006-01-27 17:54:46Z roam $
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl File-Append-TempFile-coverage.t'

BEGIN {
	eval 'use Test::Pod::Coverage tests => 1';
	if ($@) {
		use Test;
		plan tests => 1;
		skip('Test::Pod::Coverage not found');
		exit(0);
	}
}


pod_coverage_ok('File::Append::TempFile');
