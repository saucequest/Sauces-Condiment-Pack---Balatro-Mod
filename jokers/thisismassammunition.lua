
SMODS.Joker{ --This is... MASS AMMUNITION!
    key = "thisismassammunition",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'This is... MASS AMMUNITION!',
        ['text'] = {
            [1] = 'When {C:attention}sold{}, gives a {C:attention}Flintlock {}and a {C:dark_edition}Shedletsky Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 26
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_shed"] = true, ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_flintlock' })
                                if joker_card then
                                    
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end,
                extra = {
                    func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'sauce_shed' })
                                    if joker_card then
                                        
                                        
                                    end
                                    G.GAME.joker_buffer = 0
                                    return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end,
                    colour = G.C.BLUE
                }
            }
        end
    end
}