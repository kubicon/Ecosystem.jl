using Test
using Ecosystem  # in your code this line as to be uncommented ;)

@testset "agent_count" begin
    @test agent_count(Mushroom(1,1,1)) == 1
    @test agent_count(Sheep(2,2.0,0.2, 0.1, 0.1)) == 1
    @test agent_count([Sheep(2,2.0,0.2, 0.1, 0.1), Grass(3, 2, 5), Wolf(4, 5.0, 0.5, 0.2, 0.2), Mushroom(5, 4, 5)]) ≈ 3.2
    @test agent_count(World([Sheep(1, 3.0, 0.5, 0.1, 0.3), Sheep(2,2.0,0.2, 0.1, 0.1), Grass(3, 2, 5), Wolf(4, 5.0, 0.5, 0.2, 0.2), Mushroom(5, 4, 5), Mushroom(6, 2, 5)]))[:Sheep] ≈ 2
    @test agent_count(World([Sheep(1, 3.0, 0.5, 0.1, 0.3), Sheep(2,2.0,0.2, 0.1, 0.1), Grass(3, 2, 5), Wolf(4, 5.0, 0.5, 0.2, 0.2), Mushroom(5, 4, 5), Mushroom(6, 2, 5)]))[:Wolf] ≈ 1
    @test agent_count(World([Sheep(1, 3.0, 0.5, 0.1, 0.3), Sheep(2,2.0,0.2, 0.1, 0.1), Grass(3, 2, 5), Wolf(4, 5.0, 0.5, 0.2, 0.2), Mushroom(5, 4, 5), Mushroom(6, 2, 5)]))[:Mushroom] ≈ 1.2
    @test agent_count(World([Sheep(1, 3.0, 0.5, 0.1, 0.3), Sheep(2,2.0,0.2, 0.1, 0.1), Grass(3, 2, 5), Wolf(4, 5.0, 0.5, 0.2, 0.2), Mushroom(5, 4, 5), Mushroom(6, 2, 5)]))[:Grass] ≈ 0.4
    end

include("every_nth.jl")
include("mushroom.jl")