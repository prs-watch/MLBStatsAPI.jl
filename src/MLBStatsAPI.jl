module MLBStatsAPI

using HTTP, JSON
include("endpoints.jl")

export executeapi

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

"""
Execute raw MLB Stats API.

e.g.
```
params = Dict("gamePk" => 000000)
result = executeapi("game", params)
```
"""
function executeapi(apiname, params)
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

"""
Wrapper function to execute game api.  

e.g. 
```
params = Dict("gamePk" => 000000)
gameresult = game(params)
```
"""
function game(params)
    return executeapi("game", params)
end

"""
Wrapper function to execute game api.  

e.g. 
```
params = Dict("sportId" => 1, "date" => "2018-07-01")
scheduleresult = schedule(params)
```
"""
function schedule(params)
    return executeapi("schedule", params)
end

end