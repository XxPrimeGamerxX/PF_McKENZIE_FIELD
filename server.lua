local currentVersion = "1.0.0"
local latestVersion = "1.1.0"
local updateDiscordLink = "https://discord.gg/FfHffH74bQ"

local colors = {
    reset = "\27[0m",
    red = "\27[31m",
    green = "\27[32m",
    yellow = "\27[33m",
    cyan = "\27[36m",
    magenta = "\27[35m"
}

local function printBanner()
    print(colors.cyan .. "==============================")
    print(colors.green .. "   MLO PF_McKENZIE_FIELD")
    print(colors.green .. "       von XxPrime_GamerxX")
    print(colors.yellow .. "       Version: " .. currentVersion)
    print(colors.cyan .. "Discord: https://discord.gg/tPHF2cdKZz")
	print(colors.green .. "MADE BY PRIME_FORGE OWNT BY XxPrime_GamerxX" .. colors.reset)
    print(colors.cyan .. "==============================" .. colors.reset)
end

local function printUpdateStatus()
    print(colors.cyan .. "==============================" .. colors.reset)
    if currentVersion ~= latestVersion then
        print(colors.red .. "⚠️ Update verfügbar!" .. colors.reset)
        print(colors.yellow .. "Aktuelle Version: " .. currentVersion .. colors.reset)
        print(colors.green .. "Neueste Version: " .. latestVersion .. colors.reset)
        print(colors.magenta .. "Download/Info: " .. updateDiscordLink .. colors.reset)
		print(colors.green .. "MADE BY PRIME_FORGE OWNT BY XxPrime_GamerxX" .. colors.reset)
    else
        print(colors.green .. "✅ Deine Version ist up to date!" .. colors.reset)
        print(colors.yellow .. "Version: " .. currentVersion .. colors.reset)
		print(colors.green .. "MADE BY PRIME_FORGE OWNT BY XxPrime_GamerxX" .. colors.reset)
    end
    print(colors.cyan .. "==============================" .. colors.reset)
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        printBanner()
        -- kleine Verzögerung, bis Server joinbar ist
        Citizen.CreateThread(function()
            Wait(120000) -- 120 Sekunden warten, bis Server ready ist
            printUpdateStatus()
        end)
    end
end)