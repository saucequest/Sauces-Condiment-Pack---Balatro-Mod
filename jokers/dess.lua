
SMODS.Joker{ --Dess
    key = "dess",
    config = {
        extra = {
            chips0 = 25,
            dollars0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Dess',
        ['text'] = {
            [1] = '{C:blue}+25{} Chips when card scored',
            [2] = 'When a card is {C:attention}destroyed{}, gives {C:money}$3{}',
            [3] = '',
            [4] = '{C:inactive,s:0.8}\"Are those headlights? Can\'t you see\"{}',
            [5] = '{C:inactive,s:0.8}Originates from {}{C:common,s:0.8}DELTARUNE{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    set_ability = function(self, card, initial)
        card:add_sticker('perishable', true)
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                chips = 25
            }
        end
        if context.remove_playing_cards  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 3
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}