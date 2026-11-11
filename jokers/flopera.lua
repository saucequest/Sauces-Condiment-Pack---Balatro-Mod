
SMODS.Joker{ --Flop Era
    key = "flopera",
    config = {
        extra = {
            dollars0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Flop Era',
        ['text'] = {
            [1] = 'Scored cards give {C:money}$2{}',
            [2] = 'If a {C:attention}Face Card{} is not in played hand, instantly {C:red}lose{}',
            [3] = '{C:inactive,s:0.8}\"Don\'t you dare look away - when I could be your IDOL!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_vocaloid"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 2
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (not ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) or not ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") then
                        count = count + 1
                    end
                end
                return count == 1
            end)())) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            end
        end
    end
}