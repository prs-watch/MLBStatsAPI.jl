const BASE = "https://statsapi.mlb.com/api/"

"""
Endpoints' information that `MLBStatsAPI.jl` supports.
Users can reach this information by `meta()` or `note()` function.
"""
const ENDPOINTS = Dict(
    "game" => Dict(
        "url" => BASE * "version/game/gamePk/feed/live",
        "version" => "v1.1",
        "params" => ["timecode", "hydrate", "fields"],
        "required" => ["gamePk"],
        "pathparams" => ["version", "gamePk"],
    ),
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
    )
)
