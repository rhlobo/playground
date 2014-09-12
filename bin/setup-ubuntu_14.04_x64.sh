#!/bin/bash -ve


## INSTALLING DEPENDENCIES
### C COMPILER
sudo apt-get install --yes --quiet build-essential

### SETUP TOOLS
pip install -U setuptools

### TEST TOOLS
pip install -U pep8
pip install -U nose
pip install -U coverage
pip install -U mockito
pip install -U watchdog

### MISC TOOLING
pip install -U markupsafe

#### MEMORY PROFILER
pip install -U psutil
pip install -U memory_profiler

#### PROFILE VIZUALIZATION
##### GPROF2DOT
sudo apt-get install --yes --quiet graphviz
sudo apt-get install --yes --quiet python-profiler

#### DOCUMENTATION
pip install -U sphinx

### MISC PROJECT / SCIPY DEPENDENCIES
pip install -U Cython
pip install -U pytz
pip install -U python-dateutil

#### NUMPY
sudo apt-get install --yes --quiet libatlas-base-dev liblapack-dev
if [ -n "${VIRTUAL_ENV}" ]; then
    mkdir -p "${VIRTUAL_ENV}/local"
    rm -Rf "${VIRTUAL_ENV}/local/lib"
    ln -s "${VIRTUAL_ENV}/lib" "${VIRTUAL_ENV}/local/lib"
fi
pip install -U numpy

#### NUMPY COMPLEMENTARY PACKAGES
pip install -U bottleneck
pip install -U numexpr

#### SCIPY
sudo apt-get build-dep --yes --quiet python-scipy
pip install -U scipy
pip install -U sympy

#### HDF5 & PYTABLES
sudo apt-get install --yes --quiet libhdf5-7
sudo apt-get install --yes --quiet  libhdf5-serial-dev
sudo apt-get install --yes --quiet subversion
sudo apt-get build-dep --yes python-h5py
pip install -U h5py
pip install -e "git+https://github.com/PyTables/PyTables.git@v.3.0.0#egg=tables"

#### MATPLOTLIB
sudo apt-get build-dep --yes --quiet python-matplotlib
#sudo apt-get install --yes --quiet libfreetype6-dev libpng12-dev
pip install -U matplotlib

#### PANDAS & RELATED
pip install -U pandas
pip install -U patsy
pip install -U statsmodels

#### TA-LIB
CURRDIR=$(pwd) && mkdir -p "${HOME}/dev/lib-cpp" && cd "${HOME}/dev/lib-cpp" && wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
sudo rm -Rf ta-lib; tar -xzf ta-lib-0.4.0-src.tar.gz; cd ta-lib
./configure && make && sudo make install
cd "${CURRDIR}"
pip install -U TA_Lib || pip install https://github.com/mrjbq7/ta-lib/archive/TA_Lib-0.4.8.zip

### BIG TEMPO ANALYSIS TOOLS
pip install -U bigtempo

### IPYTHON (& DEPENDENCIES)
sudo apt-get install --yes --quiet libzmq-dev
pip install -U pyzmq
pip install -U jinja2
pip install -U tornado
pip install -U ipython
