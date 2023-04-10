QBCore = exports['qb-core']:GetCoreObject()
local illegalItems = {
    'WEAPON_KNIFE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_BREAD',
    'WEAPON_FLASHLIGHT',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_MACHETE',
    'WEAPON_SWITCHBLADE',
    'WEAPON_BATTLEAXE',
    'WEAPON_POOLCUE',
    'WEAPON_WRENCH',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_REVOLVER',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_ASSAULTSMG',
    'WEAPON_MINISMG',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_COMBATPDW',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_CARBINERIFLE',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_GUSENBERG',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_MINIGUN',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_BZGAS',
    'WEAPON_MOLOTOV',
    'WEAPON_DIGISCANNER',
    'WEAPON_FIREWORK',
    'WEAPON_MUSKET',
    'WEAPON_STUNGUN',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_PROXMINE',
    'WEAPON_FLAREGUN',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_RAILGUN',
    'WEAPON_DBSHOTGUN',
    'WEAPON_AUTOSHOTGUN',
    'WEAPON_COMPACTLAUNCHER',
    'WEAPON_PIPEBOMB',
    'WEAPON_DOUBLEACTION',
    'weapon_pistol',
    'weapon_knife',
    'weapon_bat'
}

Citizen.CreateThread(function()
    while true do
        balalaw = QBCore.Functions.GetPlayerData()
        Citizen.Wait(5000)
    end
end)
--Name: police_station_entrance | 2023-04-04T15:39:08Z
local policeStation = BoxZone:Create(vector3(436.95, -982.32, 30.71), 6, 4.0, {
    name="entarance",
    heading=359,
    --debugPoly=true,
    minZ=28.9,
    maxZ=32.9
  })

local tileni = BoxZone:Create(vector3(441.96, -997.01, 30.72), 2.9999999999998, 7.6, {
    name="beb tileni",
    heading=0,
    --debugPoly=true,
    minZ=29.72,
    maxZ=33.72
  })

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- check every second to reduce performance impact
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        if ((policeStation:isPointInside(playerCoords)) or (tileni:isPointInside(playerCoords)) ) and (not(balalaw.job.name == 'police')) then
            for i=1, #illegalItems do
                local hasItem = QBCore.Functions.HasItem(illegalItems[i])
                if hasItem then
                    print("dkhal w aando sleh")
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30, "RG", 1.0)
                    TriggerServerEvent('police:server:policeAlert', 'Fama chkoun aando haja illeagal foukou')
                    Citizen.Wait(5000)
                    break
                end
            end
        end
    end
end)