local targetIdList = {
    --health potions casks
    [25879] = { transform = 266, house = true }, -- Health Potion --
    [25880] = { transform = 236, house = true }, -- Strong Health --
    [25881] = { transform = 239, house = true }, -- Great Health --
    [25882] = { transform = 7643, house = true }, -- Ultimate Health --
    [25883] = { transform = 23375, house = true }, -- Supreme Health --
    --mana potions casks
    [25889] = { transform = 268, house = true }, -- Mana Potion --
    [25890] = { transform = 237, house = true }, -- Strong Mana --
    [25891] = { transform = 238, house = true }, -- Great Mana --
    [25892] = { transform = 23373, house = true }, -- Ultimate Mana --
    --spirit potions casks
    [25899] = { transform = 7642, house = true }, -- Great Spirit --
    [25900] = { transform = 23374, house = true }, -- Ultimate Spirit --

    --health potions kegs
    [25903] = { transform = 266 }, -- Health Potion --
    [25904] = { transform = 236 }, -- Strong Health --
    [25905] = { transform = 239 }, -- Great Health --
    [25906] = { transform = 7643 }, -- Ultimate Health --
    [25907] = { transform = 23375 }, -- Supreme Health --

    --mana potion kegs
    [25908] = { transform = 268 }, -- Mana Potion --
    [25909] = { transform = 237 }, -- Strong Mana --
    [25910] = { transform = 238 }, -- Great Mana --
    [25911] = { transform = 23373 }, -- Ultimate Mana --

    --spirit potions kegs
    [25913] = { transform = 7642 }, -- Great Spirit --
    [25914] = { transform = 23374 }, -- Ultimate Spirit --
}

local emptyVials = { 283, 284, 285 } 

local flasks = Action()

function flasks.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local targetId = targetIdList[item:getId()] 

    if not targetId then
        return false
    end

    local charges = item:getCharges()
    if charges <= 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The keg has run dry.")

        item:remove()
        return true
    end


    local totalVialsFilled = 0

    for _, vialId in pairs(emptyVials) do
        local vialCount = player:getItemCount(vialId)


        local fillableVials = math.min(vialCount, charges)

        if fillableVials > 0 then

            if targetId.house and not player:getTile():getHouse() then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be in a house to use this.")
                return false
            end

            player:removeItem(vialId, fillableVials)
            player:addItem(targetId.transform, fillableVials)
            totalVialsFilled = totalVialsFilled + fillableVials
            charges = charges - fillableVials
        end
    end

    item:transform(item:getId(), charges)

    if totalVialsFilled > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You refilled " .. totalVialsFilled .. " vial(s).")
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have any empty vials to refill.")
    end

    if charges == 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The keg is empty and has been removed.")
        item:remove()
    end

    return true
end

flasks:id(25879, 25880, 25881, 25882, 25883, 25889, 25890, 25891, 25892, 25899, 25900,
          25903, 25904, 25905, 25906, 25907, 25908, 25909, 25910, 25911, 25913, 25914)
flasks:register()
