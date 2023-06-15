local lplr = game.Players.LocalPlayer
runfile = run_file or execute_file or executefile or dofile or do_file
if _G and not _G.Zestyhub then
    _G.Zestyhub = {}
end
_G.Zestyhub.Initialized = true
local library = loadstring(request({Url="https://raw.githubusercontent.com/zesty-codes/ZestyhubForRoblox/main/Loader.lua",Method="GET"})["Body"])()
if _G.Zestyhub.PremiumMode then
    runfile("Zestyhub/Loader.lua")
    return {Premium = _G.Zestyhub.PremiumMode}
 end
_G.Zestyhub.ghost = window.Section("Ghost")
_G.Zestyhub.combat = window.Section("Combat")
_G.Zestyhub.blatant = window.Section("Blatant")
_G.Zestyhub.utility = window.Section("Utility")
_G.Zestyhub.render = window.Section("Render")
local games = {
    [6872265039] = "BedwarsGame",
    [8560631822] = "BedwarsGame",
    [6872274481] = "BedwarsGame"
}
for i, v in pairs(games) do
    if game.PlaceId == i then
        loadstring("https://raw.githubusercontent.com/zesty-codes/ZestyhubForRoblox/main/Games/"..v..".lua")
    end
end
return true
