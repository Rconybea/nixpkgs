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
    sha256 = "57f2e13b059b38fde89580beca916ac6ca7456b2d706c3ddea9dd4890e5f5bd3";
  };

  buildInputs = [ mock sphinx-testing ];
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
