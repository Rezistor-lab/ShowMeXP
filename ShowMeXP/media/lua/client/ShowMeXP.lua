local SMXP = {
	Fn = {
		tostring = tostring,
		getText = getText,
		getGameTime = getGameTime
		
	},
	RgbPlus = {R=0.6D, G=1.0D, B=0.6D, A=1.0D},
	RgbMinus = {R=1.0D, G=0.4D, B=0.4D, A=1.0D}
}

--[[ 
	|Perk type|				|Perk name|		|parent Perk|
    Perks.Combat 			"Combat"		Perks.None
    Perks.Axe				"Axe"			Perks.Combat
    Perks.Blunt				"Blunt"			Perks.Combat
    Perks.SmallBlunt		"SmallBlunt" 	Perks.Combat
    Perks.LongBlade, 		"LongBlade"		Perks.Combat
    Perks.SmallBlade, 		"SmallBlade" 	Perks.Combat
    Perks.Spear, 			"Spear"			Perks.Combat
    Perks.Maintenance, 		"Maintenance" 	Perks.Combat
	
    Perks.Firearm, 			"Firearm" 		Perks.None
    Perks.Aiming, 			"Aiming" 		Perks.Firearm
    Perks.Reloading, 		"Reloading" 	Perks.Firearm
	
    Perks.Crafting 			"Crafting" 		Perks.None
    Perks.Woodwork			"Carpentry" 	Perks.Crafting
    Perks.Cooking			"Cooking" 		Perks.Crafting
    Perks.Farming 			"Farming" 		Perks.Crafting
    Perks.Doctor			"Doctor"		Perks.Crafting
    Perks.Electricity		"Electricity" 	Perks.Crafting
    Perks.MetalWelding		"MetalWelding" 	Perks.Crafting
    Perks.Mechanics			"Mechanics" 	Perks.Crafting
    Perks.Tailoring			"Tailoring"		Perks.Crafting
	
    Perks.Survivalist		"Survivalist" 	Perks.None
    Perks.Fishing			"Fishing" 		Perks.Survivalist
    Perks.Trapping			"Trapping" 		Perks.Survivalist
    Perks.PlantScavenging	"Foraging" 		Perks.Survivalist
	
    Perks.Passiv			"Passive" 		Perks.None
    Perks.Fitness			"Fitness" 		Perks.Passiv
    Perks.Strength 			"Strength" 		Perks.Passiv
	
    Perks.Agility 			"Agility"		Perks.None
    Perks.Sprinting 		"Sprinting"		Perks.Agility
    Perks.Lightfoot 		"Lightfooted" 	Perks.Agility
    Perks.Nimble			"Nimble"		Perks.Agility
    Perks.Sneak				"Sneaking"		Perks.Agility
]]--

SMXP.Fn.getXpToLevel = function(perk, level)
	if level == 0 then
		return perk:getXp1()
	elseif level == 1 then
		return perk:getXp2()
	elseif level == 2 then
		return perk:getXp3()
	elseif level == 3 then
		return perk:getXp4()
	elseif level == 4 then
		return perk:getXp5()
	elseif level == 5 then
		return perk:getXp6()
	elseif level == 6 then
		return perk:getXp7()
	elseif level == 7 then
		return perk:getXp8()
	elseif level == 8 then
		return perk:getXp9()
	else
		return perk:getXp10()
	end
end

SMXP.Fn.showXpTick = function(perk)
	local parent = perk:getParent()
	local type = perk:getType()

	-- parent == none => perk group
	if parent == Perks.None then return false end

	-- Combat category
	if type == Perks.Axe then return false end -- small portion gained with each attack
	if type == Perks.Blunt then return false end -- small portion gained with each attack
	if type == Perks.SmallBlunt then return false end -- small portion gained with each attack
	if type == Perks.LongBlade then return false end -- small portion gained with each attack
	if type == Perks.SmallBlade then return false end -- small portion gained with each attack
	if type == Perks.Spear then return false end -- small portion gained with each attack
	if type == Perks.Maintenance then return false end -- this is also gained after each attack with Combat category item attack => extremely noisy
	
	-- Firearm category
	if type == Perks.Aiming then return false end -- small portion gained with each hit
	if type == Perks.Reloading then return false end -- +1 after each realod or bullet insertion
	
	-- Crafting category
	if type == Perks.Woodwork then return true end
	if type == Perks.Cooking then return true end
	if type == Perks.Farming then return true end
	if type == Perks.Doctor then return true end
	if type == Perks.Electricity then return true end
	if type == Perks.MetalWelding then return true end
	if type == Perks.Mechanics then return true end
	if type == Perks.Tailoring then return true end
	
	-- Survivalist category
	if type == Perks.Fishing then return true end
	if type == Perks.Trapping then return true end
	if type == Perks.PlantScavenging then return true end
	
	-- Passiv category - this are most noisy perks
	if type == Perks.Fitness then return false end
	if type == Perks.Strength then return false end
	
	-- Agility category
	if type == Perks.Sprinting then return true end
	if type == Perks.Lightfoot then return true end
	if type == Perks.Nimble then return false end
	if type == Perks.Sneak then return true end
	
	return false
end

-- Life and Living TV is broadcasting only first 9 days during year 1993 => game start: Day 1 (July 9)
SMXP.Fn.isTickFromTv = function(perk, xp)
	local gameTime = SMXP.Fn.getGameTime()
	-- months are counted from 0
	if gameTime:getYear() ~= 1993 or gameTime:getMonth() ~= 6 then return false end
	
	local day = gameTime:getDay() --days are counted from 0
	if day > 16 then return false end
	local hour = gameTime:getHour()
	
	-- day 1 (July 9)
	if day == 8 then
		-- cooking show
		if hour == 9 and perk == Perks.Cooking and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- carpentry show
		if hour == 12 and perk == Perks.Carpentry and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- fishing show
		if hour == 18 and perk == Perks.Fishing and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		
		return false
	end
	-- day 2 (July 10)
	if day == 9 then
		-- cooking show
		if hour == 6 and perk == Perks.Cooking and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- carpentry show
		if hour == 12 and perk == Perks.Carpentry and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- farming show
		if hour == 18 and perk == Perks.Farming and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		
		return false
	end
	
	-- day 3 (July 11)
	if day == 10 then
		-- cooking show
		if hour == 6 and perk == Perks.Cooking and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- carpentry show
		if hour == 12 and perk == Perks.Carpentry and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- fishing show
		if hour == 18 and perk == Perks.Fishing and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		
		return false
	end
	
	-- day 4 (July 12)
	if day == 11 then
		-- cooking show
		if hour == 6 and perk == Perks.Cooking and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- carpentry show
		if hour == 12 and perk == Perks.Carpentry and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end

		return false
	end
	
	-- day 5 (July 13)	
	if day == 12 then
		-- cooking show
		if hour == 6 and perk == Perks.Cooking and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- carpentry show
		if hour == 12 and perk == Perks.Carpentry and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- foraging show
		if hour == 18 and perk == Perks.Foraging and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		
		return false
	end
	
	-- day 6 (July 14)	
	if day == 13 then
		-- cooking show
		if hour == 6 and perk == Perks.Cooking and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- carpentry show
		if hour == 12 and perk == Perks.Carpentry and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- trapping show
		if hour == 18 and perk == Perks.Trapping and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		
		return false
	end
	
	-- day 7 (July 15)
	if day == 14 then
		-- cooking show
		if hour == 6 and perk == Perks.Cooking and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- carpentry show
		if hour == 12 and perk == Perks.Carpentry and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- foraging show
		if hour == 18 and perk == Perks.Foraging and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		
		return false
	end
	
	-- day 8 (July 16)
	if day == 15 then
		-- cooking show
		if hour == 6 and perk == Perks.Cooking and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		-- carpentry show
		if hour == 18 and perk == Perks.Carpentry and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end
		
		return false
	end
	
	-- day 9 (July 17)	
	if day == 16 then
		-- cooking show
		if hour == 6 and perk == Perks.Cooking and (xp == 8.75F or xp == 12.5F or xp == 16.25F) then return true end

		return false
	end
	
	return false
end

-- IsoGameCharacter player.
-- Perk perk.
-- Float amount
function onAddXP(player, perk, amount)
	if player ~= nil and perk ~= nil and amount > 0 then
		pzPerk = PerkFactory.getPerk(perk)
		if SMXP.Fn.showXpTick(pzPerk) and SMXP.Fn.isTickFromTv(perk, amount) ~= true then
			nameTranslated = pzPerk:getName()
			perkXp = player:getXp():getXP(perk)
			maxXp = SMXP.Fn.getXpToLevel(pzPerk, player:getPerkLevel(perk))
			
			-- params:text|R|G|B|font|?messageRadius?|messageType|allowBBcode|allowImages|allowChatIcons|allowColors|allowFonts|equalizeLineHeights
			text = '+'..tostring(luautils.round(amount, 2))..' '..nameTranslated..' ('..tostring(luautils.round(perkXp, 2))..'/'..tostring(maxXp)..')'
			player:addLineChatElement(text, SMXP.RgbPlus.R, SMXP.RgbPlus.G, SMXP.RgbPlus.B, UIFont.Small, 90.0F, "radio", true,true,true,true,true,true);
		end
	end
end

-- IsoGameCharacter player.
-- Occupation perk.
-- Integer level
-- Boolean gain => yes user can also loose perk levels 
function onLevelPerk(player, perk, level, gain)
	if player ~= nil and perk ~= nil then
		color = SMXP.RgbPlus
		text = '+1 '..tostring(perk)..' ('..getText("IGUI_PlayerStats_Level")..':'..level..')'
		if gain == false then 
			color = SMXP.RgbMinus 
			text = '-1 '..tostring(perk)..' ('..getText("IGUI_PlayerStats_Level")..':'..level..')'
		end
		
		-- params:text|R|G|B|font|?messageRadius?|messageType|allowBBcode|allowImages|allowChatIcons|allowColors|allowFonts|equalizeLineHeights
		player:addLineChatElement(text, color.R, color.G, color.B, UIFont.Medium, 90.0F, "radio", true,true,true,true,true,true);
	end
end

-- register events
Events.AddXP.Add(onAddXP)
Events.LevelPerk.Add(onLevelPerk)
