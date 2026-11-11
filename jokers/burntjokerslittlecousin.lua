
SMODS.Joker{ --Burnt Jokers Little Cousin
    key = "burntjokerslittlecousin",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Burnt Jokers Little Cousin',
        ['text'] = {
            [1] = 'Apply {C:attention}Burning {}to cards in first hand {C:attention}discarded{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.discard  then
            if (G.GAME.current_round.discards_used <= 0 and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_burnt" then 
                        return true
                    end
                end
            end)()) then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_sauce_burning)
                    end,
                    message = "Card Modified!"
                }
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_burnt" then 
                        return true
                    end
                end
            end)() then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_sauce_burning)
                    end,
                    message = "Card Modified!"
                }
            end
        end
    end
}