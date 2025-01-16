
local inventoryFrame = CreateFrame("Frame")
inventoryFrame:RegisterEvent("MERCHANT_SHOW")

inventoryFrame:SetScript("OnEvent", function()
    SellJunkItems() 
    AutoRepairItems()
end)
