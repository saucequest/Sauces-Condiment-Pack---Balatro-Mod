
SMODS.Joker{ --vampire knives
    key = "vampireknives",
    config = {
        extra = {
            pb_x_mult_76dacef8_min = NaN,
            pb_x_mult_76dacef8_max = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'vampire knives',
        ['text'] = {
            [1] = 'Scored {C:red}Red Suits{} gain a permanent',
            [2] = '{X:mult,C:white}x1.05-1.1{} Mult',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 40
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + pseudorandom('RANGE:1.05|1.1', 1.05, 1.1)
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            end
        end
    end
}