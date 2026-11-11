
SMODS.Joker{ --Play My Game
    key = "playmygame",
    config = {
        extra = {
            playmygame = 1
        }
    },
    loc_txt = {
        ['name'] = 'Play My Game',
        ['text'] = {
            [1] = 'When a card is {C:attention}bought{}, gain {X:red,C:white}X0.25{} Mult',
            [2] = 'When the shop is {C:attention}rerolled{}, lose {X:red,C:white}X0.15{} Mult',
            [3] = '{C:inactive}(Currently {}{X:mult,C:white}X#1#{} {C:inactive}Mult) {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 30
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.playmygame}}
    end,
    
    calculate = function(self, card, context)
        if context.buying_card  then
            return {
                func = function()
                    card.ability.extra.playmygame = (card.ability.extra.playmygame) + 0.25
                    return true
                end
            }
        end
        if context.reroll_shop  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.playmygame = math.max(0, (card.ability.extra.playmygame) - 0.15)
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.playmygame
            }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.playmygame = (card.ability.extra.playmygame) + 0.25
                    return true
                end
            }
        end
    end
}