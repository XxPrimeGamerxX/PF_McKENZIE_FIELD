local currentVersion = "1.0.0" -- deine lokale Version
local latestVersionURL = "https://raw.githubusercontent.com/XxPrimeGamerxX/PF_McKENZIE_FIELD/main/latestVersion.json"

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

local function checkForUpdate()
    PerformHttpRequest(latestVersionURL, function(err, responseText, headers)
        if err == 200 and responseText then
            local data = json.decode(responseText)
            if data and data.version then
                local latestVersion = data.version
                if latestVersion ~= currentVersion then
                    print(colors.red .. "⚠️ Update verfügbar!" .. colors.reset)
                    print(colors.yellow .. "Deine Version: " .. currentVersion .. colors.reset)
                    print(colors.green .. "Neueste Version: " .. latestVersion .. colors.reset)
                    print(colors.magenta .. "Download/Info: " .. (data.download or "Discord Link nicht gesetzt") .. colors.reset)
                    print(colors.green .. "MADE BY PRIME_FORGE OWNT BY XxPrime_GamerxX" .. colors.reset)
                else
                    print(colors.green .. "✅ Deine Version ist up to date!" .. colors.reset)
                    print(colors.yellow .. "Version: " .. currentVersion .. colors.reset)
                    print(colors.green .. "MADE BY PRIME_FORGE OWNT BY XxPrime_GamerxX" .. colors.reset)
                end
            else
                print(colors.red .. "[PF_McKENZIE_FIELD] Fehler beim Lesen der Version aus JSON!" .. colors.reset)
            end
        else
            print(colors.red .. "[PF_McKENZIE_FIELD] HTTP Fehler beim Update-Check!" .. colors.reset)
        end
    end)
end

-- Event: Resource Start
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        printBanner()
        -- kleine Verzögerung, bis Server joinbar ist
        Citizen.CreateThread(function()
            Wait(30000) -- 30 Sekunden warten
            checkForUpdate()
        end)
    end
end)
