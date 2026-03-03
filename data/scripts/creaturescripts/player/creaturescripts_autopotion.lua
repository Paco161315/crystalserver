-- config
local STORAGE = 65000
local STORAGE_THRESHOLD = 65001
local INTERVAL = 1500
local DEFAULT_HEALTH_THRESHOLD = 0.40
local DEFAULT_MANA_THRESHOLD = 0.40

-- potion data
local POTION_DATA = {
	-- (EVERYONE)
	[7876] = { health = { 60, 90 }, flask = 285 }, -- small health potion
	[266] = { health = { 125, 175 }, flask = 285 }, -- health potion
	[268] = { mana = { 75, 125 }, flask = 285 }, -- mana potion

	[237] = { mana = { 115, 185 }, flask = 283, level = 50 }, -- strong mana potion (level 50+)

	-- (KNIGHT, PALADIN, MONK)
	[236] = {
		health = { 250, 350 },
		flask = 283,
		level = 50,
		voc = { -- strong health potion (level 50+)
			VOCATION.BASE_ID.PALADIN,
			VOCATION.BASE_ID.KNIGHT,
			VOCATION.BASE_ID.MONK,
		},
	},

	-- (KNIGHT)
	[239] = { health = { 425, 575 }, flask = 284, level = 80, voc = { VOCATION.BASE_ID.KNIGHT } }, -- great health potion
	[7643] = { health = { 650, 850 }, flask = 284, level = 130, voc = { VOCATION.BASE_ID.KNIGHT } }, -- ultimate health potion
	[23375] = { health = { 875, 1125 }, flask = 284, level = 200, voc = { VOCATION.BASE_ID.KNIGHT } }, -- supreme health potion

	-- (SORCERER, DRUID, PALADIN, MONK)
	[238] = {
		mana = { 150, 250 },
		flask = 284,
		level = 80,
		voc = { -- great mana potion (80+)
			VOCATION.BASE_ID.SORCERER,
			VOCATION.BASE_ID.DRUID,
			VOCATION.BASE_ID.PALADIN,
			VOCATION.BASE_ID.MONK,
		},
	},

	-- (PALADIN & MONK)
	[7642] = {
		health = { 250, 350 },
		mana = { 100, 200 },
		flask = 284,
		level = 80,
		voc = { -- great spirit potion (80+)
			VOCATION.BASE_ID.PALADIN,
			VOCATION.BASE_ID.MONK,
		},
	},
	[23374] = {
		health = { 420, 580 },
		mana = { 250, 350 },
		flask = 284,
		level = 130,
		voc = { -- ultimate spirit potion (130+)
			VOCATION.BASE_ID.PALADIN,
			VOCATION.BASE_ID.MONK,
		},
	},

	-- (SORCERER & DRUID)
	[23373] = {
		mana = { 425, 575 },
		flask = 284,
		level = 130,
		voc = { -- ultimate mana potion (130+)
			VOCATION.BASE_ID.SORCERER,
			VOCATION.BASE_ID.DRUID,
		},
	},
}

-- exhaust condition creator
local function createExhaustCondition()
	local exhaust = Condition(CONDITION_EXHAUST_HEAL)
	exhaust:setParameter(CONDITION_PARAM_TICKS, (configManager.getNumber(configKeys.EX_ACTIONS_DELAY_INTERVAL) - 1000))
	return exhaust
end

-- functions
local function canUsePotion(player, potion)
	if not player or not player:isPlayer() or not potion then
		return false
	end

	local vocation = player:getVocation()
	if not vocation then
		return false
	end

	-- vocation restriction
	if potion.voc then
		local base = vocation:getBaseId()
		if not table.contains(potion.voc, base) then
			return false
		end
	end

	-- level restriction
	if potion.level and player:getLevel() < potion.level then
		return false
	end

	return true
end

-- choose best potion
local function findPotion(player)
	if not player or not player:isPlayer() then
		return nil
	end

	local hp = player:getHealth()
	local maxHp = player:getMaxHealth()
	local mana = player:getMana()
	local maxMana = player:getMaxMana()

	-- Validate health/mana values
	if maxHp <= 0 or maxMana <= 0 then
		return nil
	end

	local customThreshold = player:getStorageValue(STORAGE_THRESHOLD)
	local healthThreshold = (customThreshold > 0) and (customThreshold / 100) or DEFAULT_HEALTH_THRESHOLD
	local manaThreshold = (customThreshold > 0) and (customThreshold / 100) or DEFAULT_MANA_THRESHOLD

	local needHealth = hp < maxHp * healthThreshold
	local needMana = mana < maxMana * manaThreshold

	if not needHealth and not needMana then
		return nil
	end

	local best, bestScore = nil, 0

	for id, data in pairs(POTION_DATA) do
		if canUsePotion(player, data) then
			local item = player:getItemById(id, true)
			if item and item:isItem() then
				local score, matchesNeed = 0, false

				if needHealth and data.health then
					score = score + data.health[2]
					matchesNeed = true
				end

				if needMana and data.mana then
					score = score + data.mana[2]
					matchesNeed = true
				end

				if matchesNeed and score > bestScore then
					best = { item = item, info = data }
					bestScore = score
				end
			end
		end
	end

	return best
end

-- autopotion core
local function tryHeal(player)
	if not player or not player:isPlayer() then
		return
	end

	if player:getCondition(CONDITION_EXHAUST_HEAL) then
		return
	end

	local hp = player:getHealth()
	local maxHp = player:getMaxHealth()
	local mana = player:getMana()
	local maxMana = player:getMaxMana()

	-- Validate health/mana values
	if maxHp <= 0 or maxMana <= 0 then
		return
	end

	local customThreshold = player:getStorageValue(STORAGE_THRESHOLD)
	local healthThreshold = (customThreshold > 0) and (customThreshold / 100) or DEFAULT_HEALTH_THRESHOLD
	local manaThreshold = (customThreshold > 0) and (customThreshold / 100) or DEFAULT_MANA_THRESHOLD

	if hp >= maxHp * healthThreshold and mana >= maxMana * manaThreshold then
		return
	end

	local data = findPotion(player)
	if not data then
		return
	end

	local info = data.info

	-- Add exhaust condition
	local exhaust = createExhaustCondition()
	player:addCondition(exhaust)

	-- Apply health and mana
	if info.health then
		player:addHealth(math.random(info.health[1], info.health[2]))
	end

	if info.mana then
		player:addMana(math.random(info.mana[1], info.mana[2]))
	end

	-- Safe item removal
	if data.item and data.item:isItem() then
		data.item:remove(1)
	else
		return -- Item no longer exists
	end

	local deactivatedFlasks = player:kv():get("talkaction.potions.flask") or false
	if not deactivatedFlasks and info.flask then
		player:addItem(info.flask, 1)
	end

	player:say("Aaaah...", MESSAGE_POTION)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

	player:addAchievementProgress("Potion Addict", 100000)
end

-- globalevent
local autoheal = GlobalEvent("autoheal")

function autoheal.onThink(interval)
	for _, player in pairs(Game.getPlayers()) do
		if player:getStorageValue(STORAGE) == 1 then
			tryHeal(player)
		end
	end
	return true
end

autoheal:interval(INTERVAL)
autoheal:register()
