SMODS.Joker{ --Ultimate Chimera
    name = "Ultimate Chimera",
    key = "ultimatechimera",
    config = {
        extra = {
            impendingdeath = 0,
            xchips = 0.5,
            Xmult = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Ultimate Chimera',
        ['text'] = {
            [1] = '{X:red,C:white}X0.5{} Mult and {X:chips,C:white}x0.5{} Chips',
            [2] = 'Kills you in 3 rounds if you haven\'t died',
            [3] = 'by then',
            [4] = '{C:inactive}\"IT\'S MEAL TIME!\"{}',
            [5] = '{C:inactive}Originates from {}{C:rare}Sonic Originals{}'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    cost = 99,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
        end
        if context.setting_blind and not context.blueprint then
            if (card.ability.extra.impendingdeath or 0) == 3 then
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
            else
                return {
                    func = function()
                    card.ability.extra.impendingdeath = (card.ability.extra.impendingdeath) + 1
                    return true
                end
                }
            end
        end
    end
}