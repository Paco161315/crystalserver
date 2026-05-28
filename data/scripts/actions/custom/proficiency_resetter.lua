local proficiencyResetter = Action()

function proficiencyResetter.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target or type(target) ~= "userdata" or not target:isItem() then
		return false
	end
	local targetType = target:getType()
	if not targetType then
		return false
	end
	if targetType:getWeaponType() == WEAPON_SWORD or targetType:getWeaponType() == WEAPON_CLUB or targetType:getWeaponType() == WEAPON_AXE or targetType:getWeaponType() == WEAPON_DISTANCE or targetType:getWeaponType() == WEAPON_WAND or targetType:getWeaponType() == WEAPON_MISSILE or targetType:getWeaponType() == WEAPON_FIST then
		player:resetWeaponProficiencyExperience(target.itemid)
		item:remove(1)
		return true
	end
	return false
end

proficiencyResetter:id(24963)
proficiencyResetter:register()
