local lplr = game.Players.LocalPlayer
runfile = run_file or execute_file or executefile or dofile or do_file
if _G and not _G.Zestyhub then
    _G.Zestyhub = {}
end
_G.Zestyhub.Initialized = true
if _G.Zestyhub.PremiumMode then
    runfile("Zestyhub/Loader.lua")
    return {Premium = _G.Zestyhub.PremiumMode}
 end
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
