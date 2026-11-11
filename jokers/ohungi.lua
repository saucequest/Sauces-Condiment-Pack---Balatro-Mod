
SMODS.Joker{ --Ohungi
    key = "ohungi",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Ohungi',
        ['text'] = {
            [1] = 'When card scored, randomly {C:attention}flip {}and {C:attention}shuffle {}Jokers',
            [2] = '{C:inactive,s:0.8}\"RAHHAHAHA then lets go on a nice walk tweet tweet!\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {X:green,C:black,s:0.8}DIMENSIONAL{} {X:green,C:black,s:0.8}DEEP-END{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 0,
        y = 19
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                for i = 1, card.ability.extra.repetitions do
                    if #G.jokers.cards > 0 then
                        local available_jokers = {}
                        for i, joker in ipairs(G.jokers.cards) do
                            table.insert(available_jokers, joker)
                        end
                        pseudorandom_element(available_jokers, pseudoseed('flip_joker')):flip()
                    end
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Flip!", colour = G.C.ORANGE})
                end
                for i = 1, card.ability.extra.repetitions do
                    if #G.jokers.cards > 1 then
                        G.jokers:unhighlight_all()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 0.85)
                                        return true
                                    end,
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1.15)
                                        return true
                                    end
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1)
                                        return true
                                    end
                                }))
                                delay(0.5)
                                return true
                            end
                        }))
                    end
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shuffle!", colour = G.C.ORANGE})
                end
            end
        end
    end
}