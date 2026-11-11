
SMODS.Joker{ --Solitude
    key = "solitude",
    config = {
        extra = {
            face = 0
        }
    },
    loc_txt = {
        ['name'] = 'Solitude',
        ['text'] = {
            [1] = 'Give a single held in hand face card',
            [2] = 'a {C:attention}Blue{} Seal',
            [3] = 'If there is more than 1 {C:attention}face {}card',
            [4] = 'held in hand, {C:red}remove {}all modifiers',
            [5] = 'from {C:attention}held {}cards',
            [6] = '{C:inactive,s:0.8}\"Never have I seen anything quite like this...\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}Block Tales{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 34
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sin"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.face}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if (context.other_card:is_face() and to_big((card.ability.extra.face or 0)) == to_big(0)) then
                return {
                    func = function()
                        context.other_card:set_seal("Blue", true)
                    end,
                    message = "Card Modified!",
                    extra = {
                        func = function()
                            card.ability.extra.face = (card.ability.extra.face) + 1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            elseif (to_big((card.ability.extra.face or 0)) >= to_big(1) and context.other_card:is_face()) then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.c_base)
                        context.other_card:set_seal(nil)
                        context.other_card:set_edition(nil)
                    end,
                    message = "Card Modified!",
                    extra = {
                        func = function()
                            card.ability.extra.face = (card.ability.extra.face) + 1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.face = 0
                    return true
                end
            }
        end
    end
}