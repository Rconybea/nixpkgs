{ lib
, buildPythonPackage
, fetchPypi
, unittestCheckHook
, mock
, sphinx-testing
, sphinx
, ditaa
}:

buildPythonPackage rec {
  pname = "sphinxcontrib-ditaa";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-V/LhOwWbOP3olYC+ypFqxsp0VrLXBsPd6p3UiQ5fW9M=";
  };

  dependencies = [ sphinx ditaa ];

  # no tests provided
  doCheck = false;

  pythonImportsCheck = [ "sphinxcontrib-ditaa" ];

  pythonNamespaces = [ "sphinxcontrib" ];

  meta = {
    description = "Sphinx ditaa extension";
    homepage = "https://pypi.org/project/sphinxcontrib-ditaa";
    maintainers = with lib.maintainers; [ rconybea ];
    license = lib.licenses.bsd2;
  };

}
