SMODS.Joker{ --NIKU
    key = "niku",
    config = {
        extra = {
            crowsofmoribund = 0
        }
    },
    loc_txt = {
        ['name'] = 'NIKU',
        ['text'] = {
            [1] = 'Prevents death {C:dark_edition}three {}times.',
            [2] = 'Makes 2 {C:dark_edition}Negative {}{C:tarot}Eternal {}Crows whenever preventing death.',
            [3] = 'On third prevention, creates an Ultimate Chimera',
            [4] = 'and destroys itself',
            [5] = '{C:inactive}\"one life, just one life is enough for me.\"{}',
            [6] = '{C:inactive}Originates from{} {C:rare}Sonic Originals{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            if (card.ability.extra.crowsofmoribund or 0) < 2 then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
                    card.ability.extra.crowsofmoribund = (card.ability.extra.crowsofmoribund) + 1
                    return true
                end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_crow' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                            colour = G.C.BLUE,
                        extra = {
                            func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_crow' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                            colour = G.C.BLUE
                        }
                        }
                        }
                }
            elseif (card.ability.extra.crowsofmoribund or 0) == 2 then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_ultimatechimera' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE,
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
    end
}