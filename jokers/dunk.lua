
SMODS.Joker{ --dunk
    key = "dunk",
    config = {
        extra = {
            wannaseemedunk = 0
        }
    },
    loc_txt = {
        ['name'] = 'dunk',
        ['text'] = {
            [1] = 'Give the amount of {C:attention}cards scored{}',
            [2] = 'as {C:red}+Mult{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 41
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.wannaseemedunk}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            card.ability.extra.wannaseemedunk = (card.ability.extra.wannaseemedunk) + 1
        end
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.wannaseemedunk = 0
            return {
                mult = card.ability.extra.wannaseemedunk_value
            }
        end
    end
}