
SMODS.Joker{ --Beer
    key = "beer",
    config = {
        extra = {
            roundsleft = 6,
            xmult0 = 0.8
        }
    },
    loc_txt = {
        ['name'] = 'Beer',
        ['text'] = {
            [1] = 'Cards scored give {X:red,C:white}X0.8{} Mult',
            [2] = 'After 6 rounds, become a {C:legendary}Legendary{} Joker',
            [3] = '{C:inactive}(#1# Rounds Left){}',
            [4] = '{C:inactive,s:0.8}\"I need a SMOKE BREAK!\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {X:attention,C:black,s:0.8}5SOS:{} {X:attention,C:black,s:0.8}Bean\'s{} {X:attention,C:black,s:0.8}Show{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.roundsleft}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                Xmult = 0.8
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if to_big((card.ability.extra.roundsleft or 0)) == to_big(0) then
                return {
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
                    extra = {
                        func = function()
                            
                            local created_joker = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Legendary' })
                                    if joker_card then
                                        
                                        
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
            else
                return {
                    func = function()
                        card.ability.extra.roundsleft = math.max(0, (card.ability.extra.roundsleft) - 1)
                        return true
                    end
                }
            end
        end
    end
}