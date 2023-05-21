local Addon = LibStub('AceAddon-3.0'):GetAddon('WoWthing_Collector')
local Module = Addon:NewModule('XP')


function Module:OnEnable()
    self:RegisterBucketEvent({ 'PLAYER_UPDATE_RESTING', 'UPDATE_EXHAUSTION' }, 1, 'UpdateRested')
    self:RegisterBucketEvent({ 'PLAYER_XP_UPDATE' }, 1, 'UpdateXP')
end

function Module:OnEnteringWorld()
    self:UpdateRested()
    self:UpdateXP({ player = 1 })
end

function Module:UpdateRested()
    Addon.charData.isResting = IsResting()
    Addon.charData.restedXP = GetXPExhaustion() or 0
end

function Module:UpdateXP(units)
    if units.player then
        Addon.charData.level = UnitLevel('player')
        Addon.charData.levelXp = UnitXP('player')
    end
end
