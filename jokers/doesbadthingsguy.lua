SMODS.Joker{ --Does Bad Things Guy
    key = "doesbadthingsguy",
    config = {
        extra = {
            odds = 2,
            no = 0,
            var1 = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Does Bad Things Guy',
        ['text'] = {
            [1] = 'Upon blind selected, {C:red}destroy {}a random Joker',
            [2] = 'When destroying a Joker, have a {C:green}1 in 2{} chance',
            [3] = 'of making a {C:dark_edition}Photograph{}',
            [4] = '{C:inactive}(Requires room){}',
            [5] = '{C:inactive}\"Ooh, where’s my saw...?\"{}',
            [6] = '{C:inactive}Originates from {}{C:red}Super {}{C:spectral}Mario {}{C:money}Logan{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 4
    },

    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
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
                end
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_6ce9e987', 1, card.ability.extra.odds, 'j_sauce_doesbadthingsguy', false) then
              SMODS.calculate_effect({func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_photograph' })
                    if joker_card then
                        
                        
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
          end
                        return true
                    end
                }
            end
        end
    end
}