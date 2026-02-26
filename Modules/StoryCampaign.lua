local LIGHTS_SUMMONS = {
    key         = "story_lights_summons",
    label       = "Story: The Light's Summons",
    labelColor  = "#ffff99",
    resetType   = "never",
    defaultOpen = true,
    rows = {
        { key = "q_91281", label = "|cffffff88Midnight:|r",                  max = 1, questIds = { 91281 } },
        { key = "q_88719", label = "|cffffff88A Voice from the Light:|r",    max = 1, questIds = { 88719 } },
        { key = "q_86769", label = "|cffffff88Last Bastion of the Light:|r", max = 1, questIds = { 86769 } },
        { key = "q_86770", label = "|cffffff88Champions of Quel'Danas:|r",   max = 1, questIds = { 86770 } },
        { key = "q_89271", label = "|cffffff88My Son:|r",                    max = 1, questIds = { 89271 } },
        { key = "q_86780", label = "|cffffff88Where Heroes Hold:|r",         max = 1, questIds = { 86780 } },
        { key = "q_86805", label = "|cffffff88The Hour of Need:|r",          max = 1, questIds = { 86805 } },
        { key = "q_89012", label = "|cffffff88A Safe Path:|r",               max = 1, questIds = { 89012 } },
        { key = "q_86806", label = "|cffffff88Luminous Wings:|r",            max = 1, questIds = { 86806 } },
        { key = "q_86807", label = "|cffffff88The Gate:|r",                  max = 1, questIds = { 86807 } },
        { key = "q_91274", label = "|cffffff88Severing the Void:|r",         max = 1, questIds = { 91274 } },
        { key = "q_86834", label = "|cffffff88Voidborn Banishing:|r",        max = 1, questIds = { 86834 } },
        { key = "q_86811", label = "|cffffff88Ethereal Eradication:|r",      max = 1, questIds = { 86811 } },
        { key = "q_86848", label = "|cffffff88Light's Arsenal:|r",           max = 1, questIds = { 86848 } },
        { key = "q_86849", label = "|cffffff88Wrath Unleashed:|r",           max = 1, questIds = { 86849 } },
        { key = "q_86850", label = "|cffffff88Broken Sun:|r",                max = 1, questIds = { 86850 } },
        { key = "q_86852", label = "|cffffff88Light's Last Stand:|r",        max = 1, questIds = { 86852 } },
    },
}

MR:RegisterModule(LIGHTS_SUMMONS)
