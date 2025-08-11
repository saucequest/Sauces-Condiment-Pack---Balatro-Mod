SMODS.Joker{ --Dess
    key = "dess",
    config = {
        extra = {
            chips = 25,
            dollars = 10
        }
    },
    loc_txt = {
        ['name'] = 'Dess',
        ['text'] = {
            [1] = '{C:blue}+25{} Chips when card scored',
            [2] = 'When a card is destroyed, gives {C:money}$10{}',
            [3] = '',
            [4] = '{C:inactive}\"Are those headlights? Can\'t you see\"{}',
            [5] = '{C:inactive}Originates from {}{C:common}DELTARUNE{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    set_ability = function(self, card, initial)
        card:add_sticker('perishable', true)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    chips = card.ability.extra.chips
                }
        end
        if context.remove_playing_cards  then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
    end
}