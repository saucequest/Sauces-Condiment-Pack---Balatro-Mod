SMODS.Joker{ --U
    key = "u",
    config = {
        extra = {
            retriggers = 1,
            yes = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'U',
        ['text'] = {
            [1] = 'Retriggers rightmost Joker',
            [2] = 'When round ends, {C:red}destroys {}rightmost Joker',
            [3] = '{C:inactive}\"I\'ll make you love me too, I am ALL OF YOU!\"{}',
            [4] = '{C:inactive}Originates from{} {C:diamonds}Burger King Disaster{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 9
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
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
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[5]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}