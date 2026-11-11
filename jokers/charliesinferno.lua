
SMODS.Joker{ --Charlies Inferno
    key = "charliesinferno",
    config = {
        extra = {
            excusemesir = 5
        }
    },
    loc_txt = {
        ['name'] = 'Charlies Inferno',
        ['text'] = {
            [1] = 'If played hand has not been {C:attention}leveled up{} or {C:attention}played{}',
            [2] = 'within the {C:attention}Blind{}, gain {C:red}2 {}Mult',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}',
            [4] = '{C:inactive,s:0.8}\"Screaming at the angels while they pushed him through the door!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.excusemesir}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (not (G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1) or (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) == to_big(1) then
                        return true
                    end
                end
                return false
            end)()) then
                card.ability.extra.excusemesir = (card.ability.extra.excusemesir) + 2
            elseif (G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 or (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(1) then
                        return true
                    end
                end
                return false
            end)()) then
                card.ability.extra.excusemesir = 1
            else
                return {
                    mult = card.ability.extra.excusemesir
                }
            end
        end
    end
}