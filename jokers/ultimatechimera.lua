
SMODS.Joker{ --Ultimate Chimera
    key = "ultimatechimera",
    config = {
        extra = {
            impendingdeath = 0,
            xchips0 = 0.5,
            xmult0 = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Ultimate Chimera',
        ['text'] = {
            [1] = '{X:red,C:white}X0.5{} Mult and {X:chips,C:white}x0.5{} Chips',
            [2] = 'Kills you in 5 rounds if you {C:attention}haven\'t{} died',
            [3] = 'by then',
            [4] = '{C:inactive,s:0.8}\"IT\'S MEAL TIME!\"{}',
            [5] = '{C:inactive,s:0.8}Originates from {}{C:rare,s:0.8}Sonic Originals{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 26
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 99,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.impendingdeath}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = 0.5,
                extra = {
                    Xmult = 0.5
                }
            }
        end
        if context.setting_blind  then
            if to_big((card.ability.extra.impendingdeath or 0)) == to_big(5) then
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