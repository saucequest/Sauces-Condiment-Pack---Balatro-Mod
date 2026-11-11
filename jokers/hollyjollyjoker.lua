
SMODS.Joker{ --Holly Jolly Joker
    key = "hollyjollyjoker",
    config = {
        extra = {
            currentmonth = 0,
            mult0 = 8
        }
    },
    loc_txt = {
        ['name'] = 'Holly Jolly Joker',
        ['text'] = {
            [1] = '{C:mult}+8{} Mult if played hand contains a {C:orange}Pair{}',
            [2] = 'and if it is {C:attention}December{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 42
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {os.date("*t", os.time()).month}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (next(context.poker_hands["Pair"]) and to_big(os.date("*t", os.time()).month) == to_big(12)) then
                return {
                    mult = 8
                }
            end
        end
    end
}