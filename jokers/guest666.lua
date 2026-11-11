
SMODS.Joker{ --Guest 666
    key = "guest666",
    config = {
        extra = {
            guesttransform = 6
        }
    },
    loc_txt = {
        ['name'] = 'Guest 666',
        ['text'] = {
            [1] = '{C:red}+6{} Mult when bought',
            [2] = 'Gains {C:attention}6 {}more Mult whenever a Card is {C:attention}destroyed{}',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}',
            [4] = '{C:inactive,s:0.8}\"Your worst nightmare.\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {X:red,C:white,s:0.8}ObliviousHD{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.guesttransform}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.guesttransform or 0)) < to_big(66) then
                return {
                    mult = card.ability.extra.guesttransform
                }
            end
        end
        if context.remove_playing_cards  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.guesttransform = (card.ability.extra.guesttransform) + 6
                    return true
                end
            }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.guesttransform = (card.ability.extra.guesttransform) + 6
                    return true
                end
            }
        end
    end
}