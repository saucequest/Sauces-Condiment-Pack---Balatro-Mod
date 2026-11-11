
SMODS.Joker{ --Autopsy Report
    key = "autopsyreport",
    config = {
        extra = {
            autopsy = 1
        }
    },
    loc_txt = {
        ['name'] = 'Autopsy Report',
        ['text'] = {
            [1] = '{C:attention}Selling {}cards during a {C:attention}Boss{}',
            [2] = 'adds {X:mult,C:white}X0.25{} Mult to this Joker',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}',
            [4] = '{C:inactive}Concept and art by Inky{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 44
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.autopsy}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_card  and not context.blueprint then
            if G.GAME.blind.boss then
                return {
                    func = function()
                        card.ability.extra.autopsy = (card.ability.extra.autopsy) + 0.25
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.autopsy
            }
        end
    end
}