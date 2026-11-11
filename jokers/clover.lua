
SMODS.Joker{ --Clover
    key = "clover",
    config = {
        extra = {
            mod_probability0 = 999
        }
    },
    loc_txt = {
        ['name'] = 'Clover',
        ['text'] = {
            [1] = 'Sets all {C:green}probabilties{} to always {C:attention}occur{}',
            [2] = '{C:inactive,s:0.8}\"That\'s a perfect solution!\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Inanimate {}{C:money,s:0.8}Insanity{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.mod_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator * (999)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}