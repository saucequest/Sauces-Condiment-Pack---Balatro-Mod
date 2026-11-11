
SMODS.Seal {
    key = 'greenseal',
    pos = { x = 4, y = 0 },
    badge_colour = HEX('32CD32'),
    loc_txt = {
        name = 'Green Seal',
        label = 'Green Seal',
        text = {
            [1] = 'Create a {C:attention}Keyboard Shortcut{} if played',
            [2] = 'in {C:attention}first {}hand of {C:attention}round{}',
            [3] = '{C:inactive}(Requires room){}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    sound = { sound = "chips1", per = 1.2, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 then
            return {
                
                func = function()
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'keyboard_shortcut', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}