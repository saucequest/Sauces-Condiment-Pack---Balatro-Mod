SMODS.Joker{ --Code Corruption
    key = "codecorruption",
    config = {
        extra = {
            odds = 40,
            unnatural = 0,
            eternal = 0,
            respect = 0,
            cursed = 0
        }
    },
    loc_txt = {
        ['name'] = 'Code Corruption',
        ['text'] = {
            [1] = '{C:inactive,s:3}let\'s see if this works...{}',
            [2] = '{s:0.8}When Blind selected, self-destructs and:',
            [3] = '{}{C:green,s:0.8}1 in 40{} {s:0.8}chance to give a {C:dark_edition}Unnatural{} Joker',
            [4] = '{s:0.8}If chance fails, create an {}{C:dark_edition}Eternal{} Cursed Joker{}',
            [5] = '{C:inactive}(Requires room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_b29b6444', 1, card.ability.extra.odds, 'j_sauce_codecorruption', false) then
              SMODS.calculate_effect({func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'sauce_unnatural' })
                    if joker_card then
                        
                        joker_card:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end}, card)
                        SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
          end
            end
        end
        if context.pseudorandom_result  then
            if not context.result then
                return {
                    func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'sauce_cursed' })
                    if joker_card then
                        
                        joker_card:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
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
    end
}