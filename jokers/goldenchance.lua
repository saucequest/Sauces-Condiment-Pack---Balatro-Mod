SMODS.Joker{ --Golden Chance
    key = "goldenchance",
    config = {
        extra = {
            Xmult = 2.5,
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'Golden Chance',
        ['text'] = {
            [1] = 'If you have over {C:money}$50{}, give {X:mult,C:white}X2.5{} Mult',
            [2] = 'When {C:attention}Gold{} Cards scored, give {C:money}$3{}',
            [3] = '{C:inactive}\"Imbued with an ancient power\"{}',
            [4] = '{C:inactive}Originates from{} {C:red}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.dollars >= to_big(50) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}