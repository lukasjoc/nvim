local Job = require("plenary.job")

-- local rest = require("rest-nvim") -- how does this shit work

local function query_caniuse(opts)
    local query = opts.fargs[1]

    -- Request with the actual versions
    -- https://caniuse.com/process/get_feat_data.php?type=support-data&feat=mdn-javascript_builtins_map_entries
    
    -- Request to find the correct feature name
    local feature_query_url = "https://caniuse.com/process/query.php?search=Map.prototype.entries"
    -- https://caniuse.com/process/get_feat_data.php?type=support-data&feat=mdn-javascript_builtins_map_entries
    -- vim.api.nvim_call_function('jobstart', {'curl -H "User-Agent: Curl" ' .. api_url, {
    --     on_stdout = function(_, data, _)
    --         print(data)
    --     end
    -- }})
    local job = Job:new({
        command = "curl",
        args = {
            "-H", "User-Agent: Curl", -- Header is important
            api_url
        },
        on_stdout = function(_, data)
            local json_data = vim.fn.json_decode(data)
            -- Handle the JSON data as a Lua table
            for key, value in pairs(json_data) do
                print(key, value)
            end
        end,
        on_exit = function(j)
            if j.code ~= 0 then
                print('Error: job exited with code ' .. j.code)
            end
        end,
    })
    job:start()
    print("Query: ", query)
end

vim.api.nvim_create_user_command(
    "Caniuse",
    function(opts) query_caniuse(opts) end, {
        nargs = 1,
        complete = function (lead, line, pos)
            -- TODO: cache feature names and provide here
            return {"map", "find", "reverse"}
        end
    }
)
