


@testset "every_nth" begin
    m = Mushroom(2, 3, 3)
    s = Sheep(1, 3.0, 1.0, 0.1, 0.1)
    w = World([m, s])
    eat!(s, m, w)
    @test size(m) ≈ 0
    @test s.energy ≈ 0
end