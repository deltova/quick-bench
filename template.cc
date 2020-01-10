#include <benchmark/benchmark.h>
INCLUDE


static void BM_Bench(benchmark::State& state)
{
    for (auto _ : state)
    {
        CODE
    }
}
BENCHMARK(BM_Bench)->Unit(benchmark::kNanosecond);
// Run the benchmark
BENCHMARK_MAIN();
