#! /usr/bin/sh
IFS=
include=$(cat $1 | grep -Ezo ".*--" | head -n -1)
code=$(cat $1 | grep -Ezo "\-\-.*" | tail -n +2)
path="/tmp/bench"
export INCLUDE=$(echo $include)
export CODE=$(echo $code)
cat template.cc | perl -p -e 's/INCLUDE/$ENV{INCLUDE}/g' | perl -p -e 's/CODE/$ENV{CODE}/g'  > $path.cc
g++ $path.cc -std=c++11 -isystem benchmark/include -Lbenchmark/build/src -lbenchmark -lpthread -o $path

$path
