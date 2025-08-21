SMODS.Joker{ --2011X
    key = "2011x",
    config = {
        extra = {
            sonicexemult = 1,
            timer = 6,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = '2011X',
        ['text'] = {
            [1] = 'Starts out with {X:red,C:white}X1{} Mult',
            [2] = 'Discarded cards each add {C:red}0.1{} Mult to 2011X\'s {X:mult,C:white}XMult{}',
            [3] = 'When 6 blinds have been defeated with 2011X, destroys self',
            [4] = 'and turns into Lord X',
            [5] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}',
            [6] = '{C:inactive}\"THINKING OUTSIDE THE BOX, ARE WE?\"{}',
            [7] = '{C:inactive}Originates from{} {C:hearts}SONIC 2011{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 11,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 0
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.sonicexemult}}
    end,

    calculate = function(self, card, context)
        if context.discard  then
                return {
                    func = function()
                    card.ability.extra.sonicexemult = (card.ability.extra.sonicexemult) + 0.2
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.sonicexemult
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (card.ability.extra.timer or 0) == 0 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!",
                    extra = {
                        func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_lordx' })
                    if joker_card then
                        
                        
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
            else
                return {
                    func = function()
                    card.ability.extra.timer = (card.ability.extra.timer) + 1
                    return true
                end
                }
            end
        end
    end
}