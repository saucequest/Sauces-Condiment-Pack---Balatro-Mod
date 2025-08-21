SMODS.Joker{ --Lord X
    key = "lordx",
    config = {
        extra = {
            lordsmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Lord X',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult when Kings are scored',
            [2] = 'Every round defeated, increase XMult by {X:red,C:white}X0.1{}',
            [3] = '{C:inactive}\"Every death is orchestrated for YOUR amusement.\"{}',
            [4] = '{C:inactive}Originates from {}{C:red}SONIC PC PORT{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 5
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.lordsmult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 13 then
                return {
                    Xmult = card.ability.extra.lordsmult
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    card.ability.extra.lordsmult = (card.ability.extra.lordsmult) + 0.1
                    return true
                end
                }
        end
    end
}