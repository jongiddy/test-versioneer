#!/bin/sh

set -ex

pip install versioneer

rm -fr src build dist *.egg-info
rm -f *.py *.pyc

mkdir src

touch src/__init__.py

versioneer-installer

cat > setup.py <<EOF
from setuptools import setup, find_packages

import versioneer
versioneer.VCS = 'git'
versioneer.versionfile_source = 'src/_version.py'
versioneer.versionfile_build = 'myproject/_version.py'
versioneer.tag_prefix = '' # tags are like 1.2.0
versioneer.parentdir_prefix = 'myproject-' # dirname like 'myproject-1.2.0'

setup(
    # This is the human-targetted name of the software being packaged.
    name="Tester",
    # This is a string giving the version of the software being packaged.  For
    # simplicity it should be something boring like X.Y.Z.
    version=versioneer.get_version(),
    # This identifies the creators of this software.  This is left symbolic for
    # ease of maintenance.
    author="Jonathan Giddy",
    # This is contact information for the authors.
    author_email="jongiddy@gmail.com",
    # Here is a website where more information about the software is available.
    url="https://example.com/",

    # A short identifier for the license under which the project is released.
    license="Apache License, Version 2.0",

    cmdclass=versioneer.get_cmdclass(),
)
EOF

python setup.py versioneer

python setup.py --version


cd src

versioneer-installer

cat > setup.py <<EOF
from setuptools import setup, find_packages

import versioneer
versioneer.VCS = 'git'
versioneer.versionfile_source = '_version.py'
versioneer.versionfile_build = 'myproject/_version.py'
versioneer.tag_prefix = '' # tags are like 1.2.0
versioneer.parentdir_prefix = 'myproject-' # dirname like 'myproject-1.2.0'

setup(
    # This is the human-targetted name of the software being packaged.
    name="Tester",
    # This is a string giving the version of the software being packaged.  For
    # simplicity it should be something boring like X.Y.Z.
    version=versioneer.get_version(),
    # This identifies the creators of this software.  This is left symbolic for
    # ease of maintenance.
    author="Jonathan Giddy",
    # This is contact information for the authors.
    author_email="jongiddy@gmail.com",
    # Here is a website where more information about the software is available.
    url="https://example.com/",

    # A short identifier for the license under which the project is released.
    license="Apache License, Version 2.0",

    cmdclass=versioneer.get_cmdclass(),
)
EOF

python setup.py versioneer

python setup.py --version
