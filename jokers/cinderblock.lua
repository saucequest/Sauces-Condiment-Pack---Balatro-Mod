SMODS.Joker{ --Cinderblock
    key = "cinderblock",
    config = {
        extra = {
            cinderblock = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cinderblock',
        ['text'] = {
            [1] = 'If scored card is a Face Card, add a {C:attention}Stone{} card to Hand',
            [2] = '{C:inactive}\"Watson won\'t expect this one!\"{}',
            [3] = '{C:inactive}Originates from{} {C:money}Item {}{C:hearts}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_stone
                }, G.discard, true, false, nil, true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                        return true
                    end
                }))
                play_sound("sauce_cinderblock")
                return {
                    message = "Hey Watson, cinderblock!"
                }
            end
        end
    end
}