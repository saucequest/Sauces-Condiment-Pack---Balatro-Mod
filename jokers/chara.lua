SMODS.Joker{ --Chara
    key = "chara",
    config = {
        extra = {
            killcount = 1,
            rerollmult = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Chara',
        ['text'] = {
            [1] = 'At the end of round, {C:red}destroy {}a random Joker,',
            [2] = 'multiply its sell value by {C:money}#2#{}, and then add it to its {X:mult,C:white}XMult{}.',
            [3] = 'Scored 9s add {C:money}0.1{} to the multiplier the sell',
            [4] = 'value will be multiplied by',
            [5] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult.){}',
            [6] = '{C:inactive}\"SINCE WHEN WERE YOU THE ONE IN CONTROL?\"{}',
            [7] = '{C:inactive}Originates from{} {C:hearts}Undertale{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
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
        x = 9,
        y = 1
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.killcount, card.ability.extra.rerollmult}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 9 then
                card.ability.extra.rerollmult = (card.ability.extra.rerollmult) + 0.1
            end
        end
    end
}