
SMODS.Consumable {
    key = 'ctrlf',
    set = 'keyboard_shortcut',
    pos = { x = 8, y = 3 },
    config = { 
        extra = {
            currenthandsize = 0   
        } 
    },
    loc_txt = {
        name = 'Ctrl + F',
        text = {
            [1] = 'Create {C:attention}cards {}equal to your',
            [2] = 'current{C:attention} hand size{}'
        }
    },
    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, (G.hand and G.hand.config.card_limit or 0) do
                    local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                    local _suit = nil
                    local new_card_params = { set = "Base" }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return true
    end
}