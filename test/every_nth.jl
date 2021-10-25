@testset "every_nth" begin
    x = 0
    function test_x()
        x+=1
    end
    n = 5
    new_f = every_nth(test_x, n)
    for i=1:n
        @test x == 0
        new_f()
    end
    @test x == 1
end

