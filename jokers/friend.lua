
SMODS.Joker{ --Friend
    key = "friend",
    config = {
        extra = {
            corruption = 0,
            hand_size0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Friend',
        ['text'] = {
            [1] = 'When {C:attention}Boss {}defeated, increase {C:attention}hand size{} by 2',
            [2] = 'After 20 {C:attention}Red {}Suit {C:inactive}(#1#) {}cards have been {C:attention}scored{},',
            [3] = 'become an {C:attention}Eternal {}Cursed Joker',
            [4] = '{C:inactive,s:0.8}\"Close to Me!\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}Just Shapes{} {C:blue,s:0.8}and Beats{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.corruption}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Hand Limit", colour = G.C.BLUE})
                    
                    G.hand:change_size(2)
                    return true
                end
            }
        end
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") and to_big((card.ability.extra.corruption or 0)) < to_big(20)) then
                card.ability.extra.corruption = (card.ability.extra.corruption) + 1
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.corruption or 0)) == to_big(20) then
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
                                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'sauce_cursed' })
                                    if joker_card then
                                        
                                        joker_card:add_sticker('eternal', true)
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
            end
        end
    end
}