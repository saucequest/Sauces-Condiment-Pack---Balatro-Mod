SMODS.Joker{ --Die of Death
    key = "dieofdeath",
    config = {
        extra = {
            xmult = 1,
            odds = 5,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Die of Death',
        ['text'] = {
            [1] = 'Whenever a Joker is evaluated, {C:green}1 in 5 {}chance to {C:red}destroy{} a random Joker',
            [2] = 'and add {X:red,C:white}X0.5{} Mult to {X:mult,C:white}xMult{}',
            [3] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}',
            [4] = '{C:inactive}Made for{} {E:10}{C:dark_edition}Joker Jam #0{}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
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

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_dieofdeath') 
        return {vars = {card.ability.extra.xmult, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.other_joker  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_16da66c3', 1, card.ability.extra.odds, 'j_sauce_dieofdeath', false) then
              SMODS.calculate_effect({func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                    return true
                end}, card)
                        SMODS.calculate_effect({func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 0.5
                    return true
                end}, card)
          end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.xmult
                }
        end
    end
}