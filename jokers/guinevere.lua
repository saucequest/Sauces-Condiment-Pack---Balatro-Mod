
SMODS.Joker{ --Guinevere
    key = "guinevere",
    config = {
        extra = {
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'Guinevere',
        ['text'] = {
            [1] = '{C:attention}Face Cards{} scored become {C:attention}Steel{}',
            [2] = '{C:green}#1# in #2#{} chance to make {C:attention}Face {}Card a {C:attention}Blue Seal',
            [3] = '{C:attention}Meat Card {}instead',
            [4] = '{C:inactive,s:0.8}\"Well, hello, little ones. I\'m Princess Guinevere.\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Knights {}{C:spectral,s:0.8}of{} {C:blue,s:0.8}Guinevere{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_steel"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_sauce_meat"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_meat\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_guinevere') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_steel)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                if SMODS.pseudorandom_probability(card, 'group_0_bbc505ff', 1, card.ability.extra.odds, 'j_sauce_guinevere', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_sauce_meatcard)
                            scored_card:set_seal("Blue", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}