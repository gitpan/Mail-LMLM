use ExtUtils::MakeMaker;

my $version;

open VER, "<ver.txt";
$version = <VER>;
chomp($version);
close(VER);

WriteMakefile(
    'NAME' => 'Mail::LMLM',
    'DISTNAME' => 'Mail-LMLM',
    'VERSION' => $version,
    );

if (0)
{
print "Generating the RPM SPEC file\n";
open I, "<lm-solve.spec.in";
open O, ">lm-solve.spec";
while (<I>)
{
    s!\[\[VERSION\]\]!$version!g;
    print O $_;
}
close(O);
close(I);
}
