SMODS.Joker{ --You Are An Idiot!
    key = "youareanidiot",
    config = {
        extra = {
            idiot = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'You Are An Idiot!',
        ['text'] = {
            [1] = 'Starts off with {X:red,C:white}x1.5{} Mult',
            [2] = 'Adds {X:mult,C:white}x0.2{} Mult whenever {C:red}2 or less{} cards are discarded',
            [3] = 'Subtracts {X:mult,C:white}x0.2{} Mult whenever a hand that is {C:red}not{}',
            [4] = '{C:red}High Card{} is scored{}',
            [5] = 'Adds {X:mult,C:white}x0.3{} Mult whenever a hand that is only{C:red}{}',
            [6] = '{C:red}High Card{} is scored{}',
            [7] = '{C:inactive}(Currently{} {X:mult,C:white}x#1#{} {C:inactive}Mult){}',
            [8] = '{C:inactive}\"You are an idiot! A-hahaha!\"{}',
            [9] = '{C:inactive}Originates from{} {C:dark_edition}You Are An Idiot{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 5,
        y = 5
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.idiot}}
    end,

    calculate = function(self, card, context)
        if context.pre_discard  then
            if #context.full_hand <= 2 then
                return {
                    func = function()
                    card.ability.extra.idiot = (card.ability.extra.idiot) + 0.2
                    return true
                end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "High Card" then
                card.ability.extra.idiot = (card.ability.extra.idiot) + 0.3
            elseif context.scoring_name ~= "High Card" then
                card.ability.extra.idiot = math.max(0, (card.ability.extra.idiot) - 0.2)
            else
                return {
                    Xmult = card.ability.extra.idiot
                }
            end
        end
    end
}