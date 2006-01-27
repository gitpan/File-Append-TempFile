# $Id: Makefile.PL 135 2006-01-27 17:54:46Z roam $

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
       AUTHOR         => 'Stranger in a strange land <roam@m.ringlet.net>') : ()),
    realclean         => { FILES => 'testfile.txt*' },
);
