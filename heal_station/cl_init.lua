include("shared.lua")

surface.CreateFont("MainFont", {
    font = "Comic Sans MS",
    size = 40,
    weight = 500,
})

function ENT:Draw()
    self:DrawModel()
end


local function myOpen()
    local frame = vgui.Create("DFrame")
    frame:SetSize(600, 720)
    frame:Center()
    frame:SetVisible(true)
    frame:MakePopup()
    frame:ShowCloseButton(false)
    --frame:SetScreenLock(true)
    frame:SetTitle("Heal-Station")

    frame.Paint = function(s, w, h)
        draw.RoundedBox(12, 0, 0, w, h, Color(105, 105, 105, 230)) 
        draw.RoundedBox(12, 2, 2, w - 4, h - 4, Color(0, 0, 0, 100)) 
    end

    
    local sheetmain = vgui.Create("DPropertySheet", frame)
    sheetmain:Dock(FILL)
    local List1 = vgui.Create("DPanelList")
    List1:SetSize(475, 355)
    List1:SetPos(5, 15)
    local List2 = vgui.Create("DPanelList")
    List2:SetSize(475, 355)
    List2:SetPos(5, 15)
    sheetmain:AddSheet("Gesungheit", List1, "icon16/heart.png", false, false, "Mhmm")
    sheetmain:AddSheet("Rüstung", List2, "icon16/shield.png", false, false, "Rüstung")
    local PanelA1 = vgui.Create("DPanel", List1) --A ist für Gesundheit
    PanelA1:SetSize(540, 87)
    PanelA1:SetPos(10, 60)
    local PanelA2 = vgui.Create("DPanel", List1)
    PanelA2:SetSize(540, 87)
    PanelA2:SetPos(10, 210)
    local PanelA3 = vgui.Create("DPanel", List1)
    PanelA3:SetSize(540, 87)
    PanelA3:SetPos(10, 360)
    local PanelB1 = vgui.Create("DPanel", List2) -- B ist für Rüstungstab
    PanelB1:SetSize(540, 87)
    PanelB1:SetPos(10, 60)
    local PanelB2 = vgui.Create("DPanel", List2)
    PanelB2:SetSize(540, 87)
    PanelB2:SetPos(10, 210)
    local PanelB3 = vgui.Create("DPanel", List2)
    PanelB3:SetSize(540, 87)
    PanelB3:SetPos(10, 360)
    local buttonA1 = vgui.Create("DButton", frame) --buttons
    buttonA1:SetPos(540 - 150, 23)
    buttonA1:SetSize(120, 43)
    buttonA1:SetParent(PanelA1)
    buttonA1:SetText("Für 50€ Kaufen")
    buttonA1:SetMouseInputEnabled(true)

    buttonA1.DoClick = function()
        surface.PlaySound("items/smallmedkit1.wav")
        net.Start("25health")
        net.SendToServer()
    end

    local buttonA2 = vgui.Create("DButton", frame)
    buttonA2:SetPos(540 - 150, 23)
    buttonA2:SetSize(120, 43)
    buttonA2:SetMouseInputEnabled(true)
    buttonA2:SetText("Für 50€ Kaufen")
    buttonA2:SetParent(PanelA2)

    buttonA2.DoClick = function()
        surface.PlaySound("items/medshot4.wav")
        net.Start("50health")
        net.SendToServer()
    end

    local buttonA3 = vgui.Create("DButton", frame)
    buttonA3:SetPos(540 - 150, 23)
    buttonA3:SetSize(120, 43)
    buttonA3:SetParent(PanelA3)
    buttonA3:SetText("Für 50€ Kaufen")
    buttonA3:SetMouseInputEnabled(true)

    buttonA3.DoClick = function()
        surface.PlaySound("items/medshot4.wav")
        net.Start("100health")
        net.SendToServer()
    end

    local buttonB1 = vgui.Create("DButton", frame)
    buttonB1:SetPos(540 - 150, 23)
    buttonB1:SetSize(120, 43)
    buttonB1:SetParent(PanelB1)
    buttonB1:SetText("Für 50€ Kaufen")
    buttonB1:SetMouseInputEnabled(true)

    buttonB1.DoClick = function()
        surface.PlaySound("items/battery_pickup.wav")
        net.Start("25armor")
        net.SendToServer()
    end

    local buttonB2 = vgui.Create("DButton", frame)
    buttonB2:SetPos(540 - 150, 23)
    buttonB2:SetSize(120, 43)
    buttonB2:SetMouseInputEnabled(true)
    buttonB2:SetText("Für 50€ Kaufen")
    buttonB2:SetParent(PanelB2)

    buttonB2.DoClick = function()
        surface.PlaySound("items/battery_pickup.wav")
        net.Start("50armor")
        net.SendToServer()
    end

    local buttonB3 = vgui.Create("DButton", frame)
    buttonB3:SetPos(540 - 150, 23)
    buttonB3:SetSize(120, 43)
    buttonB3:SetParent(PanelB3)
    buttonB3:SetText("Für 50€ Kaufen")
    buttonB3:SetMouseInputEnabled(true)

    buttonB3.DoClick = function()
        surface.PlaySound("items/battery_pickup.wav")
        net.Start("100armor")
        net.SendToServer()
    end

    local infoA1 = vgui.Create("DLabel", frame) --DLabels
    infoA1:SetText("+25 Health")
    infoA1:SetTextColor(Color(0, 0, 0))
    infoA1:SetFont("MainFont")
    infoA1:SetParent(PanelA1)
    infoA1:SetSize(300, 43)
    infoA1:SetPos(140, 26)
    local infoA2 = vgui.Create("DLabel", frame)
    infoA2:SetText("+50 Health")
    infoA2:SetTextColor(Color(0, 0, 0))
    infoA2:SetFont("MainFont")
    infoA2:SetParent(PanelA2)
    infoA2:SetSize(300, 43)
    infoA2:SetPos(140, 23)
    local infoA3 = vgui.Create("DLabel", frame)
    infoA3:SetText("+100 Health")
    infoA3:SetTextColor(Color(0, 0, 0))
    infoA3:SetFont("MainFont")
    infoA3:SetParent(PanelA3)
    infoA3:SetSize(300, 43)
    infoA3:SetPos(140, 23)
    local infoB1 = vgui.Create("DLabel", frame) --DLabels
    infoB1:SetText("+25 Rüstung")
    infoB1:SetTextColor(Color(0, 0, 0))
    infoB1:SetFont("MainFont")
    infoB1:SetParent(PanelB1)
    infoB1:SetSize(300, 43)
    infoB1:SetPos(140, 26)
    local infoB2 = vgui.Create("DLabel", frame)
    infoB2:SetText("+50 Rüstung")
    infoB2:SetTextColor(Color(0, 0, 0))
    infoB2:SetFont("MainFont")
    infoB2:SetParent(PanelB2)
    infoB2:SetSize(300, 43)
    infoB2:SetPos(140, 23)
    local infoB3 = vgui.Create("DLabel", frame)
    infoB3:SetText("+100 Rüstung")
    infoB3:SetTextColor(Color(0, 0, 0))
    infoB3:SetFont("MainFont")
    infoB3:SetParent(PanelB3)
    infoB3:SetSize(300, 43)
    infoB3:SetPos(140, 23)
    local IconA1 = vgui.Create("SpawnIcon", frame) --Icons
    IconA1:SetPos(3, 10)
    IconA1:SetParent(PanelA1)
    IconA1:SetModel("models/healthvial.mdl")
    IconA1:SetTooltip(nil)
    IconA1:SetSize(80, 70)
    local IconA2 = vgui.Create("SpawnIcon", frame)
    IconA2:SetPos(3, 10)
    IconA2:SetParent(PanelA2)
    IconA2:SetModel("models/Items/HealthKit.mdl")
    IconA2:SetTooltip(nil)
    IconA2:SetSize(80, 70)
    local IconA3 = vgui.Create("SpawnIcon", frame)
    IconA3:SetPos(3, 10)
    IconA3:SetParent(PanelA3)
    IconA3:SetModel("models/Items/HealthKit.mdl")
    IconA3:SetTooltip(nil)
    IconA3:SetSize(80, 70)
    local IconB1 = vgui.Create("SpawnIcon", frame) --Icons
    IconB1:SetPos(3, 10)
    IconB1:SetParent(PanelB1)
    IconB1:SetModel("models/Items/battery.mdl")
    IconB1:SetTooltip(nil)
    -- IconB1:SetSize(80,70)
    local IconB2 = vgui.Create("SpawnIcon", frame)
    IconB2:SetPos(3, 10)
    IconB2:SetParent(PanelB2)
    IconB2:SetModel("models/Items/battery.mdl")
    IconB2:SetTooltip(nil)
    --IconB2:SetSize(80,70)
    local IconB3 = vgui.Create("SpawnIcon", frame)
    IconB3:SetPos(3, 10)
    IconB3:SetParent(PanelB3)
    IconB3:SetModel("models/Items/hevsuit.mdl")
    IconB3:SetTooltip(nil)
    IconB3:SetSize(80, 70)
    local buttonClose = vgui.Create("DButton", frame)
    buttonClose:SetText("Close")
    buttonClose:SetPos(600 - 60, 6)
    buttonClose:SetSize(50, 30)

    buttonClose.DoClick = function()
        frame:Close()
    end

    if frame:OnClose() then
        print("Test")
    end
end

usermessage.Hook("openframe", myOpen)
