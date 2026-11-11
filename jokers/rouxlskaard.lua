
SMODS.Joker{ --Rouxls Kaard
    key = "rouxlskaard",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Rouxls Kaard',
        ['text'] = {
            [1] = 'Creates a {C:tarot}Rules Card{} when {C:attention}Blind {}is selected',
            [2] = '{C:inactive}(Requires room){}',
            [3] = '{C:inactive,s:0.8}\"Geh ha ha ha ha! Thoust FOOLS!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}DELTARUNE{}',
            [5] = '{C:dark_edition,s:0.8}Follower-suggested{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 21
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 0,
        y = 22
    },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Tarot', key = 'c_sauce_rulescard'})                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}