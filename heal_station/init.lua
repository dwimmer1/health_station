util.AddNetworkString("start")
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

    --phys valid 
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

net.Receive("start", function(len, ply)
    local health = net.ReadUInt(8) --Nur Bit
    local str = net.ReadString()

    if str == "25health" or str == "50health" or str == "100health" then
        if ply:Health() < 100 then
            ply:SetHealth(ply:Health() + health)

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
    end

    if str == "25armor" or str == "50armor" or str == "100armor" then
        if ply:Armor() < 100 then
            ply:SetArmor(ply:Armor() + health)

            if not ply:canAfford(50) then
                DarkRP.notify(ply, 1, 4, string.format("Das kannst du dir nicht leisten."))
            else
                ply:addMoney(-50)
            end
        end

        if ply:Armor() > 100 or ply:Armor() == 100 then
            ply:SetArmor(100)
            DarkRP.notify(ply, 1, 4, string.format("Du hast bereits die maximale Gesundheit erreicht."))
        end
    end
end)
