# MLB-StatsAPI

[MLB Stats API](https://statsapi.mlb.com/) client for Julia.

## Getting Started

```julia
using MLBStatsAPI

params = Dict(
    "gamePk" => 000000
)
result = game(params)
```

## Changelogs

- `v0.0.1`
    - Pre-Release.
    - Following functions are supported.
        - `executeapi`: execute raw REST API.
            - `game`
            - `schedule`
- `v0.0.2`
    - Close `executeapi` method.
    - Add wrapper functions.
        - `game`
        - `schedulemlb`
        - `attendance`
        - `awards`
- `v0.0.3`
    - Add following functions.
        - `draft`
        - `people`
        - `standings`
        - `teams`
        - `meta`