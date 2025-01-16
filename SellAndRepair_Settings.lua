local SellAndRepairSettingsFrame = CreateFrame("Frame", "SellAndRepairSettingsFrame", UIParent)
SellAndRepairSettingsFrame.name = "Sell and Repair" 

SellAndRepairSettingsFrame:SetScript("OnShow", function()
    if not SellAndRepairSettingsFrame.init then
        local title = SellAndRepairSettingsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
        title:SetPoint("TOPLEFT", 16, -16)
        title:SetText("Sell and Repair")

        local description = SellAndRepairSettingsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        description:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
        description:SetText("Addon Settings.")

		lastElement = description

		lastElement = CreateCheckbox(SellAndRepairSettingsFrame, "Enable Auto Sell", SellAndRepairSettings.autoSell, function(self)
			SellAndRepairSettings.autoSell = self:GetChecked()
			print("Auto Sell updated:", SellAndRepairSettings.autoSell)
		end)
		
		CreateCheckbox(SellAndRepairSettingsFrame, "Enable Auto Repair", SellAndRepairSettings.autoRepair, function(self)
			SellAndRepairSettings.autoRepair = self:GetChecked()
			print("Auto Repair updated:", SellAndRepairSettings.autoRepair)
		end)

        SellAndRepairSettingsFrame.init = true
    end
end)

if Settings and Settings.RegisterCanvasLayoutCategory then
    local category = Settings.RegisterCanvasLayoutCategory(SellAndRepairSettingsFrame, SellAndRepairSettingsFrame.name)
    Settings.RegisterAddOnCategory(category)
else
    print("error: auto sell and repair addon")
end