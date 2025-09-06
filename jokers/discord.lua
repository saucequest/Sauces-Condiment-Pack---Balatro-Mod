SMODS.Joker{ --Discord
    key = "discord",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Discord',
        ['text'] = {
            [1] = 'Cards scored will be given {C:red}Discord Ping {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
                context.other_card:set_seal("sauce_discordping", true)
                return {
                    message = "Card Modified!"
                }
        end
    end
}