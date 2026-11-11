
SMODS.Consumable {
    key = 'ctrlcandctrlv',
    set = 'keyboard_shortcut',
    pos = { x = 4, y = 2 },
    config = { 
        extra = {
            copy_amount = 1   
        } 
    },
    loc_txt = {
        name = 'CTRL + C and CTRL + V',
        text = {
            [1] = 'Makes a {C:blue}Perishable {}copy of a {C:attention}selected {}Joker'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.jokers.highlighted > 0 then
            local _first_materialize = nil
            for i = 1, #G.jokers.highlighted do
                local self_card = G.jokers.highlighted[i]
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    play_sound('timpani')
                    local copied_joker = copy_card(self_card, set_edition, nil, nil, false)
                    copied_joker:start_materialize(nil, _first_materialize)
                    self_card:add_to_deck()
                    G.jokers:emplace(copied_joker)
                    _first_materialize = true
                    copied_joker:set_edition('e_sauce_perishable', true)
                    return true
                end
            }))
        end        
        delay(0.6)
    end
end,
can_use = function(self, card)
    return (#G.jokers.highlighted > 0)
end
}