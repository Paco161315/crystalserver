local marzielBlood = MoveEvent()

local function revertBlood(position)
	local blood = Tile(position):getItemById(2886)
	if blood then
		blood:remove()
	end
end

function marzielBlood.onAddItem(moveitem, tileitem, position)
	if player:getStorageValue(Storage.Quest.U8_4.BloodBrothers.Mission08) < 1 then
		return false
	end

	if moveitem.itemid ~= 2886 or moveitem.type ~= 5 then
		return true
	end

	if position ~= Position(32940, 31458, 2) then
		return true
	end

	local hasFemale = false
	local fromPos = Position(32936, 31456, 2)
	local toPos = Position(32944, 31464, 2)
	
	local spectators = Game.getSpectators(fromPos, false, false, 
		toPos.x - fromPos.x, toPos.x - fromPos.x,
		toPos.y - fromPos.y, toPos.y - fromPos.y)
	
	for _, spectator in ipairs(spectators) do
		if spectator:isPlayer() and spectator:getSex() == PLAYERSEX_FEMALE then
			hasFemale = true
			break
		end
	end
	
	if hasFemale then
		local statuePos = Position(32944, 31464, 2)
		local statue = Tile(statuePos):getItemById(8325)
		if statue then
			statue:transform(8326)
			
			local centerPos = Position(32940, 31460, 2)
			local centerSpectators = Game.getSpectators(centerPos, false, true, 8, 8, 8, 8)
			for _, spectator in ipairs(centerSpectators) do
				if spectator:isPlayer() then
					spectator:say("AAAAH... THE SCENT OF A WOMAN... GIVE ME MORE...", TALKTYPE_MONSTER_SAY)
				end
			end

			Game.createMonster("Vampire Bride", Position(32938, 31458, 2))
			Game.createMonster("Vampire Bride", Position(32942, 31458, 2))
		end
	end
	
	addEvent(revertBlood, 30 * 1000, position)
	
	return true
end

marzielBlood:type("additem")
marzielBlood:id(8695)
marzielBlood:register()