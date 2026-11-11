
SMODS.Joker{ --Springer
    key = "springer",
    config = {
        extra = {
            nullscapingit = 0
        }
    },
    loc_txt = {
        ['name'] = 'Springer',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} selected or hand {C:attention}finishes{} scoring,',
            [2] = 'choose a {C:attention}position{} between 1-5',
            [3] = 'The {C:attention}scoring{} card with',
            [4] = 'that {C:attention}position{} will be {C:red}destroyed{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}NU{}{C:tarot,s:0.8}LL{}{C:dark_edition,s:0.8}SC{}{C:red,s:0.8}APE{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 37
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = "sauce_cursed",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_gracescape"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.nullscapingit}}
    end,
    
    calculate = function(self, card, context)
        if context.hand_drawn  then
            return {
                func = function()
                    card.ability.extra.nullscapingit = pseudorandom('RANGE:1|5', 1, 5)
                    return true
                end
            }
        end
        if context.setting_blind  then
            return {
                func = function()
                    card.ability.extra.nullscapingit = pseudorandom('RANGE:1|5', 1, 5)
                    return true
                end
            }
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card == context.scoring_hand[card.ability.extra.nullscapingit] then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
}