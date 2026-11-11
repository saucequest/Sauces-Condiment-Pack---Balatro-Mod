
SMODS.Joker{ --Sauces Condiment Pack
    key = "saucescondimentpack",
    config = {
        extra = {
            xmult0 = 2.5,
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'Sauces Condiment Pack',
        ['text'] = {
            [1] = '{X:mult,C:white}X2.5{} Mult',
            [2] = '{C:green}#1# in #2#{} chance to {C:attention}crash {}the game when',
            [3] = 'a Joker is {C:attention}evaluated{}',
            [4] = '{C:inactive,s:0.8}\"xmult joker 762246039\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 22
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_saucescondimentpack') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 2.5
            }
        end
        if context.other_joker  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_367e7382', 1, card.ability.extra.odds, 'j_sauce_saucescondimentpack', false) then
                    error("attempted to compare num w/ table")
                    
                end
            end
        end
    end
}