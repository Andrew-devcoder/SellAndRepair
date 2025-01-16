
function CreateCheckbox(parent, label, defaultValue, callback)
    local checkbox = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
    checkbox:SetPoint("TOPLEFT", lastElement, "BOTTOMLEFT", 0, -8) 
    checkbox.Text:SetText(label)
    checkbox:SetChecked(defaultValue)
    checkbox:SetScript("OnClick", callback)

    return checkbox
end