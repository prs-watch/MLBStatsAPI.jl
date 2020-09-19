using Test, MLBStatsAPI

@testset "game" begin
    gamepk = 566279
    params = Dict(
        "gamePk" => gamepk
    )
    result = game(params)
    @test result["gamePk"] == gamepk
end

@testset "schedulemlb" begin
    params = Dict(
        "startDate" => "2018-07-01",
        "endDate" => "2018-07-02",
        "sportId" => 1
    )
    result = schedulemlb(params)
    @test result["totalGames"] == 25
end

@testset "attendance" begin
    params = Dict(
        "teamId" => 100
    )
    result = attendance(params)
    records = result["records"]
    for record in records
        @test record["team"]["name"] == "Georgia Tech Yellow Jackets"
    end
end

@testset "awards" begin
    params = Dict("awardId" => "MLBHOF", "season" => 2019)
    result = awards(params)
    recps = result["awards"]
    for recp in recps
        @test recp["name"] == "Hall Of Fame"
    end
end