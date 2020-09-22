const BASE = "https://statsapi.mlb.com/api/"

"""
Endpoints' information that `MLBStatsAPI.jl` supports.
Users can reach this information by `meta()` or `note()` function.
"""
const ENDPOINTS = Dict(
    # game
    "game" => Dict(
        "url" => BASE * "version/game/gamePk/feed/live",
        "version" => "v1.1",
        "params" => ["timecode", "hydrate", "fields"],
        "required" => ["gamePk"],
        "pathparams" => ["version", "gamePk"],
    ),
    # schedule
    "schedule" => Dict(
        "url" => BASE * "version/schedule",
        "version" => "v1",
        "params" => [
            "scheduleType",
            "eventTypes",
            "hydrate",
            "teamId",
            "leagueId",
            "sportId",
            "gamePk",
            "gamePks",
            "venueIds",
            "gameTypes",
            "date",
            "startDate",
            "endDate",
            "opponentId",
            "fields",
        ],
        "required" => ["sportId", "gamePk", "gamePks"],
        "pathparams" => ["version"],
    ),
    # attendance
    "attendance" => Dict(
        "url" => BASE * "version/attendance",
        "version" => "v1",
        "params" => [
            "teamId",
            "leagueId",
            "season",
            "date",
            "leagueListId",
            "gameType",
            "fields",
        ],
        "required" => ["teamId", "leagueId", "leagueListId"],
        "pathparams" => ["version"],
    ),
    # awards
    "awards" => Dict(
        "url" => BASE * "version/awards/awardId/recipients",
        "version" => "v1",
        "params" => ["sportId", "leagueId", "season", "hydrate", "fields"],
        "required" => ["awardId"],
        "pathparams" => ["version", "awardId"],
    ),
    # draft
    "draft" => Dict(
        "url" => BASE * "version/draft/prospects/year",
        "version" => "v1",
        "params" => [
            "limit",
            "fields",
            "round",
            "name",
            "school",
            "state",
            "country",
            "position",
            "teamId",
            "playerId",
            "bisPlayerId",
        ],
        "required" => ["year"],
        "pathparams" => ["version", "year"],
    ),
    # people
    "people" => Dict(
        "url" => BASE * "version/people",
        "version" => "v1",
        "params" => ["personIds", "hydrate", "fields"],
        "required" => ["personIds"],
        "pathparams" => ["version"],
    ),
    # standings
    "standings" => Dict(
        "url" => BASE * "version/standings",
        "version" => "v1",
        "params" => [
            "leagueId",
            "season",
            "standingsTypes",
            "date",
            "hydrate",
            "fields",
        ],
        "required" => ["leagueId"],
        "pathparams" => ["version"],
    ),
    # teams
    "teams" => Dict(
        "url" => BASE * "version/teams",
        "version" => "v1",
        "params" => [
            "season",
            "activeStatus",
            "leagueIds",
            "sportIds",
            "gameType",
            "hydrate",
            "fields",
        ],
        "required" => [],
        "pathparams" => ["version"],
    ),
    # meta
    "meta" => Dict(
        "url" => BASE * "version/type",
        "version" => "v1",
        "params" => [],
        "required" => ["type"],
        "pathparams" => ["version", "type"],
    )
)
