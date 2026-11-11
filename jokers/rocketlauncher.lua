
SMODS.Joker{ --Rocket Launcher
    key = "rocketlauncher",
    config = {
        extra = {
            missilesleft = 1,
            xmult0 = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Rocket Launcher',
        ['text'] = {
            [1] = '{X:mult,C:white}X2.5{} Mult on {C:attention}next {}hand',
            [2] = '{C:red}Does not{} give Mult {C:attention}at all{} for the run {C:attention}after {}the round',
            [3] = '{C:dark_edition}Gun Joker{}',
            [4] = '{C:inactive}(#1# rounds remaining){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 21
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_gun"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.missilesleft}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.missilesleft or 0)) == to_big(1) then
                card.ability.extra.missilesleft = math.max(0, (card.ability.extra.missilesleft) - 1)
                return {
                    Xmult = 2.5
                }
            end
        end
        if context.using_consumeable  then
            if context.consumeable and (context.consumeable.ability.set == 'item' or context.consumeable.ability.set == 'item') and context.consumeable.config.center.key == 'c_sauce_bullet' then
                return {
                    func = function()
                        card.ability.extra.missilesleft = (card.ability.extra.missilesleft) + 1
                        return true
                    end
                }
            end
        end
    end
}