
SMODS.Consumable {
    key = 'themoonamyedition',
    set = 'Tarot',
    pos = { x = 5, y = 4 },
    config = { 
        extra = {
            discards0_min = NaN,
            discards0_max = 1.5,
            blind_size0_min = NaN,
            blind_size0_max = 1.15   
        } 
    },
    loc_txt = {
        name = 'The Moon (Amy Edition)',
        text = {
            [1] = 'All Jokers are flipped, gain {C:attention}+1.5{} Discards',
            [2] = 'to {C:red}-1.5{} Discards and {C:attention}x0.85{} Blind requirement',
            [3] = 'to {C:attention}x1.15{} Blind requirement'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.jokers.cards > 0 then
            for _, joker in ipairs(G.jokers.cards) do
                joker:flip()
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:-1.5|1.5', -1.5, 1.5)).." Discards", colour = G.C.GREEN})
                
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + pseudorandom('RANGE:-1.5|1.5', -1.5, 1.5)
                ease_discard(pseudorandom('RANGE:-1.5|1.5', -1.5, 1.5))
                
                return true
            end
        }))
        delay(0.6)
        return {
            message = "Flip!",
            extra = {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "X"..tostring(pseudorandom('RANGE:0.85|1.15', 0.85, 1.15)).." Blind Size", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips * pseudorandom('RANGE:0.85|1.15', 0.85, 1.15)
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end,
                colour = G.C.GREEN
            }
        }
    end,
    can_use = function(self, card)
        return true
    end
}