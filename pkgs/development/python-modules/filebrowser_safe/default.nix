{ stdenv
, buildPythonPackage
, fetchPypi
, django
}:

buildPythonPackage rec {
  version = "0.3.6";
  pname = "filebrowser_safe";

  src = fetchPypi {
    inherit pname version;
    sha256 = "02bn60fdslvng2ckn65fms3hjbzgsa8qa5161a8lr720wbx8gpj2";
  };

  buildInputs = [ django ];

  # There is no test embedded
  doCheck = false;

  meta = with stdenv.lib; {
    description = "A snapshot of django-filebrowser for the Mezzanine CMS";
    longDescription = ''
      filebrowser_safe was created to provide a snapshot of the
      FileBrowser asset manager for Django, to be referenced as a
      dependency for the Mezzanine CMS for Django.

      At the time of filebrowser_safe's creation, FileBrowser was
      incorrectly packaged on PyPI, and had also dropped compatibility
      with Django 1.1 - filebrowser_safe was therefore created to
      address these specific issues.
    '';
    homepage = https://github.com/stephenmcd/filebrowser-safe;
    downloadPage = https://pypi.python.org/pypi/filebrowser_safe/;
    license = licenses.free;
    maintainers = with maintainers; [ prikhi ];
    platforms = platforms.linux;
  };

}