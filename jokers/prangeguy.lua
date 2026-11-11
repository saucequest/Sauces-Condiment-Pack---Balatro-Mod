
SMODS.Joker{ --Prange Guy
    key = "prangeguy",
    config = {
        extra = {
            mult0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Prange Guy',
        ['text'] = {
            [1] = '{C:attention}Diet Colas{} give {C:red}+10{} Mult',
            [2] = '{C:inactive,s:0.8}“Definitely in the thick of that right now.”{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:tarot,s:0.8}Vs. OURPLE GUY{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 20
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_diet_cola"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_diet_cola\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.other_joker  then
            if context.other_joker.config.center.key == "j_dietcola" then
                return {
                    mult = 10
                }
            end
        end
    end
}