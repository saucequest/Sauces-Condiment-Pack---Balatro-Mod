
SMODS.Joker{ --He Isnt Laughing?? 
    key = "heisntlaughing",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'He Isnt Laughing?? ',
        ['text'] = {
            [1] = 'If hand is {C:red}not{} {C:attention}50%{} of the Blind',
            [2] = '{C:attention}requirement{} or higher, instantly {C:red}lose{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 30
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if to_big(G.GAME.chips / G.GAME.blind.chips) < to_big(0.5) then
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