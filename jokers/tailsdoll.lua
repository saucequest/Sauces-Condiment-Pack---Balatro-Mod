
SMODS.Joker{ --Tails Doll
    key = "tailsdoll",
    config = {
        extra = {
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Tails Doll',
        ['text'] = {
            [1] = '{C:diamonds}Diamond{} cards become {C:attention}Jacks{}',
            [2] = 'Scored {C:diamonds}Diamond{} cards have a',
            [3] = '{C:green}#1# in #2#{} chance to be {C:red}destroyed{}',
            [4] = '{C:inactive,s:0.8}\"Can you feel the sunshine?\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 24
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_tailsdoll') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_suit("Diamonds") then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "Jack"))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                if SMODS.pseudorandom_probability(card, 'group_0_ff4ddbad', 1, card.ability.extra.odds, 'j_sauce_tailsdoll', false) then
                    context.other_card.should_destroy = true
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
    end
}