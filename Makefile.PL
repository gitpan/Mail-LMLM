use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME' => 'Mail::LMLM',
    'DISTNAME' => 'Mail-LMLM',
    'VERSION_FROM' => 'lib/Mail/LMLM.pm',
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
