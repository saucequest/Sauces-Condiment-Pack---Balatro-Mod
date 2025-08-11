SMODS.Joker{ --Chatty Dee
    key = "chattydee",
    config = {
        extra = {
            xchips = 1.2,
            Xmult = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Chatty Dee',
        ['text'] = {
            [1] = '{X:mult,C:white}x1.2{} Mult and {X:chips,C:white}x1.2{} Chips',
            [2] = 'Creates a {C:dark_edition}Negative{} copy of itself whenever shop is rerolled.',
            [3] = '',
            [4] = '{C:inactive}\"What in tarnation is that?\"{}',
            [5] = '{C:inactive}Originates from{} {C:gold}Failboat{}',
            [6] = '',
            [7] = '{C:red}WARNING: May lag your game if you reroll often, as the copies get out of hand quickly.{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
        end
        if context.reroll_shop  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_chattydee' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Beam Attack!", colour = G.C.BLUE})
            end
            return true
        end
                }
        end
    end
}