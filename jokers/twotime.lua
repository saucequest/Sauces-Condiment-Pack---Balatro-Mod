SMODS.Joker{ --Two Time
    key = "twotime",
    config = {
        extra = {
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Two Time',
        ['text'] = {
            [1] = 'Prevents death but {C:hearts}destroys{} the rightmost Joker when preventing.',
            [2] = '',
            [3] = '{C:inactive}\"Shadows die twice.\"{}',
            [4] = '{C:inactive}Originates from{} {C:spades}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 5
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
                local target_joker = nil
                for i = #G.jokers.cards, 1, -1 do
                    local joker = G.jokers.cards[i]
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
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
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Destroyed!",
                            colour = G.C.RED
                        }
                        }
                }
        end
    end
}