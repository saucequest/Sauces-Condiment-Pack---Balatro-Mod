
SMODS.Joker{ --Asgores Burgentruck
    key = "asgoresburgentruck",
    config = {
        extra = {
            joker_slots0 = 1,
            repetitions = 999
        }
    },
    loc_txt = {
        ['name'] = 'Asgores Burgentruck',
        ['text'] = {
            [1] = 'Adds a {C:attention}Joker slot{} when bought',
            [2] = 'When cards are {C:attention}discarded{}, adds a {C:attention}Dess {}to your Jokers',
            [3] = '{C:red}Destroys {}{C:attention}Desses{} in your Jokers when hand is {C:attention}done scoring{}',
            [4] = '',
            [5] = '{C:inactive,s:0.8}\"Driving in my car right after a beer!\"{}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}DELTARUNE{}',
            [7] = '{C:dark_edition,s:0.8}Follower-suggested{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_burgentruck")
                    
                    return true
                end,
            }))
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Driving in my car right after a beer!", colour = G.C.DARK_EDITION})
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                    return true
                end
            }
        end
        if context.pre_discard  then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_dess' })
                            if joker_card then
                                
                                
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Hey, that bump is shaped like a deer!", colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if true then
                for i = 1, 999 do
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_dess" and not joker.getting_sliced then
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "DUI? How about you die?", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}