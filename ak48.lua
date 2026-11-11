
SMODS.Joker{ --AK47
    key = "ak48",
    config = {
        extra = {
            aktime = 4,
            xmult0 = 1.3
        }
    },
    loc_txt = {
        ['name'] = 'AK47',
        ['text'] = {
            [1] = '{X:red,C:white}X1.3{} Mult for 4 rounds',
            [2] = '{C:dark_edition}Gun Joker{}',
            [3] = '({C:inactive}#1# Rounds Remaining){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
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
    pools = { ["sauce_gun"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.aktime}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 1.3
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.aktime = math.max(0, (card.ability.extra.aktime) - 1)
                    return true
                end
            }
        end
        if context.using_consumeable  then
            if context.consumeable and (context.consumeable.ability.set == 'item' or context.consumeable.ability.set == 'item') and context.consumeable.config.center.key == 'c_sauce_bullet' then
                return {
                    func = function()
                        card.ability.extra.aktime = (card.ability.extra.aktime) + 1
                        return true
                    end
                }
            end
        end
    end
}