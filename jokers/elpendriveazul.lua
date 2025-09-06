SMODS.Joker{ --El Pendrive Azul
    key = "elpendriveazul",
    config = {
        extra = {
            pendrivecountdown = 2,
            countdownforrealthistime = 5,
            var1 = 0,
            no = 0
        }
    },
    loc_txt = {
        ['name'] = 'El Pendrive Azul',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult and {X:blue,C:white}X#1#{} Chips',
            [2] = 'Destroys itself and a random Joker in {C:red}#2#{} rounds.',
            [3] = '{C:inactive}\"¡No puedo! ¡NO PUEDO PERDER!\"{}',
            [4] = '{C:inactive}Originates from{} {C:enhanced}El Pendrive Azul{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.pendrivecountdown, card.ability.extra.countdownforrealthistime}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.pendrivecountdown,
                    extra = {
                        Xmult = card.ability.extra.pendrivecountdown
                        }
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (card.ability.extra.countdownforrealthistime or 0) == 5 then
                return {
                    message = "Cinco.",
                    extra = {
                        func = function()
                    card.ability.extra.pendrivecountdown = math.max(0, (card.ability.extra.pendrivecountdown) - 0.2)
                    return true
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.countdownforrealthistime = math.max(0, (card.ability.extra.countdownforrealthistime) - 1)
                    return true
                end,
                            colour = G.C.RED
                        }
                        }
                }
            elseif (card.ability.extra.countdownforrealthistime or 0) == 4 then
                return {
                    message = "Quatro.",
                    extra = {
                        func = function()
                    card.ability.extra.pendrivecountdown = math.max(0, (card.ability.extra.pendrivecountdown) - 0.2)
                    return true
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.countdownforrealthistime = math.max(0, (card.ability.extra.countdownforrealthistime) - 1)
                    return true
                end,
                            colour = G.C.RED
                        }
                        }
                }
            elseif (card.ability.extra.countdownforrealthistime or 0) == 3 then
                return {
                    message = "Tres.",
                    extra = {
                        func = function()
                    card.ability.extra.pendrivecountdown = math.max(0, (card.ability.extra.pendrivecountdown) - 0.2)
                    return true
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.countdownforrealthistime = math.max(0, (card.ability.extra.countdownforrealthistime) - 1)
                    return true
                end,
                            colour = G.C.RED
                        }
                        }
                }
            elseif (card.ability.extra.countdownforrealthistime or 0) == 2 then
                return {
                    message = "Dos.",
                    extra = {
                        func = function()
                    card.ability.extra.pendrivecountdown = math.max(0, (card.ability.extra.pendrivecountdown) - 0.2)
                    return true
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.countdownforrealthistime = math.max(0, (card.ability.extra.countdownforrealthistime) - 1)
                    return true
                end,
                            colour = G.C.RED
                        }
                        }
                }
            elseif (card.ability.extra.countdownforrealthistime or 0) == 1 then
                return {
                    message = "Uno",
                    extra = {
                        func = function()
                    card.ability.extra.pendrivecountdown = math.max(0, (card.ability.extra.pendrivecountdown) - 0.2)
                    return true
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.countdownforrealthistime = math.max(0, (card.ability.extra.countdownforrealthistime) - 1)
                    return true
                end,
                            colour = G.C.RED
                        }
                        }
                }
            elseif (card.ability.extra.countdownforrealthistime or 0) == 0 then
                return {
                    message = "Cerro.",
                    extra = {
                        func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Destroyed!",
                        colour = G.C.RED,
                        extra = {
                            func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                    return true
                end,
                            colour = G.C.RED
                        }
                        }
                }
            end
        end
    end
}