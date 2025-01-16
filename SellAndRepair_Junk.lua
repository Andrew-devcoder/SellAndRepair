function SellJunkItems()

	if not SellAndRepairSettings.autoSell then
        return
    end

    local hasJunk = false 

    for bag = 0, 4 do
        local numSlots = C_Container.GetContainerNumSlots(bag)
        if numSlots and numSlots > 0 then
            for slot = 1, numSlots do
                local itemInfo = C_Container.GetContainerItemInfo(bag, slot)
                if itemInfo and itemInfo.hyperlink then
                    local itemName, _, itemQuality, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(itemInfo.hyperlink)
                    if itemQuality == 0 then
                        local itemCount = itemInfo.stackCount

                        C_Container.UseContainerItem(bag, slot)
                        hasJunk = true

                        print("Sold: " .. itemName .. " x" .. itemCount .. " for " .. GetCoinTextureString(itemSellPrice * itemCount))
                    end
                end
            end
        end
    end

    if not hasJunk then
        print("No junk items to sell.")
    end
end
