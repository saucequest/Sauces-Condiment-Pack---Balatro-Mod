
SMODS.Joker{ --8. Scars
    key = "scars",
    config = {
        extra = {
            scarringmult = 0
        }
    },
    loc_txt = {
        ['name'] = '8. Scars',
        ['text'] = {
            [1] = 'Scored {C:attention}face {}cards give this',
            [2] = 'Joker {C:red}+2{} Mult',
            [3] = '{C:attention}Discarding {}face cards subtracts',
            [4] = '{C:red}-2{} Mult from this Joker',
            [5] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 36
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.scarringmult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:is_face() then
                card.ability.extra.scarringmult = (card.ability.extra.scarringmult) + 2
            end
        end
        if context.discard  and not context.blueprint then
            if context.other_card:is_face() then
                return {
                    func = function()
                        card.ability.extra.scarringmult = math.max(0, (card.ability.extra.scarringmult) - 2)
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.scarringmult
            }
        end
    end
}