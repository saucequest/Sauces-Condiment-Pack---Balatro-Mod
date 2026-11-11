
SMODS.Joker{ --Jacker
    key = "jacker",
    config = {
        extra = {
            immultingit = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jacker',
        ['text'] = {
            [1] = 'Scored {C:attention}Jacks {}add {X:red,C:white}X0.2{} Mult to this Joker',
            [2] = 'Give saved up {C:red}Mult{} when a {C:attention}Queen {}is scored',
            [3] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 49
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.immultingit}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 11 then
                card.ability.extra.immultingit = (card.ability.extra.immultingit) + 0.2
            elseif context.other_card:get_id() == 12 then
                return {
                    Xmult = card.ability.extra.immultingit
                }
            end
        end
    end
}