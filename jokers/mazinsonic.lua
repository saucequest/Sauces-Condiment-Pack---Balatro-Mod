
SMODS.Joker{ --Mazin Sonic
    key = "mazinsonic",
    config = {
        extra = {
            infinitefun = 0,
            initialscoringchips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Mazin Sonic',
        ['text'] = {
            [1] = 'Adds the {C:attention}base Chips{} of hand played',
            [2] = 'into Mazin\'s {C:blue}+Chips{}',
            [3] = '{C:attention}Resets{} when a {C:attention}Boss{} is defeated',
            [4] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}',
            [5] = '{C:inactive,s:0.8}\"Fun is infinite!\"{}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 39
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
    pools = { ["sauce_sonic"] = true, ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.infinitefun, (G.GAME.current_round.current_hand.chips or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.infinitefun = (card.ability.extra.infinitefun) + G.GAME.current_round.current_hand.chips
            return {
                chips = card.ability.extra.infinitefun
            }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.infinitefun = 0
                    return true
                end
            }
        end
    end
}