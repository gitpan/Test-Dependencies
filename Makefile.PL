
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Test that dependencies are properly listed for your dist",
  "AUTHOR" => "Matthew Horsfall (alh) <WolfSage\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "strict" => 0,
    "warnings" => 0
  },
  "DISTNAME" => "Test-Dependencies",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Test::Dependencies",
  "PREREQ_PM" => {
    "CPAN::Meta" => 0,
    "Carp" => 0,
    "Cwd" => 0,
    "Data::Dumper" => 0,
    "Exporter" => 0,
    "Module::CoreList" => 0,
    "PPI" => 0,
    "Perl::PrereqScanner" => 0,
    "Test::DescribeMe" => 0,
    "Test::More" => "0.88",
    "Test::Pod" => "1.00",
    "strict" => 0,
    "version" => "0.77",
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Test::DescribeMe" => 0,
    "Test::Exception" => 0,
    "Test::More" => "0.88",
    "Test::Pod" => "1.00"
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t t/author/*.t"
  }
);


my %FallbackPrereqs = (
  "CPAN::Meta" => 0,
  "Carp" => 0,
  "Cwd" => 0,
  "Data::Dumper" => 0,
  "Exporter" => 0,
  "Module::CoreList" => 0,
  "PPI" => 0,
  "Perl::PrereqScanner" => 0,
  "Test::DescribeMe" => 0,
  "Test::Exception" => 0,
  "Test::More" => "0.88",
  "Test::Pod" => "1.00",
  "strict" => 0,
  "version" => "0.77",
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



