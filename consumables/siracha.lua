
SMODS.Consumable {
    key = 'siracha',
    set = 'condiment',
    pos = { x = 7, y = 1 },
    loc_txt = {
        name = 'Siracha',
        text = {
            [1] = 'Adds 2 {C:attention}Burning {}cards and 1 {C:attention}Scorched {}card'
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
                for i = 1, 2 do
                    local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                    local _suit = nil
                    local enhancement = G.P_CENTERS['m_sauce_burning']
                    local new_card_params = { set = "Base" }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                    local _suit = nil
                    local new_card_params = { set = "Base" }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                    if cards[i] then
                        cards[i]:set_edition('e_scorched', true)
                    end
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