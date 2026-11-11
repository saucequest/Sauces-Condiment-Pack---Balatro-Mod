
SMODS.Joker{ --Sonic the Hedgehog
    key = "sonicthehedgehog",
    config = {
        extra = {
            sonicpeelout = 1
        }
    },
    loc_txt = {
        ['name'] = 'Sonic the Hedgehog',
        ['text'] = {
            [1] = 'Changes {C:attention}all cards{} played in the {C:attention}first {}hand of the round',
            [2] = 'into {C:enhanced}Electric {}Enhanced cards.',
            [3] = '{C:inactive,s:0.8}\"What you see is what you get! Just a guy that loves adventure!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:spectral,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 23
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
    pools = { ["sauce_sonic"] = true },
    soul_pos = {
        x = 2,
        y = 23
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.sonicpeelout}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if G.GAME.current_round.hands_played == 0 then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_electric)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Gotta go fast!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}