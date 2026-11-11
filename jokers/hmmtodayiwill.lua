
SMODS.Joker{ --hmm today i will
    key = "hmmtodayiwill",
    config = {
        extra = {
            ante_value0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'hmm today i will',
        ['text'] = {
            [1] = 'When {C:attention}shop {}is {C:attention}rerolled{}, do something {C:attention}clueless{}',
            [2] = '{C:inactive,s:0.8}^ clueless{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 28
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.reroll_shop  then
            return {
                
                func = function()
                    
                    local mod = 2
                    ease_ante(mod)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                            return true
                        end,
                    }))
                    return true
                end,
                message = "Ante +" .. 2
            }
        end
    end
}