
SMODS.Back {
    key = 'kyle_deck',
    pos = { x = 0, y = 1 },
    config = {
        extra = {
            odds = 10
        },
    },
    loc_txt = {
        name = 'Kyle Deck',
        text = {
            [1] = 'WHO IS {C:attention}KYLE{}??????'
        },
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            if SMODS.pseudorandom_probability(card, 'group_0_3249b1f8', 1, card.ability.extra.odds, 'j_sauce_kyle_deck', false) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('timpani')
                        local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_kyle' })
                        if new_joker then
                            new_joker:add_sticker('eternal', true)
                        end
                        return true
                    end
                }))
                
            end
        end
    end,
    
}