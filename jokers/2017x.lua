SMODS.Joker{ --2017x
    key = "2017x",
    config = {
        extra = {
            discards = 1,
            round = 0,
            ignore = 0,
            no = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = '2017x',
        ['text'] = {
            [1] = 'Second scoring card will gain {C:attention}Burning {}',
            [2] = 'and subtracts a discard for the round',
            [3] = 'Applies {C:edition}Scorched {}to rightmost Joker',
            [4] = '{C:inactive}\"You\'re not very good at this, ARE YOU?\"{}',
            [5] = '{C:inactive}Originates from{} {C:hearts}Sonic Legacy{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[2] then
                context.other_card:set_ability(G.P_CENTERS.m_sauce_burning)
                return {
                    message = "Card Modified!",
                    extra = {
                        func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.discards).." Discard", colour = G.C.RED})
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left - card.ability.extra.discards
                return true
            end,
                        colour = G.C.ORANGE
                        }
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                return {
                    func = function()
                local target_joker = G.jokers.cards[#G.jokers.cards] or nil
                
                if target_joker then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                        copied_joker:set_edition("e_sauce_scorched", true)
                            
                            copied_joker:add_to_deck()
                            G.jokers:emplace(copied_joker)
                        G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                end
                    return true
                end,
                    extra = {
                        func = function()
                local target_joker = nil
                for i = #G.jokers.cards, 1, -1 do
                    local joker = G.jokers.cards[i]
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
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
        end
    end
}