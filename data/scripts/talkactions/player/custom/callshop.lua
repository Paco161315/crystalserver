local function removeNPC(npcId)
    local npc = Npc(npcId)
    if npc then
        npc:remove()
    end
end

local callShop = TalkAction("!callshop")

function callShop.onSay(player, words, param)
    if player:getStorageValue(3121990) < 1 then
        player:sendCancelMessage("You cannot use call shop command.")
        return true
    end

    if player:getSoul() < 100 then
        player:sendCancelMessage("You do not have enough soul.")
        return true
    end
    player:addSoul(-100)

    local position = player:getPosition()
    local npc = Game.createNpc("Trader Djinn", position)
    if not npc then
        player:sendCancelMessage("Failed to call shop.")
        return true
    end

    position:sendMagicEffect(CONST_ME_MAGIC_RED)
    local npcId = npc:getId()
    addEvent(removeNPC, 180000, npcId)
    return true
end

callShop:groupType("normal")
callShop:register()