SMODS.Joker{ --Father
    key = "father",
    config = {
        extra = {
            scale = 50,
            rotation = 1,
            onetime = 0
        }
    },
    loc_txt = {
        ['name'] = 'Father',
        ['text'] = {
            [1] = 'Creates a {C:attention}Red{} Seal card whenever a card is destroyed',
            [2] = 'Adds a {C:dark_edition}Negative {}{C:attention}Red{} Seal {C:attention}Glass{} Card when a card is bought (including itself)',
            [3] = 'When the first hand is drawn, adds 2 {C:dark_edition}Negative {}consumables',
            [4] = '{C:inactive}\"do,,n,,t yo,u w,,a, nt to pla,,,y, w,ith,, yo,,u,r fri,,end,,s j,,ac,ob,?\"{}',
            [5] = '{C:inactive}Originates from{} {C:hearts}CDarchives{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    cost = 35,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 1
    },

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                return {
                    func = function()
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_glass
                }, G.discard, true, false, nil, true)
            new_card:set_seal("Red", true)
            new_card:set_edition("e_negative", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                        return true
                    end
                }))
            end,
                    message = "PEE,KA,BOO,,!"
                }
        end
        if context.buying_card  then
                return {
                    func = function()
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_glass
                }, G.discard, true, false, nil, true)
            new_card:set_seal("Red", true)
            new_card:set_edition("e_negative", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                        return true
                    end
                }))
            end,
                    message = "PEE,KA,BOO,,!"
                }
        end
        if context.selling_self  then
                local target_card = context.other_card
                return {
                    func = function()
                      card:juice_up(card.ability.extra.scale, card.ability.extra.rotation)
                      return true
                    end,
                    extra = {
                        message = "J,,AC,,OB",
                        colour = G.C.WHITE,
                        extra = {
                            message = "WH,ER,,E A,RE,, Y,OU GO,,I,NG, J,,ACO,B?",
                            colour = G.C.RED,
                        extra = {
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
            end,
                            colour = G.C.GREEN
                        }
                        }
                        }
                }
        end
        if context.first_hand_drawn  then
                return {
                    func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local random_sets = {'Tarot', 'Planet', 'Spectral'}
                        local random_set = random_sets[math.random(1, #random_sets)]
                        SMODS.add_card{set=random_set, edition = 'e_negative', key_append='joker_forge_' .. random_set:lower()}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end,
                    extra = {
                        func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local random_sets = {'Tarot', 'Planet', 'Spectral'}
                        local random_set = random_sets[math.random(1, #random_sets)]
                        SMODS.add_card{set=random_set, edition = 'e_negative', key_append='joker_forge_' .. random_set:lower()}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end,
                        colour = G.C.PURPLE,
                        extra = {
                            message = "don,t y,,ou ,,wan,t to,, pl,a,,y wit,,h yo,ur, f,,rie,,nds j,a,,co,b?",
                            colour = G.C.WHITE
                        }
                        }
                }
        end
        if context.remove_playing_cards  then
                return {
                    func = function()
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.c_base
                }, G.discard, true, false, nil, true)
            new_card:set_seal("Red", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                        return true
                    end
                }))
            end,
                    message = "wh,,a,t ,a,,re you,, do,,in,g j,,a,co,b?"
                }
        end
    end
}