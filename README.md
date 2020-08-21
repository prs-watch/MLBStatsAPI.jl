# MLB-StatsAPI

[MLB Stats API](https://statsapi.mlb.com/) client for Julia.

## Getting Started

```julia
using MLBStatsAPI

params = Dict(
    "gamePk" => 000000
)
result = executeapi("game", params)
```

## Changelogs

- `v0.0.1`
    - Pre-Release.
    - Following functions are supported.
        - `executeapi`: execute raw REST API.
            - `game`
            - `schedule`