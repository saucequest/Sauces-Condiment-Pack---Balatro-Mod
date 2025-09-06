SMODS.Joker{ --David Baszucki
    key = "davidbaszucki",
    config = {
        extra = {
            dollars = 12000000000
        }
    },
    loc_txt = {
        ['name'] = 'David Baszucki',
        ['text'] = {
            [1] = 'If a Jack is played, lose {C:money}$12,000,000,000{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 11 then
                return {
                    dollars = -card.ability.extra.dollars
                }
            end
        end
    end
}