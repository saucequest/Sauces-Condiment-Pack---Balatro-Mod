SMODS.Joker{ --Divadayo
    key = "divadayo",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Divadayo',
        ['text'] = {
            [1] = 'Scored Queens get a {C:attention}Blue{} Seal',
            [2] = '{C:inactive}\"I wanna see \'em try ragebaiting me now!\"{}',
            [3] = '{C:inactive}Originates from{} {C:common}Project Diva: {}{C:spectral}Deep Blue{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
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
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 12 then
                context.other_card:set_seal("Blue", true)
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}