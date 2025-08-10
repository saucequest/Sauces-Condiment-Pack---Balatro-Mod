SMODS.Joker{ --Kevin
    key = "kevin",
    config = {
        extra = {
            dollars = 5,
            xchips = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Kevin',
        ['text'] = {
            [1] = 'Adds a {C:dark_edition}Negative{} pizza to your Jokers',
            [2] = 'Gives {C:gold}$5{} for each card discarded,',
            [3] = 'and gives {X:chips,C:white} x1.2{} Chips',
            [4] = '',
            [5] = '{C:inactive}\"Don\'t touch my pizza, don\'t touch my jelly!\"{}',
            [6] = '{C:inactive}Originates from{} {C:diamonds}Don\'t Touch My Pizza{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.discard  then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips
                }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_pizza' })
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
        end
                }
        end
    end
}