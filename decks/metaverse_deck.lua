
SMODS.Back {
    key = 'metaverse_deck',
    pos = { x = 9, y = 0 },
    config = {
        extra = {
            shop_slots0 = 1
        },
    },
    loc_txt = {
        name = 'Metaverse Deck',
        text = {
            [1] = 'Begin with a {C:purple}Eternal {} {C:dark_edition}Negative {}{C:attention}Roblox {}Joker',
            [2] = '+1 {C:attention}Shop {}Slot'
        },
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'sauce_roblox' })
                    if new_joker then
                        new_joker:set_edition("e_negative", true)
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    change_shop_size(1)
                    return true
                end
            }))
        }
    end
}