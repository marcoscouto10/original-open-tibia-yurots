local config = {
    outfits = {"rat", "green frog", "chicken"}, -- Possible outfits
    duration = 45, -- Duration of the outfit in seconds
    breakChance = 1 -- A chance of losing the wand
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if(math.random(1, 100) <= config.breakChance) then
        doSummonCreature("Mad Sheep", toPosition)
        doRemoveItem(item.uid, 1)

        return true
    end

    if(isPlayer(itemEx.uid)) then
        doSetMonsterOutfit(itemEx.uid, config.outfits[math.random(1, table.maxn(outfits))], config.duration * 1000)
        doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
    end

    return true
end
