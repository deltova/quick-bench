#! /usr/bin/sh
rep=1
file=$(echo $1)
if [[ $1 -eq "-n" ]]; then
    rep=$(echo $2)
    file=$3
fi
IFS=
include=$(cat $file | grep -Ezo ".*--" | head -n -1)
code=$(cat $file | grep -Ezo "\-\-.*" | tail -n +2)
path="/tmp/bench"
export INCLUDE=$(echo $include)
export CODE=$(echo $code)
cat template.cc | perl -p -e 's/INCLUDE/$ENV{INCLUDE}/g' | perl -p -e 's/CODE/$ENV{CODE}/g'  > $path.cc
g++ $path.cc -std=c++11 -isystem benchmark/include -Lbenchmark/build/src -lbenchmark -lpthread -o $path

$path --benchmark_repetitions=$rep
