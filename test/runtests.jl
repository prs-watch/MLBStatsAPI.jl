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

@testset "draft" begin
    params = Dict("year" => 2019)
    result = draft(params)
    queriedsize = result["queriedSize"]
    @test queriedsize == 5134
end

@testset "people" begin
    params = Dict("personIds" => 661255)
    result = people(params)
    ps = result["people"]
    for p in ps
        @test p["nameFirstLast"] == "Yoan Lopez"
    end
end

@testset "standings" begin
    params = Dict("leagueId" => 103, "season" => 2019)
    result = standings(params)
    records = result["records"]
    for record in records
        leagueid = record["league"]["id"]
        @test leagueid == 103
    end
end

@testset "teams" begin
    params = Dict("season" => 2019)
    result = teams(params)
    tms = result["teams"]
    @test length(tms) == 620
end

@testset "meta" begin
    params = Dict("type" => "awards")
    result = meta(params)
    @test haskey(result, "awards")
end