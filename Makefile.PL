# $Ringlet: Makefile.PL 316 2006-02-13 16:23:42Z roam $

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
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/File/Append/TempFile.pm', # retrieve abstract from module
       AUTHOR         => 'Peter Pentchev <roam@ringlet.net>') : ()),
    clean             => { FILES => 'testfile.txt*' },
);
