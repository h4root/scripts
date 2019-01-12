print ('HUD successfully loaded.')

surface.CreateFont("default", { -- You can edit name of font.
	font = "Arial", -- Font Family
	size = 22, -- Font size
	weight = 1000, -- Weight
	antialias = true
})

function hud()

	local ply = LocalPlayer()
	local health = LocalPlayer():Health()
	local armor = LocalPlayer():Armor()


	-- Health
	draw.RoundedBox(3, 10, ScrH() - 20 - 15, 200, 25, Color(15,15,15,140)) -- HP Background.
	draw.RoundedBox(3, 10, ScrH() - 20 - 15, health * 2, 25, Color(240,50,50,200)) -- HP Bar.
	draw.SimpleText(health .. "%", "default", 115, ScrH() - 1 - 59, Color(255,255,255,255)) -- Health in percents.
	draw.SimpleText("Здоровье:", "default", 10, ScrH() - 1 - 60, Color(255,255,255,255)) -- HP

	-- Armor
	draw.RoundedBox(3, 250, ScrH() - 20 - 15, 200, 25, Color(15,15,15,140))-- AR Background.
	draw.RoundedBox(3, 250, ScrH() - 20 - 15, armor * 2, 25, Color(50,50,250,200)) -- AR Bar.
	draw.SimpleText(armor .. "%", "default", 320, ScrH() - 1 - 59, Color(255,255,255,255)) -- Armor in percents.
	draw.SimpleText("Броня:", "default", 250, ScrH() - 1 - 60, Color(255,255,255,255)) -- AR


end 

-- Do not touch anything under this line.
hook.Add("HUDPaint", "MeinHUD", hud)
 
function hidehud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery"}) do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "HideOurHud:D", hidehud)
