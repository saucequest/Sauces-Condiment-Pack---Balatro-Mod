
SMODS.Joker{ --Beginner Balatro Player
    key = "beginner_balatro_player",
    config = {
        extra = {
            mult0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Beginner Balatro Player',
        ['text'] = {
            [1] = 'If hand is Two Pair, give {C:red}+10{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Two Pair" then
                return {
                    mult = 10
                }
            end
        end
    end
}