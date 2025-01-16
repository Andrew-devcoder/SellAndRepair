local SellAndRepairSettingsFrame = CreateFrame("Frame", "SellAndRepairSettingsFrame", UIParent)
SellAndRepairSettingsFrame.name = "Sell and Repair" 

-- local function InitializeSettings()
--     if not SellAndRepairSettings then
--         SellAndRepairSettings = {
--             autoSell = true, 
--             autoRepair = false, 
--         }
--     end
-- end

-- InitializeSettings()

SellAndRepairSettingsFrame:SetScript("OnShow", function()
    if not SellAndRepairSettingsFrame.init then
        -- Заголовок
        local title = SellAndRepairSettingsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
        title:SetPoint("TOPLEFT", 16, -16)
        title:SetText("Sell and Repair Addon Settings")

        -- Опис
        local description = SellAndRepairSettingsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        description:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
        description:SetText("Налаштування для Sell and Repair аддона.")

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

-- Реєструємо в налаштуваннях
if Settings and Settings.RegisterCanvasLayoutCategory then
    local category = Settings.RegisterCanvasLayoutCategory(SellAndRepairSettingsFrame, SellAndRepairSettingsFrame.name)
    Settings.RegisterAddOnCategory(category)
else
    print("Помилка: Неможливо зареєструвати налаштування аддона. Функції Settings API недоступні.")
end