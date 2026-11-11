
SMODS.Joker{ --grand volley
    key = "grandvolley",
    config = {
        extra = {
            repetitions0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'grand volley',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} scored {C:attention}Electric{} cards',
            [2] = '4 times if hand is a {C:attention}Straight{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 39
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true and context.scoring_name == "Straight") then
                return {
                    repetitions = 4,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}