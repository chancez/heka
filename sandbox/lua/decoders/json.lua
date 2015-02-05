-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/.

--[[

Config:

--]]

local util = require("util")
local cjson = require("cjson")

local msg_type      = read_config("type")

local msg = {
Timestamp   = nil,
Type        = msg_type,
Payload     = nil,
Fields      = {}
}

function process_message ()
    local payload = read_message("Payload")
    local json = cjson.decode(payload)

    util.table_to_fields(json, msg.Fields)

    if payload_keep then
        msg.Payload = payload
    end

    inject_message(msg)
    return 0
end
