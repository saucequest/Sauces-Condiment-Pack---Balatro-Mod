SMODS.Joker{ --2011X
    key = "2011x",
    config = {
        extra = {
            ragemeter = 0,
            raging = 0,
            ragetimer = 8,
            lordxtrue = 0,
            Xmult = 3,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = '2011X',
        ['text'] = {
            [1] = 'Whenever a card is destroyed, add 5 to Rage Meter',
            [2] = 'When Rage Meter is at 100, reset Rage Meter and give {X:red,C:white}X3{} Mult for',
            [3] = 'the next 8 hands',
            [4] = 'If Rage Meter has already been activated at least once in the run',
            [5] = 'and 2011X is sold, give Lord X',
            [6] = '{C:inactive}(RAGE METER: {C:red}#1#{}{C:inactive}){}',
            [7] = '{C:inactive}\"THINKING OUTSIDE THE BOX, ARE WE?\"{}',
            [8] = '{C:inactive}Originates from{} {C:hearts}SONIC 2011{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 11,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 0
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ragemeter}}
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards  then
                return {
                    func = function()
                    card.ability.extra.ragemeter = (card.ability.extra.ragemeter) + 5
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.ragemeter or 0) == 100 then
                card.ability.extra.raging = 1
                card.ability.extra.ragemeter = 0
            elseif (card.ability.extra.raging or 0) == 1 then
                card.ability.extra.ragetimer = math.max(0, (card.ability.extra.ragetimer) - 1)
                card.ability.extra.lordxtrue = 1
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif (card.ability.extra.ragetimer or 0) == 0 then
                card.ability.extra.raging = 0
                card.ability.extra.ragetimer = 8
            end
        end
        if context.selling_self  then
            if (card.ability.extra.lordxtrue or 0) == 1 then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_lordx' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
            end
        end
    end
}