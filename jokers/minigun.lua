SMODS.Joker{ --Minigun
    key = "minigun",
    config = {
        extra = {
            miniguntime = 5,
            Xmult = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Minigun',
        ['text'] = {
            [1] = '{X:red,C:white}X1.1{} Mult whenever a card scored',
            [2] = 'Lasts for 5 rounds'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    card.ability.extra.miniguntime = math.max(0, (card.ability.extra.miniguntime) - 1)
                    return true
                end
                }
        end
    end
}