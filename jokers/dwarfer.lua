
SMODS.Joker{ --dwarfer
    key = "dwarfer",
    config = {
        extra = {
            discards0 = 2,
            hands0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'dwarfer',
        ['text'] = {
            [1] = 'When sold, subtract {C:red}-1{} Hand and',
            [2] = 'add {C:attention}+2{} {C:attention}Discards{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 42
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Discards", colour = G.C.GREEN})
                    
                    G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
                    ease_discard(2)
                    
                    return true
                end,
                extra = {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hands", colour = G.C.RED})
                        
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
                        ease_hands_played(-1)
                        
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
    end
}