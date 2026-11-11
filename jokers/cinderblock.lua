
SMODS.Joker{ --cinderblock
    key = "cinderblock",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'cinderblock',
        ['text'] = {
            [1] = 'If scored card is a {C:attention}Face {}Card, add a {C:attention}Stone{} card to Hand',
            [2] = '{C:inactive,s:0.8}\"Watson won\'t expect this one!\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_stone
                }, G.discard, true, false, nil, true)
                
                
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                base_card.playing_card = G.playing_card
                table.insert(G.playing_cards, base_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        G.hand:emplace(base_card)
                        base_card:start_materialize()
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_cinderblock")
                        
                        return true
                    end,
                }))
                return {
                    message = "Hey Watson, cinderblock!"
                }
            end
        end
    end
}