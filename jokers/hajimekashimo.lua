
SMODS.Joker{ --Hajime Kashimo
    key = "hajimekashimo",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Hajime Kashimo',
        ['text'] = {
            [1] = '{C:attention}Held face{} cards have a {C:green}#1# in #2#{} chance',
            [2] = 'to become {C:attention}Electric{}',
            [3] = '{C:inactive,s:0.8}\"...but that\'s how losers think.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Jujutsu {}{C:red,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 50
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_hajimekashimo') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(card, 'group_0_82e68a1d', 1, card.ability.extra.odds, 'j_sauce_hajimekashimo', false) then
                    SMODS.calculate_effect({func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_sauce_electric)
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                end
            end
        end
    end
}