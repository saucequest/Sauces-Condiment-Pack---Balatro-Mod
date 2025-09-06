SMODS.Joker{ --Doombringer
    key = "doombringer",
    config = {
        extra = {
            doommult = 0,
            yes = 0
        }
    },
    loc_txt = {
        ['name'] = 'Doombringer',
        ['text'] = {
            [1] = 'When Blind ends, {C:red}destroy {}the rightmost Joker',
            [2] = 'When destroying a Joker, Doombringer will add its sell value',
            [3] = 'to their {C:red}+Mult{}',
            [4] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}',
            [5] = '{C:inactive}\"It\'s MrDoomBringer! We must flee!\"{}',
            [6] = '{C:inactive}Originates from{} {C:red}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 4
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.doommult}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                return {
                    func = function()
                local target_joker = nil
                for i = #G.jokers.cards, 1, -1 do
                    local joker = G.jokers.cards[i]
                    if joker ~= card and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
                    local joker_sell_value = target_joker.sell_cost or 0
                    local sell_value_gain = joker_sell_value * 1
                    card.ability.extra.doommult = card.ability.extra.doommult + sell_value_gain
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
                    mult = card.ability.extra.doommult
                }
        end
    end
}