SMODS.Joker{ --Whales Shedletsky
    key = "whalesshedletsky",
    config = {
        extra = {
            Xmult = 3,
            no = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Whales Shedletsky',
        ['text'] = {
            [1] = 'Give {X:mult,C:white}X3{} Mult and apply {C:attention}Burning {}to scoring cards next hand',
            [2] = 'Destroys self and Jokers to the left and right of it after the hand',
            [3] = '{C:inactive}\"i may or may not have nuked a few whales earlier\"{}',
            [4] = '{C:inactive}Originates from{} {C:red}FORSAKEN{}',
            [5] = '{C:dark_edition}Shedletsky Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_shed"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
                local target_joker = nil
                if my_pos and my_pos > 1 then
                    local joker = G.jokers.cards[my_pos - 1]
                    if not joker.ability.eternal and not joker.getting_sliced then
                        target_joker = joker
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
                local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
                local target_joker = nil
                if my_pos and my_pos < #G.jokers.cards then
                    local joker = G.jokers.cards[my_pos + 1]
                    if not joker.ability.eternal and not joker.getting_sliced then
                        target_joker = joker
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
                return {
                    Xmult = card.ability.extra.Xmult,
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
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_sauce_burning)
                return {
                    message = "Card Modified!"
                }
        end
    end
}