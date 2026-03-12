local L = LibStub("AceLocale-3.0"):GetLocale("MidnightRoutine")

local HOLIDAY_TIMEWALKING = {
    1056,
    1063,
    1326,
    1400,
    1404,
    1500,
}

local function IsHolidayActive(holidayId)
    if not C_DateAndTime or not C_DateAndTime.GetHolidayInfo then return false end
    local info = C_DateAndTime.GetHolidayInfo(holidayId)
    return info ~= nil and info.startTime ~= nil and GetServerTime() >= info.startTime and GetServerTime() <= info.endTime
end

local function IsTimewalkingActive()
    for _, id in ipairs(HOLIDAY_TIMEWALKING) do
        if IsHolidayActive(id) then return true end
    end
    return false
end

local MAPID_ISLE_OF_DORN     = 2248
local MAPID_RINGING_DEEPS    = 2249
local MAPID_HALLOWFALL       = 2255
local MAPID_AZJ_KAHET        = 2346

local function IsInMap(mapId)
    local current = C_Map.GetBestMapForUnit and C_Map.GetBestMapForUnit("player")
    if not current then return false end
    local checked = 0
    while current and checked < 10 do
        if current == mapId then return true end
        local info = C_Map.GetMapInfo(current)
        current = info and info.parentMapID
        checked = checked + 1
    end
    return false
end

MR:RegisterModule({
    key         = "world_bosses",
    label       = L["WB_Title"],
    labelColor  = "#ff4444",
    resetType   = "weekly",
    defaultOpen = true,
    isVisible   = function()
        return IsInMap(MAPID_ISLE_OF_DORN)
            or IsInMap(MAPID_RINGING_DEEPS)
            or IsInMap(MAPID_HALLOWFALL)
            or IsInMap(MAPID_AZJ_KAHET)
    end,
    rows = {
        {
            key       = "skarmorak",
            label     = L["WB_Skarmorak_Label"],
            max       = 1,
            note      = L["WB_Skarmorak_Note"],
            questIds  = { 78319 },
            isVisible = function() return IsInMap(MAPID_ISLE_OF_DORN) end,
        },
        {
            key       = "aggregation",
            label     = L["WB_Aggregation_Label"],
            max       = 1,
            note      = L["WB_Aggregation_Note"],
            questIds  = { 83173 },
            isVisible = function() return IsInMap(MAPID_RINGING_DEEPS) end,
        },
        {
            key       = "odalrik",
            label     = L["WB_Odalrik_Label"],
            max       = 1,
            note      = L["WB_Odalrik_Note"],
            questIds  = { 80385 },
            isVisible = function() return IsInMap(MAPID_HALLOWFALL) end,
        },
        {
            key       = "echo_forgotten",
            label     = L["WB_Echo_Label"],
            max       = 1,
            note      = L["WB_Echo_Note"],
            questIds  = { 84446 },
            isVisible = function() return IsInMap(MAPID_AZJ_KAHET) end,
        },
    },
})

MR:RegisterModule({
    key         = "timewalking",
    label       = L["TW_DungeonTitle"],
    labelColor  = "#66ccff",
    resetType   = "weekly",
    defaultOpen = true,
    isVisible   = IsTimewalkingActive,

    rows = {
        {
            key      = "tw_weekly",
            label    = L["TW_Weekly_Label"],
            max      = 1,
            note     = L["TW_Weekly_Note"],
            questIds = { 40753, 40173, 40786, 40785, 45566, 62786 },
        },
    },
})
