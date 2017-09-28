# julia -i -q -L replcxx.jl

const __initcxx = """
#include <iostream>
#include <eigen3/Eigen/Eigen>
#include <eigen3/Eigen/Geometry>

using namespace std;
using namespace Eigen;
"""

__replcxx_init() = begin
    while !isdefined(Base,:active_repl)
        sleep(0.1)
    end

    @eval using Cxx
    @eval @cxx_str($__initcxx)
    write(STDIN.buffer,'<');
end

println("/// Cxx.jl REPL ///", "\n\n", __initcxx)
@async __replcxx_init()
