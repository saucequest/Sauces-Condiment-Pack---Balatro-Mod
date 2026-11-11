
SMODS.Joker{ --9. The Fire Rises
    key = "thefirerises",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = '9. The Fire Rises',
        ['text'] = {
            [1] = '{C:attention}Held {}in hand cards have a',
            [2] = '{C:green}#1# in #2#{} chance to become {C:attention}Burning{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 35
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_thefirerises') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_55c05ed5', 1, card.ability.extra.odds, 'j_sauce_thefirerises', false) then
                    SMODS.calculate_effect({func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_sauce_burning)
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                end
            end
        end
    end
}