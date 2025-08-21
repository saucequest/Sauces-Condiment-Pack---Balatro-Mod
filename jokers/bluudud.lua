SMODS.Joker{ --bluudud
    key = "bluudud",
    config = {
        extra = {
            chips = 50
        }
    },
    loc_txt = {
        ['name'] = 'bluudud',
        ['text'] = {
            [1] = '{C:clubs}Clubs{} give {C:blue}+50{} Chips',
            [2] = 'Jacks played will be turned into Clubs',
            [3] = '{C:inactive}\"Wanna hear my catchphrase? Oh, nevermind, I forgot.\"{}',
            [4] = '{C:inactive}Originates from {}{C:red}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then
                return {
                    chips = card.ability.extra.chips
                }
            elseif context.other_card:get_id() == 11 then
                assert(SMODS.change_base(context.other_card, "Clubs", nil))
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}