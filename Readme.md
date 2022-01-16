# A Best Buds Target Script for QBCore Framework

## Note

- Forked and adjusted originally from qb-burgershot to use for qb-uwu

- Set up with berkie-target | Change target to whatever you use

- Change nh-context & keyboard with whatever you prefer

- Original ped garage file removed

- Your probably already have the images for the 4 specific joints but if not, they can be found in the [images] folder

## Dependencies :

[MLO] Interior Legion Weed Clinic - https://www.gta5-mods.com/maps/mlo-legion-weed-clinic

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target (Only needed if not using draw text)

qb-menu - https://github.com/qbcore-framework/qb-menu

qb-input - https://github.com/qbcore-framework/qb-input

## TODO

- Add ped garage file back in

## Add to shared/jobs.lua or shared.lua
```lua
    ['bestbuds'] = {
        label = 'Bestbuds',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Bud Seller',
                payment = 550
            },
            ['1'] = {
                name = 'Trimmer',
                payment = 600
            },
            ['2'] = {
                name = 'Proccesor',
                payment = 750
            },
            ['3'] = {
                name = "Management",
                isboss = true,
                payment = 1250
            },
        },
    },
```

## Add to shared.lua or shared/items.lua
```lua
["joint_ak47"] 					 = {["name"] = "joint_ak47", 			 	 	["label"] = "AK Strain Joint", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "joint_ak47.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sidney would be very proud at you"},
["joint_bph"] 					 = {["name"] = "joint_bph", 			  	  	["label"] = "Purple Haze Strain Joint", ["weight"] = 0, 		["type"] = "item", 		["image"] = "joint_bph.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sidney would be very proud at you"},
["joint_ogk"] 					 = {["name"] = "joint_ogk", 			  	  	["label"] = "OGKush Strain Joint", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "joint_ogk.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sidney would be very proud at you"},
["joint_ww"] 					 = {["name"] = "joint_ww", 			  	  		["label"] = "White Widow Strain Joint", ["weight"] = 0, 		["type"] = "item", 		["image"] = "joint_ww.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sidney would be very proud at you"},
```
