Name: perl-Mail-LMLM
Version: 0.6803
Release: 1
Group: Networking/Mail
Source: http://www.cpan.org/modules/by-authors/id/S/SH/SHLOMIF/Mail-LMLM-%{version}.tar.gz
Buildroot: %{_tmppath}/%{name}-buildroot
Requires: perl
URL: http://vipe.technion.ac.il/~shlomif/LMLM/
Prefix: %{_prefix}
License: Public Domain
BuildArch: noarch
Summary: List of Mailing List Manager

%description
LMLM is a manager for a list of mailing lists. It can be used to render an
HTML description of a list of mailing lists with information about subscribing,
unsubscribing, posting messages, where to find the archive, etc.

%prep
%setup -q -n Mail-LMLM-%{version}


%build
%{__perl} Build.PL installdirs=vendor
./Build

%check
./Build test

%install
rm -rf %{buildroot}
./Build install destdir=%{buildroot}

%clean
rm -rf %{buildroot}

%files
%defattr (-,root,root)
%doc README TODO MANIFEST COPYING INSTALL
%{_mandir}/*/*
%{_libdir}/perl5/vendor_perl/*

%changelog
* Thu Jun 19 2003 Shlomi Fish <shlomif@vipe.technion.ac.il> 0.5.15-1
- Converted to Mail-LMLM

* Sat Jul 27 2002 Shlomi Fish <shlomif@vipe.technion.ac.il> 0.5.3-1
- First working version of the SPEC.

