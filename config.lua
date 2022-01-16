Config = {}

--[[TODO
Config.GaragePedLocations = {
    --{coords = vector4(-1178.588, -891.9196, 13.799622, 302.58825)}, (unused)
}
]]

Config.SQL = 'oxmysql' --- oxmysql or ghmattisql

Config.DebugPolys = true

Config.Items = {
label = "Shop",
    slots = 23,
    items = {
        [1] = {
            name = "lighter",
            price = 2,
            amount = 20,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "bong",
            price = 5,
            amount = 20,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weed_nutrition",
            price = 2,
            amount = 20,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "empty_weed_bag",
            price = 2,
            amount = 20,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weed_insecticide",
            price = 5,
            amount = 20,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "alkaline_bottle",
            price = 3,
            amount = 20,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "acid_bottle",
            price = 5,
            amount = 20,
            info = {},
            type = "item",
            slot = 7,
        },
    }
}