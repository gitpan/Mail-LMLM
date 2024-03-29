use strict;
use warnings;

use lib './inc';

use Test::Run::Builder;

my $build = Test::Run::Builder->new(
    'module_name' => "Mail::LMLM",
    configure_requires => {
        'Module::Build' => '0.36',
    },
    'build_requires' =>
    {
        'Test::More' => 0,
    },
    'requires' =>
    {
        'perl' => '5.008',
        'strict' => 0,
        'vars' => 0,
        'warnings' => 0,
    },
    'license' => "mit",
    create_makefile_pl => 'traditional',
    meta_merge =>
    {
        resources =>
        {
            repository => 'http://bitbucket.org/shlomif/perl-mail-lmlm/overview',
        },
        keywords =>
        [
            'E-mail',
            'mailing lists',
            'mailing list',
            'HTML',
            'manager',
        ],
    },
);
$build->create_build_script;

use lib './lib';
require Mail::LMLM;

my $version = $Mail::LMLM::VERSION;

print "Generating the RPM SPEC file\n";
my $rpm_spec = "perl-Mail-LMLM.spec";
# Remove the .spec because it's not writable.
unlink($rpm_spec);
open I, "<$rpm_spec.in";
open O, ">$rpm_spec";
while (<I>)
{
    s!\[\[VERSION\]\]!$version!g;
    print O $_;
}
close(O);
close(I);
