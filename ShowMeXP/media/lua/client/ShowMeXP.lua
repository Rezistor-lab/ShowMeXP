local SMXP = {
	Fn = {
		tostring = tostring
	},
	RgbPlus = {R=0.6D, G=1.0D, B=0.6D, A=1.0D},
	RgbMinus = {R=1.0D, G=0.4D, B=0.4D, A=1.0D}
}


--[[
	params: Perk type|name|parent Perk|xp1|xp2|xp3|xp4|xp5|xp6|xp7|xp8|xp9|xp10|pasive
    AddPerk(Perks.Combat, "Combat", Perks.None, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Axe, "Axe", Perks.Combat, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Blunt, "Blunt", Perks.Combat, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.SmallBlunt, "SmallBlunt", Perks.Combat, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.LongBlade, "LongBlade", Perks.Combat, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.SmallBlade, "SmallBlade", Perks.Combat, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Spear, "Spear", Perks.Combat, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Maintenance, "Maintenance", Perks.Combat, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
	
    AddPerk(Perks.Firearm, "Firearm", Perks.None, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Aiming, "Aiming", Perks.Firearm, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Reloading, "Reloading", Perks.Firearm, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
	
    AddPerk(Perks.Crafting, "Crafting", Perks.None, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Woodwork, "Carpentry", Perks.Crafting, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000), false;
    AddPerk(Perks.Cooking, "Cooking", Perks.Crafting, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Farming, "Farming", Perks.Crafting, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Doctor, "Doctor", Perks.Crafting, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Electricity, "Electricity", Perks.Crafting, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.MetalWelding, "MetalWelding", Perks.Crafting, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Mechanics, "Mechanics", Perks.Crafting, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Tailoring, "Tailoring", Perks.Crafting, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
	
    AddPerk(Perks.Survivalist, "Survivalist", Perks.None, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Fishing, "Fishing", Perks.Survivalist, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Trapping, "Trapping", Perks.Survivalist, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.PlantScavenging, "Foraging", Perks.Survivalist, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
	
    AddPerk(Perks.Passiv, "Passive", Perks.None, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, true);
    AddPerk(Perks.Fitness, "Fitness", Perks.Passiv, 1000, 2000, 4000, 6000, 12000, 20000, 40000, 60000, 80000, 100000, true);
    AddPerk(Perks.Strength, "Strength", Perks.Passiv, 1000, 2000, 4000, 6000, 12000, 20000, 40000, 60000, 80000, 100000, true);
	
    AddPerk(Perks.Agility, "Agility", Perks.None, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Sprinting, "Sprinting", Perks.Agility, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Lightfoot, "Lightfooted", Perks.Agility, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Nimble, "Nimble", Perks.Agility, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
    AddPerk(Perks.Sneak, "Sneaking", Perks.Agility, 50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000, 6000, false);
]]--
-- IsoGameCharacter player.
-- Perk perk.
-- Float amount
function onAddXP(player, perk, amount)
	-- params:text|R|G|B|font|?messageRadius?|messageType|allowBBcode|allowImages|allowChatIcons|allowColors|allowFonts|equalizeLineHeights
	text = '+'..tostring(luautils.round(amount, 2))..'XP '..perk:getName()..' lvl'..player:getPerkInfo(perk):getLevel()
	player:addLineChatElement(text, SMXP.RgbPlus.R, SMXP.RgbPlus.G, SMXP.RgbPlus.B, UIFont.Medium, 90.0F, "radio", true,true,true,true,true,true);
	
end

-- IsoGameCharacter player.
-- Occupation perk.
-- Integer level
-- Boolean gain => yes user can also loose perk levels 
function onLevelPerk(player, perk, level, gain)
	-- params:text|R|G|B|font|?messageRadius?|messageType|allowBBcode|allowImages|allowChatIcons|allowColors|allowFonts|equalizeLineHeights
	color = SMXP.RgbPlus
	text = '+1 '..perk:getName()..' (lvl '..level..')'
	if gain == false then 
		color = SMXP.RgbMinus 
		text = '-1 '..perk:getName()..' (lvl '..level..')'
	end
	
	player:addLineChatElement(diff, color.R, color.G, color.B, UIFont.Medium, 90.0F, "radio", true,true,true,true,true,true);
end

-- register events
Events.AddXP.Add(onAddXP)
Events.LevelPerk.Add(onLevelPerk)
