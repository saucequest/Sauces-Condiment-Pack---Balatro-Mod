SMODS.Joker{ --Noli?
    key = "nolihallucination",
    config = {
        extra = {
            chips = 201,
            mult = 0.8
        }
    },
    loc_txt = {
        ['name'] = 'Noli?',
        ['text'] = {
            [1] = '{C:blue}+201.0{} Chips',
            [2] = '{C:red}+0.8{} Mult',
            [3] = '',
            [4] = '',
            [5] = '{C:inactive}\"This thing of darkness I acknowledge mine.\"{}',
            [6] = '{C:inactive}Originates from{} {C:spades}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    cost = 0,
    rarity = "sauce_hallucination",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    set_ability = function(self, card, initial)
        card:add_sticker('perishable', true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
        end
    end
}