
SMODS.Consumable {
    key = 'ctrl',
    set = 'keyboard_shortcut',
    pos = { x = 0, y = 3 },
    config = { 
        extra = {
            repetitions = 5   
        } 
    },
    loc_txt = {
        name = 'Ctrl + +',
        text = {
            [1] = 'Create 5 random {C:attention}Tags{}'
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
        for i = 1, 5 do
            SMODS.calculate_effect({func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                        local tag = Tag(selected_tag)
                        if tag.name == "Orbital Tag" then
                            local _poker_hands = {}
                            for k, v in pairs(G.GAME.hands) do
                                if v.visible then
                                    _poker_hands[#_poker_hands + 1] = k
                                end
                            end
                            tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                        end
                        tag:set_ability()
                        add_tag(tag)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                }))
                return true
            end}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Created Tag!", colour = G.C.GREEN})
        end
    end,
    can_use = function(self, card)
        return true
    end
}