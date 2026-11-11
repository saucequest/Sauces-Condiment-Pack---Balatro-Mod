
SMODS.Joker{ --Contradictions
    key = "contradictions",
    config = {
        extra = {
            handsneeded = 3,
            pluschips = 50
        }
    },
    loc_txt = {
        ['name'] = 'Contradictions',
        ['text'] = {
            [1] = '{C:blue}+#2#{} Chips every 3 hands',
            [2] = 'Randomly sets {C:blue}+Chips{} from {C:attention}30-150{} when scored',
            [3] = '{C:inactive,s:0.8}\"Violently gamble every expectation\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 6
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
    pools = { ["sauce_vocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.handsneeded, card.ability.extra.pluschips}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.handsneeded = math.max(0, (card.ability.extra.handsneeded) - 1)
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.handsneeded or 0)) == to_big(0) then
                card.ability.extra.handsneeded = 3
                card.ability.extra.pluschips = pseudorandom('RANGE:30|150', 30, 150)
                return {
                    chips = card.ability.extra.pluschips_value
                }
            end
        end
    end
}