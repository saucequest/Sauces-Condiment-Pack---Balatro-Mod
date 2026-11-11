
SMODS.Joker{ --FFF. Harsh Truths
    key = "fffharshtruths",
    config = {
        extra = {
            harshtruths = 1.06
        }
    },
    loc_txt = {
        ['name'] = 'FFF. Harsh Truths',
        ['text'] = {
            [1] = '{X:red,C:white}X0.5{} Mult for every {C:attention}Sonic {}Booster',
            [2] = 'Pack and {C:attention}Sinister Minds{} Booster Pack',
            [3] = 'opened',
            [4] = '{C:inactive}(Currently {}{X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 45
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true, ["sauce_sinisterminds"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.harshtruths}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.harshtruths
            }
        end
        if context.open_booster  and not context.blueprint then
            if (to_big(context.card.config.center.key) == to_big(0) or to_big(context.card.config.center.key) == to_big(0)) then
                return {
                    func = function()
                        card.ability.extra.harshtruths = (card.ability.extra.harshtruths) + 0.5
                        return true
                    end
                }
            end
        end
    end
}