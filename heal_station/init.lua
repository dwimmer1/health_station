util.AddNetworkString("25health")
util.AddNetworkString("50health")
util.AddNetworkString("100health")
util.AddNetworkString("25armor")
util.AddNetworkString("50armor")
util.AddNetworkString("100armor")
AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_combine/health_charger001.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end
end

function ENT:AcceptInput(Name, Activator, Caller)
    if Name == "Use" and Caller:IsPlayer() then
        umsg.Start("openframe", Caller)
        umsg.End()
    end
end

-- items/medshotno1.wav
net.Receive("25health", function(len, ply)
    if ply:Health() < 100 then
        ply:SetHealth(ply:Health() + 25)

        if not ply:canAfford(50) then
            DarkRP.notify(ply, 1, 4, string.format("Das kannst du dir nicht leisten."))
        else
            ply:addMoney(-50)
        end
    end

    if ply:Health() > 100 or ply:Health() == 100 then
        ply:SetHealth(100)
        DarkRP.notify(ply, 1, 4, string.format("Du hast bereits die maximale Gesundheit erreicht."))
    end
end)

net.Receive("50health", function(len, ply)
    if ply:Health() < 100 then
        ply:SetHealth(ply:Health() + 50)

        if not ply:canAfford(50) then
            DarkRP.notify(ply, 1, 4, string.format("Das kannst du dir nicht leisten."))
        else
            ply:addMoney(-50)
        end
    end

    if ply:Health() > 100 or ply:Health() == 100 then
        ply:SetHealth(100)
        DarkRP.notify(ply, 1, 4, string.format("Du hast bereits die maximale Gesundheit erreicht."))
    end
end)

net.Receive("100health", function(len, ply)
    if ply:Health() < 100 then
        ply:SetHealth(100)

        if not ply:canAfford(50) then
            DarkRP.notify(ply, 1, 4, string.format("Das kannst du dir nicht leisten."))
        else
            ply:addMoney(-50)
        end
    end

    if ply:Health() == 100 then
        DarkRP.notify(ply, 1, 4, string.format("Du hast bereits die maximale Gesundheit erreicht."))
    end
end)

net.Receive("25armor", function(len, ply)
    if ply:Armor() < 100 then
        ply:SetArmor(ply:Armor() + 25)

        if not ply:canAfford(50) then
            DarkRP.notify(ply, 1, 4, string.format("Das kannst du dir nicht leisten."))
        else
            ply:addMoney(-50)
        end
    end

    if ply:Armor() > 100 or ply:Armor() == 100 then
        ply:SetArmor(100)
        DarkRP.notify(ply, 1, 4, string.format("Du hast bereits die maximale Rüstung erreicht."))
    end
end)

net.Receive("50armor", function(len, ply)
    if ply:Armor() < 100 then
        ply:SetArmor(ply:Armor() + 50)

        if not ply:canAfford(50) then
            DarkRP.notify(ply, 1, 4, string.format("Das kannst du dir nicht leisten."))
        else
            ply:addMoney(-50)
        end
    end

    if ply:Armor() > 100 or ply:Armor() == 100 then
        ply:SetArmor(100)
        DarkRP.notify(ply, 1, 4, string.format("Du hast bereits die maximale Rüstung erreicht."))
    end
end)

net.Receive("100armor", function(len, ply)
    if ply:Armor() < 100 then
        ply:SetArmor(100)
        DarkRP.notify(ply, 1, 4, string.format("Du hast bereits die maximale Rüstung erreicht."))

        if not ply:canAfford(50) then
            DarkRP.notify(ply, 1, 4, string.format("Das kannst du dir nicht leisten."))
        else
            ply:addMoney(-50)
        end
    end
     if ply:Armor() == 100 then
        DarkRP.notify(ply, 1, 4, string.format("Du hast bereits die maximale Rüstung erreicht."))
    end
end)
