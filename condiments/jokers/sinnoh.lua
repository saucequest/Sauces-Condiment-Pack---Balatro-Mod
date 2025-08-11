SMODS.Joker{ --Sinnoh
    key = "sinnoh",
    config = {
        extra = {
            sinnohmult = 8.7
        }
    },
    loc_txt = {
        ['name'] = 'Sinnoh',
        ['text'] = {
            [1] = 'All scored Jacks, 8s, and 7s will add 0.4 to Sinnoh\'s Mult',
            [2] = 'Starts off with {C:dark_edition,s:5}^8.7{} Mult',
            [3] = '{C:inactive}(Currently{} {C:dark_edition}^#1#{} {C:inactive}Mult){}',
            [4] = '{C:inactive}\"WHO ARE YOU RUNNING FROM?\"{}',
            [5] = '{C:inactive}Originates from{} {C:tarot}Vs. OURPLE GUY{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 4
    },
    cost = 87,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 5,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.sinnohmult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.sinnohmult
                }
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 11 then
                card.ability.extra.sinnohmult = (card.ability.extra.sinnohmult) + 0.4
            elseif context.other_card:get_id() == 8 then
                card.ability.extra.sinnohmult = (card.ability.extra.sinnohmult) + 0.4
            elseif context.other_card:get_id() == 7 then
                card.ability.extra.sinnohmult = (card.ability.extra.sinnohmult) + 0.4
            end
        end
    end
}