using Test, MLBStatsAPI

@testset "executeapi_game" begin
    gamepk = 566279
    params = Dict(
        "gamePk" => gamepk
    )
    result = executeapi("game", params)
    @test result["gamePk"] == gamepk
end

@testset "executeapi_schedule" begin
    params = Dict(
        "startDate" => "2018-07-01",
        "endDate" => "2018-07-02",
        "sportId" => 1
    )
    result = executeapi("schedule", params)
    @test result["totalGames"] == 25
end