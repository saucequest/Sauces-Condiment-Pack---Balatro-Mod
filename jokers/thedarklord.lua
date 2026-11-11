
SMODS.Joker{ --The Dark Lord
    key = "thedarklord",
    config = {
        extra = {
            pb_x_mult_982cf1ce = 2.5,
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'The Dark Lord',
        ['text'] = {
            [1] = 'Played {C:red}Red Suits{} gain a permanent {X:mult,C:white}X2.5{} Mult',
            [2] = 'Played Black Suits give {X:mult,C:white}X0{} Mult and get destroyed',
            [3] = '{C:inactive,s:0.8}“mission.The_Dark_Lord = destroy(The_Chosen_One);”{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {s:0.8}Animator {}{C:red,s:0.8}VS {}{C:attention,s:0.8}Animation{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 25
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 6,
        y = 25
    },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + 2.5
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            elseif context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                context.other_card.should_destroy = true
                return {
                    Xmult = 1.5,
                    extra = {
                        message = "mission.The_Dark_Lord = destroy(The_Chosen_One);",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}