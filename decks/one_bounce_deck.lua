
SMODS.Back {
    key = 'one_bounce_deck',
    pos = { x = 7, y = 0 },
    config = {
        extra = {
            ante_value0 = 4,
            voucher_slots0 = 1,
            booster_slots0 = 1,
            hand_size0 = 2,
            repetitions = 3
        },
    },
    loc_txt = {
        name = 'One Bounce Deck',
        text = {
            [1] = 'Begin  with {C:attention}One Bounce Survivor{}',
            [2] = '+2 Hand {C:attention}Size {}and Discards',
            [3] = '+1 {C:attention}Shop {}Slot',
            [4] = 'Begin with 3 {C:purple}Eternal {}{C:attention}Cursed {}Jokers',
            [5] = ''
        },
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        local mod = 4 - G.GAME.round_resets.ante
        G.E_MANAGER:add_event(Event({
            func = function()
                ease_ante(mod)
                G.GAME.round_resets.blind_ante = 4
                return true
            end,
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_onebouncesurvivor' })
                if new_joker then
                    new_joker:add_sticker('eternal', true)
                end
                return true
            end
        }))
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + 2
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_voucher_limit(1)
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        
                        SMODS.change_booster_limit(1)
                        return true
                    end
                })),
                colour = G.C.WHITE,
                extra = {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            
                            G.hand:change_size(2)
                            return true
                        end
                    })),
                    colour = G.C.WHITE
                }
            }
            ,
            func = function()
                for i = 1, 3 do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('timpani')
                            local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'sauce_cursed' })
                            if new_joker then
                                new_joker:add_sticker('eternal', true)
                            end
                            return true
                        end
                    }))
                    
                end
                return true
            end
        }
    end
}