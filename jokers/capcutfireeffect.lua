
SMODS.Joker{ --Capcut Fire Effect
    key = "capcutfireeffect",
    config = {
        extra = {
            repetitions0_min = NaN,
            repetitions0_max = 5
        }
    },
    loc_txt = {
        ['name'] = 'Capcut Fire Effect',
        ['text'] = {
            [1] = 'Scored {C:attention}Burning {}cards are',
            [2] = '{C:attention}retriggered{} 2-5 times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 32
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_sauce_burning"] == true then
                return {
                    repetitions = pseudorandom('RANGE:2|5', 2, 5),
                    message = localize('k_again_ex')
                }
            end
        end
    end
}