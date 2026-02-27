local SCAN_THROTTLE       = 2
local DELVE_ACTIVITY_TYPE = 4
local DELVE_T8_MIN_LEVEL  = 8
local DELVERS_BOUNTY_ITEM = 233071

local QUEST_CALL_TO_DELVES  = 84776
local QUEST_MIDNIGHT_DELVES = 93909
local QUEST_NULLAEUS        = 93525

local lastScan = 0

MR:RegisterModule({
    key         = "delves",
    label       = "Delves",
    labelColor  = "#c8956c",
    resetType   = "weekly",
    defaultOpen = false,

    onScan = function(mod)
        local now = GetTime()
        if (now - lastScan) < SCAN_THROTTLE then return end
        lastScan = now

        if not C_WeeklyRewards or not C_WeeklyRewards.GetActivities then return end
        local activities = C_WeeklyRewards.GetActivities()
        if not activities then return end

        local db = MR.db.char.progress
        if not db[mod.key] then db[mod.key] = {} end

        for _, act in ipairs(activities) do
            if act.type == DELVE_ACTIVITY_TYPE then
                local runs = act.progress or 0
                local t8   = ((act.level or 0) >= DELVE_T8_MIN_LEVEL) and 1 or 0

                if db[mod.key]["delve_runs"] ~= runs then
                    db[mod.key]["delve_runs"] = runs
                end
                if db[mod.key]["delve_t8"] ~= t8 then
                    db[mod.key]["delve_t8"] = t8
                end
                break
            end
        end

        local bountyCount = C_Item.GetItemCount and C_Item.GetItemCount(DELVERS_BOUNTY_ITEM) or 0
        local bountyUsed  = (bountyCount == 0) and 1 or 0
        if db[mod.key]["delve_bounty"] ~= bountyUsed then
            db[mod.key]["delve_bounty"] = bountyUsed
        end
    end,

    rows = {
        {
            key      = "delve_weekly",
            label    = "|cffc8956cA Call to Delves (5):|r",
            max      = 1,
            note     = "Weekly from Archmage Aethas in Silvermoon",
            questIds = { QUEST_CALL_TO_DELVES },
        },
        {
            key      = "delve_valeera",
            label    = "|cffc8956cMidnight: Delves (3):|r",
            max      = 1,
            note     = "Weekly from Valeera Sanguinar at Delver's HQ — rewards Spark of Radiance",
            questIds = { QUEST_MIDNIGHT_DELVES },
        },
        {
            key     = "delve_runs",
            label   = "|cffc8956cDelve Runs:|r",
            max     = 8,
            note    = "Feeds Great Vault World slot (2/4/8)",
            liveKey = "delve_runs",
        },
        {
            key   = "delve_t8",
            label = "|cffc8956cTier 8 Delve Cleared:|r",
            max   = 1,
            note  = "Complete 8x Tier 8+ to maximise Great Vault ilvl",
        },
        {
            key     = "delve_bounty",
            label   = "|cffc8956cDelver's Bounty Used:|r",
            max     = 1,
            note    = "Loot drop from Nullaeus — use before killing the Delve boss",
            liveKey = "delve_bounty",
        },
        {
            key      = "delve_nullaeus",
            label    = "|cffc8956cNullaeus Defeated:|r",
            max      = 1,
            note     = "Summon via Beacon of Hope after checkpoint — Torment's Rise",
            questIds = { QUEST_NULLAEUS },
        },
    },
})