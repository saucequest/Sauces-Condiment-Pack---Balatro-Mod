SMODS.Joker{ --Cementful
    key = "cementful",
    config = {
        extra = {
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'Cementful',
        ['text'] = {
            [1] = 'Give {C:money}$3{} if played {C:attention}Stone{} card was previously a Face card',
            [2] = '{C:inactive}\"Sorry Artful, but in order to be part of the Forsaken x Die Of Death collab,',
            [3] = 'you have to be submerged in cement.\"{}',
            [4] = '{C:inactive}Originates from{} {C:green}Di{}{C:common}e o{}{C:dark_edition}f D{}{C:money}ea{}{C:red}th{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        if context.individual and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_stone"] == true and context.other_card:is_face()) then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}