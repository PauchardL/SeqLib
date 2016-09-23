#!/usr/bin/env bash

#set -x
set -e
set -o pipefail

## only build for one compiler
VALID=`g++ --version | grep 4.9 | wc -l`
if [[ "$VALID" -eq "1" ]]; then

    if [ "${TRAVIS_OS_NAME}" = "osx" ]; then
	brew update
    fi
    
    if [ -n "${BOOST_VERSION}" ]; then
	mkdir -p $BOOST_ROOT
	wget --no-verbose --output-document=- \
	    http://sourceforge.net/projects/boost/files/boost/${BOOST_VERSION}/boost_${BOOST_VERSION//./_}.tar.bz2/download \
	    | tar jxf - --strip-components=1 -C "${BOOST_ROOT}"
    fi

fi
