#!/bin/bash

vagrant ssh -c "build/bin/phing -f build/phing/build.xml run-tests"