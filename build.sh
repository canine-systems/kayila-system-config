#!/usr/bin/env bash

rm -rf kayila-config || exit $?
mkdir kayila-config || exit $?
cd kayila-config || exit $?
equivs-build ../ns-control || exit $?