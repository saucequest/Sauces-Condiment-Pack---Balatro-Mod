
SMODS.Joker{ --Joke of a Kind
    key = "jokeofakind",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Joke of a Kind',
        ['text'] = {
            [1] = 'Whenever a {C:dark_edition}Five of a Kind{} is played, give 5 {C:attention}Jimbos{}',
            [2] = '{C:inactive,s:0.8}Originates from{} {C:spectral,s:0.8}Discord{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_joker"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_joker\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Five of a Kind"]) then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil,
                    extra = {
                        message = created_joker and localize('k_plus_joker') or nil,
                        colour = G.C.BLUE,
                        extra = {
                            message = created_joker and localize('k_plus_joker') or nil,
                            colour = G.C.BLUE,
                            extra = {
                                message = created_joker and localize('k_plus_joker') or nil,
                                colour = G.C.BLUE,
                                extra = {
                                    message = created_joker and localize('k_plus_joker') or nil,
                                    colour = G.C.BLUE
                                }
                            }
                        }
                    }
                }
            end
        end
    end
}