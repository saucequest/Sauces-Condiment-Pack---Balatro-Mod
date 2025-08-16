SMODS.Joker{ --Asgores Burgentruck
    key = "asgoresburgentruck",
    config = {
        extra = {
            joker_slots = 1,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Asgores Burgentruck',
        ['text'] = {
            [1] = 'Adds a Joker slot when bought',
            [2] = 'When cards are discarded, adds a {C:dark_edition}Negative{} {C:spectral}Perishable{} Dess to your Jokers',
            [3] = 'Destroys 2 Desses in your Jokers when hand is done scoring',
            [4] = '',
            [5] = '{C:inactive}\"Driving in my car right after a beer!\"{}',
            [6] = '{C:inactive}Originates from{} {C:common}DELTARUNE{}',
            [7] = '{C:dark_edition}Follower-suggested{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Driving in my car right after a beer!", colour = G.C.DARK_EDITION})
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
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
                        joker_card:set_edition("e_negative", true)
                        
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
                return {
                    func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_sauce_dess" and not joker.ability.eternal and not joker.getting_sliced then
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "DUI? How about you die?", colour = G.C.RED})
                end
                    return true
                end
                }
        end
    end
}