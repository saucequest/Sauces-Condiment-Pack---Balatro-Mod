
SMODS.Joker{ --Virtual Boy
    key = "virtualboy",
    config = {
        extra = {
            mult0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Virtual Boy',
        ['text'] = {
            [1] = 'If card scored is a {C:attention}red suit{} and player\'s',
            [2] = 'OS is not {C:attention}Windows{}, give {C:red}+10{} Mult for that card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 26
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
    soul_pos = {
        x = 9,
        y = 26
    },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") and not (love.system.getOS() == "Windows")) then
                return {
                    mult = 10
                }
            end
        end
    end
}