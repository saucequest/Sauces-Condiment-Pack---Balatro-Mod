
SMODS.Joker{ --Moto Bug
    key = "motobug",
    config = {
        extra = {
            chips0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Moto Bug',
        ['text'] = {
            [1] = 'Cards {C:attention}scored {}each give {C:blue}+20{} Chips',
            [2] = '{C:inactive,s:0.8}Originates from{} {C:spectral,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 17
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sonic"] = true },
    soul_pos = {
        x = 8,
        y = 17
    },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                chips = 20
            }
        end
    end
}