
SMODS.Joker{ --Flintlock
    key = "flintlock",
    config = {
        extra = {
            odds = 2,
            xmult0 = 2,
            odds2 = 5,
            xmult = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Flintlock',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance for {X:mult,C:white}X2{} Mult',
            [2] = '{C:green}1 in 5{} chance to {C:red}destroy {}self when hand played and give {X:mult,C:white}X0.1{} Mult',
            [3] = '{C:inactive}Belongs to a certain gambler...{}',
            [4] = '{C:inactive}Chances cannot be edited{}',
            [5] = '{C:dark_edition}Gun Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_gun"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_flintlock')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_flintlock')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_2a8a55f3', 1, card.ability.extra.odds, 'j_sauce_flintlock', true) then
                    SMODS.calculate_effect({Xmult = 2}, card)
                end
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_d42ebed3', 1, card.ability.extra.odds2, 'j_sauce_flintlock', true) then
                    local target_joker = card
                    
                    if target_joker then
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:explode({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    SMODS.calculate_effect({Xmult = 0.1}, card)
                end
            end
        end
    end
}