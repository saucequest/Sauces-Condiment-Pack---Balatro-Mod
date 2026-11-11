
SMODS.Joker{ --10. Sinister
    key = "sinister",
    config = {
        extra = {
            sinisterator = 15,
            odds = 1
        }
    },
    loc_txt = {
        ['name'] = '10. Sinister',
        ['text'] = {
            [1] = 'If hand {C:attention}contains {}a Pair, {C:green}#2# in #1#{}',
            [2] = 'chance to {C:attention}instantly win{} the Blind when',
            [3] = 'hand is {C:attention}finished {}scoring',
            [4] = 'When chance {C:attention}fails{}, decrement',
            [5] = '{C:attention}denominator{} by 1',
            [6] = 'If denominator is 2, {C:attention}reset {}',
            [7] = 'denominator back to 15'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 36
    },
    display_size = {
        w = 71 * 2, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_sinister') 
        return {vars = {card.ability.extra.sinisterator, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if next(context.poker_hands["Pair"]) then
                if SMODS.pseudorandom_probability(card, 'group_0_3cc4b346', 1, card.ability.extra.odds, 'j_sauce_sinister', false) then
                    G.E_MANAGER:add_event(Event({
                        blocking = false,
                        func = function()
                            if G.STATE == G.STATES.SELECTING_HAND then
                                G.GAME.chips = G.GAME.blind.chips
                                G.STATE = G.STATES.HAND_PLAYED
                                G.STATE_COMPLETE = true
                                end_round()
                                return true
                            end
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Win!", colour = G.C.ORANGE})
                end
            elseif to_big((card.ability.extra.sinisterator or 0)) == to_big(2) then
                return {
                    func = function()
                        card.ability.extra.sinisterator = 15
                        return true
                    end
                }
            end
        end
        if context.pseudorandom_result  then
            if not context.result then
                return {
                    func = function()
                        card.ability.extra.sinisterator = math.max(0, (card.ability.extra.sinisterator) - 1)
                        return true
                    end
                }
            end
        end
    end
}