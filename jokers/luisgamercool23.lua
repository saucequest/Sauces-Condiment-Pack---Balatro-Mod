
SMODS.Joker{ --luisgamercool23
    key = "luisgamercool23",
    config = {
        extra = {
            luismult = 3
        }
    },
    loc_txt = {
        ['name'] = 'luisgamercool23',
        ['text'] = {
            [1] = '{C:attention}2s {}and {C:attention}3s {}give {X:mult,C:white}X#1#{} Mult',
            [2] = '{C:common}Common {}and {C:uncommon}Uncommon{} Jokers when {C:attention}evaluated{}',
            [3] = 'divide 2s and 3s {X:mult,C:white}XMult{} by {X:red,C:white}1.5{} then round it up',
            [4] = '{C:inactive,s:0.8}\"top 5 reasons why i hate noobs\"{}',
            [5] = '{C:inactive,s:0.8}Originates from {}{C:attention,s:0.8}Flamingo{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    soul_pos = {
        x = 7,
        y = 16
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.luismult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 3) then
                return {
                    Xmult = card.ability.extra.luismult
                }
            end
        end
        if context.other_joker  and not context.blueprint then
            if ((function()
                return context.other_joker.config.center.rarity == 1
            end)() or (function()
                return context.other_joker.config.center.rarity == 2
            end)()) then
                local luismult_value = card.ability.extra.luismult
                return {
                    func = function()
                        card.ability.extra.luismult = (card.ability.extra.luismult) / 1.5
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.luismult = math.ceil(card.ability.extra.luismult)
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end
}