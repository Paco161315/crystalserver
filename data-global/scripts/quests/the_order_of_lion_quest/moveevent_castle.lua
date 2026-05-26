local bounacCheckpoint = MoveEvent()

local tiles = {
	[Position(32400, 32480, 4)] = Position(32397, 32480, 4),
	[Position(32400, 32481, 4)] = Position(32397, 32480, 4),
	[Position(32398, 32480, 4)] = Position(32401, 32480, 4),
	[Position(32398, 32481, 4)] = Position(32401, 32480, 4),
}

function bounacCheckpoint.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local destination = tiles[position]
	if not destination then
		return true
	end

	if position.x == 32400 then
		if player:getStorageValue(Storage.Quest.U12_40.TheOrderOfTheLion.AccessEastSide) >= 1 then
			player:teleportTo(destination)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	else
		player:teleportTo(destination)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end

	return true
end

for position, _ in pairs(tiles) do
	bounacCheckpoint:position(position)
end

bounacCheckpoint:register()