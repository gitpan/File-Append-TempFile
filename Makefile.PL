# $Ringlet: Makefile.PL 1642 2007-12-27 17:00:38Z roam $

use 5.006;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'File::Append::TempFile',
    VERSION_FROM      => 'lib/File/Append/TempFile.pm', # finds $VERSION
    PREREQ_PM         => {
    				'Test::Pod::Coverage'	=> 1,
    			}, # e.g., Module::Name => 1.1
    ABSTRACT_FROM  => 'lib/File/Append/TempFile.pm', # retrieve abstract from module
    AUTHOR         => 'Peter Pentchev <roam@ringlet.net>',
    clean             => { FILES => 'testfile.txt*' },
);
