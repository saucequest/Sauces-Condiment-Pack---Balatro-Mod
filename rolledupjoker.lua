
SMODS.Joker{ --Rolled Up Joker
    key = "rolledupjoker",
    config = {
        extra = {
            totalshoprellored = 0
        }
    },
    loc_txt = {
        ['name'] = 'Rolled Up Joker',
        ['text'] = {
            [1] = 'Played {C:attention}Three of a Kind{}s give {C:red}+Mult{}',
            [2] = 'equal to the {C:attention}amount {}of times you',
            [3] = 'have {C:attention}rerolled {}during the run',
            [4] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 42
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_rerolls or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Three of a Kind" then
                return {
                    mult = (G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_rerolls or 0)
                }
            end
        end
    end
}