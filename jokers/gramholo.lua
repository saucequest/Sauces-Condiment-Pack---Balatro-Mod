
SMODS.Joker{ --gramHolo
    key = "gramholo",
    config = {
        extra = {
            invertedxmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'gramHolo',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.25{} Mult every time a',
            [2] = '{C:attention}playing card{} is destroyed',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 34
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.invertedxmult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.invertedxmult
            }
        end
        if context.remove_playing_cards  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.invertedxmult = (card.ability.extra.invertedxmult) + 0.25
                    return true
                end
            }
        end
    end
}