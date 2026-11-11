
SMODS.Joker{ --Noli
    key = "noli",
    config = {
        extra = {
            xchips0 = 2.01,
            odds = 3,
            xmult0 = 0.8
        }
    },
    loc_txt = {
        ['name'] = 'Noli',
        ['text'] = {
            [1] = '{X:chips,C:white}x2.010{} Chips',
            [2] = '{C:green}#1# in #2#{} chance for {X:red,C:white}X0.8{} Mult',
            [3] = '{C:attention}Does nothing else...?{}',
            [4] = '{C:inactive,s:0.8}\"This thing of darkness I acknowledge mine.\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:spades,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_noli') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_nolicreate")
                        
                        return true
                    end,
                }))
                return {
                    x_chips = 2.01
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_e103e172', 1, card.ability.extra.odds, 'j_sauce_noli', false) then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    play_sound("sauce_hallucination")
                                    
                                    return true
                                end,
                            }))
                            local created_joker = false
                            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                created_joker = true
                                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_hallucination' })
                                        if joker_card then
                                            
                                            
                                        end
                                        G.GAME.joker_buffer = 0
                                        return true
                                    end
                                }))
                            end
                            SMODS.calculate_effect({Xmult = 0.8}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                        end
                        return true
                    end
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_nolibuy")
                    
                    return true
                end,
            }))
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_nolisell")
                    
                    return true
                end,
            }))
        end
    end
}