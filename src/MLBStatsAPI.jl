module MLBStatsAPI

using HTTP, JSON
include("endpoints.jl")

export game, schedulemlb, attendance, awards, draft, people, standings

# --- private functions ---

function __formaturl(apiinfo, params)
    url = apiinfo["url"]
    pathparams = apiinfo["pathparams"]
    for param in pathparams
        paramval = nothing
        if haskey(params, param)
            paramval = params[param]
        else
            if haskey(apiinfo, param)
                paramval = apiinfo[param]
            else
                throw(ArgumentError("Required Path Parameters $pathparams not found."))
            end
        end
        url = replace(url, "$param" => "$paramval")
    end
    return url
end

function __genquery(apiinfo, params)
    paramkeys = intersect(apiinfo["params"], keys(params))
    return Dict(key => params[key] for key in paramkeys)
end

function __executeapi(apiname, params)
    apiinfo = ENDPOINTS[apiname]
    required = apiinfo["required"]
    if length(intersect(required, keys(params))) == 0
        throw(ArgumentError("$required must be filled in."))
    end
    url = __formaturl(apiinfo, params)
    query = __genquery(apiinfo, params)
    res = HTTP.request("GET", url, query=query, status_exception=false)
    @info "HTTP Status Code: " * string(res.status)
    if res.status == 200
        return JSON.parse(String(res.body))
    else
        throw(ErrorException("No data."))
    end
end

# --- wrapper functions ---

"""
Wrapper function to execute game api.  

e.g. 
```
params = Dict("gamePk" => 000000)
gameresult = game(params)
```
"""
function game(params)
    return __executeapi("game", params)
end

"""
Wrapper function to execute game api.  

e.g. 
```
params = Dict("sportId" => 1, "date" => "2018-07-01")
scheduleresult = schedulemlb(params)
```
"""
function schedulemlb(params)
    return __executeapi("schedule", params)
end

"""
Wrapper function to execute attendance api.  

e.g. 
```
params = Dict("teamId" => 100)
attendanceresult = attendance(params)
```
"""
function attendance(params)
    return __executeapi("attendance", params)
end

"""
Wrapper function to execute awards api.  

e.g. 
```
params = Dict("awardId" => "MLBHOF")
hofresult = awards(params)
```
"""
function awards(params)
    return __executeapi("awards", params)
end

"""
Wrapper function to execute draft api.  

e.g.
```
params = Dict("year" => 2019)
draftresult = draft(params)
```
"""
function draft(params)
    return __executeapi("draft", params)
end

"""
Wrapper function to execute people api.  

e.g.
```
params = Dict("personIds" => 00000)
peopleresult = people(params)
```
"""
function people(params)
    return __executeapi("people", params)
end

"""
Wrapper function to execute standings api.  

e.g.
```
params = Dict("leagueId" => 103)
standingsresult = people(params)
```
"""
function standings(params)
    return __executeapi("standings", params)
end

end