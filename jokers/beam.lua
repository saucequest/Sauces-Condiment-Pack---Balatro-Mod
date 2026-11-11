
SMODS.Joker{ --Beam
    key = "beam",
    config = {
        extra = {
            hand_size0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Beam',
        ['text'] = {
            [1] = 'If hand played contains {C:attention}Drenched {}cards,',
            [2] = '+1 {C:attention}playsize{}',
            [3] = '{C:inactive,s:0.8}\"That\'s my Lord Chainsaw!! He\'s the badass-est!!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:attention,s:0.8}Chainsaw{} {s:0.8}Man{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 52
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                    
                    G.hand:change_size(1)
                    return true
                end
            }
        end
    end
}