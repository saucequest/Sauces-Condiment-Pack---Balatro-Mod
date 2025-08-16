SMODS.Joker{ --El Pendrive Azul
    key = "elpendriveazul",
    config = {
        extra = {
            pendrivecountdown = 5,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'El Pendrive Azul',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult and {X:blue,C:white}X#1#{} Chips',
            [2] = 'Destroys itself and a random Joker in {C:red}#1#{} rounds.',
            [3] = '{C:inactive}\"¡No puedo! ¡NO PUEDO PERDER!\"{}',
            [4] = '{C:inactive}Originates from{} {C:enhanced}El Pendrive Azul{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 1
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.pendrivecountdown}}
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
            if (card.ability.extra.pendrivecountdown or 0) == 0 then
                return {
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
                    extra = {
                        func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Destroyed!",
                        colour = G.C.RED
                        }
                }
            end
        end
        if context.setting_blind  then
                return {
                    func = function()
                    card.ability.extra.pendrivecountdown = math.max(0, (card.ability.extra.pendrivecountdown) - 1)
                    return true
                end
                }
        end
    end
}