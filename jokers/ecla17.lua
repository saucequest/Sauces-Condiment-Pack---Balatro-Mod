
SMODS.Joker{ --ECLA_17
    key = "ecla17",
    config = {
        extra = {
            xmult0 = 5,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'ECLA_17',
        ['text'] = {
            [1] = 'When card scored, {X:mult,C:white}X5{} Mult and ask {C:attention}Inky {}to',
            [2] = 'play Pixel Perfect',
            [3] = '{C:green}#1# in #2#{} chance to {C:attention}instantly lose{} when card scored',
            [4] = '{C:inactive,s:0.8}\"the only things i do are sleep, eat, watch inky play pixel perfect, and work on pixel perfect\"{}',
            [5] = '{C:inactive,s:0.7}https://roblox.com/users/2325750615/profile{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 31
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_ecla17') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                return {
                    Xmult = 5,
                    message = "inky hop in vc"
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_cfee8df5', 1, card.ability.extra.odds, 'j_sauce_ecla17', false) then
                            SMODS.calculate_effect({func = function()
                                
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
                            end}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}