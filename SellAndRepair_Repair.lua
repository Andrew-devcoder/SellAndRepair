function AutoRepairItems()

    if not SellAndRepairSettings.autoRepair then
        return
    end

    if CanMerchantRepair() then
        local repairCost, canRepair = GetRepairAllCost()
        
        if canRepair and repairCost > 0 then
            RepairAllItems()
            print("Repaired all items for " .. GetCoinTextureString(repairCost))
        else
            return
        end
    else
        return
    end
end

