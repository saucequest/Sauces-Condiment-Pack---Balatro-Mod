
SMODS.Back {
    key = '_cigarettes_deck',
    pos = { x = 1, y = 1 },
    config = {
        extra = {
            repetitions = 25
        },
    },
    loc_txt = {
        name = '500 Cigarettes Deck',
        text = {
            [1] = '{C:attention,s:2}500 Stoned Jokers.{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        for i = 1, 25 do
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_stoned' })
                    if new_joker then
                        new_joker:set_edition("e_negative", true)
                    end
                    return true
                end
            }))
            
        end
        for i = 1, 25 do
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_reallystoned' })
                    if new_joker then
                        new_joker:set_edition("e_negative", true)
                    end
                    return true
                end
            }))
            
        end
    end
}