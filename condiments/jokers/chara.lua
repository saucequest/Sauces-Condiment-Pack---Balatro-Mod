SMODS.Joker{ --Chara
    key = "chara",
    config = {
        extra = {
            killcount = 1
        }
    },
    loc_txt = {
        ['name'] = 'Chara',
        ['text'] = {
            [1] = 'At the end of round, {C:red}destroy {}a random Joker,',
            [2] = 'multiply its sell value by {C:money}0.1{}, and then add it to its {X:mult,C:white}XMult{}.',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult.){}',
            [4] = '{C:inactive}\"SINCE WHEN WERE YOU THE ONE IN CONTROL?\"{}',
            [5] = '{C:inactive}Originates from{} {C:hearts}Undertale{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 9,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 0
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.killcount}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    local joker_sell_value = target_joker.sell_cost or 0
                    local sell_value_gain = joker_sell_value * 0.1
                    card.ability.extra.killcount = card.ability.extra.killcount + sell_value_gain
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
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.killcount
                }
        end
    end
}