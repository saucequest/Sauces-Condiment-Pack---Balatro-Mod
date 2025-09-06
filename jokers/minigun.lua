SMODS.Joker{ --Minigun
    key = "minigun",
    config = {
        extra = {
            miniguntime = 5,
            Xmult = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Minigun',
        ['text'] = {
            [1] = '{X:red,C:white}X1.2{} Mult whenever a card scored',
            [2] = 'Lasts for 5 rounds',
            [3] = '{C:dark_edition}Gun Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_gun"] = true },

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
        if context.starting_shop  then
            if (card.ability.extra.miniguntime or 0) == 0 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
            end
        end
    end
}