
SMODS.Consumable {
    key = 'theemperoramyedition',
    set = 'Tarot',
    pos = { x = 4, y = 4 },
    config = { 
        extra = {
            discards0 = 0.5,
            blind_size0 = 0.85   
        } 
    },
    loc_txt = {
        name = 'The Emperor (Amy Edition)',
        text = {
            [1] = '{C:attention}+0.5{} Discards and x0.85 Blind {C:attention}Requirement{}'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(0.5).." Discards", colour = G.C.GREEN})
                
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + 0.5
                ease_discard(0.5)
                
                return true
            end
        }))
        delay(0.6)
        return {
            
            func = function()
                if G.GAME.blind.in_blind then
                    
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "X"..tostring(0.85).." Blind Size", colour = G.C.GREEN})
                    G.GAME.blind.chips = G.GAME.blind.chips * 0.85
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    G.HUD_blind:recalculate()
                    return true
                end
            end
        }
    end,
    can_use = function(self, card)
        return true
    end
}