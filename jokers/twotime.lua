
SMODS.Joker{ --Two Time
    key = "twotime",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Two Time',
        ['text'] = {
            [1] = '{C:attention}Prevents {}death but {C:hearts}destroys{} the {C:attention}rightmost {}Joker when preventing.',
            [2] = '{C:red}self-destructs{}',
            [3] = '{C:inactive,s:0.8}\"Shadows die twice.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:spades,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 26
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_twotime")
                    
                    return true
                end,
            }))
            return {
                saved = true,
                message = localize('k_saved_ex'),
                extra = {
                    func = function()
                        local target_joker = nil
                        for i = #G.jokers.cards, 1, -1 do
                            local joker = G.jokers.cards[i]
                            if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
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
                            local target_joker = card
                            
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
                        colour = G.C.RED
                    }
                }
            }
        end
    end
}