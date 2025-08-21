SMODS.Joker{ --The Great Floccinaucinihilipilification
    key = "thegreatflocci",
    config = {
        extra = {
            wisheffect = 0,
            dollars = 25,
            respect = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Great Floccinaucinihilipilification',
        ['text'] = {
            [1] = 'Grants a {E:1}\"wish\"{} with effects in the order below whenever a Blind is selected.',
            [2] = '\"I wish they were RICH!\" - Gives you {C:money}$25{}',
            [3] = '\"I wish they were FAMOUS!\" - Adds 5 random {C:dark_edition}Negative {}consumables',
            [4] = 'and 1 random {C:dark_edition}Negative {}{C:common}Common{} Joker.',
            [5] = '\"I wish for a brand-new CAR!\" - \"Runs over\" a random Joker and {C:red}destroys {}it',
            [6] = '',
            [7] = '{C:inactive}\"Oh, thou have GOT to be kidding me.\"{}',
            [8] = '{C:inactive}Originates from{} {C:attention}Block Tales{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 9
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.ending_shop  then
            if (card.ability.extra.wisheffect or 0) == 4 then
                return {
                    func = function()
                    card.ability.extra.wisheffect = 1
                    return true
                end
                }
            else
                return {
                    func = function()
                    card.ability.extra.wisheffect = (card.ability.extra.wisheffect) + 1
                    return true
                end
                }
            end
        end
        if context.setting_blind  then
            if (card.ability.extra.wisheffect or 0) == 1 then
                return {
                    dollars = card.ability.extra.dollars,
                    message = "I wish they were RICH!"
                }
            elseif (card.ability.extra.wisheffect or 0) == 2 then
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish they were FAMOUS!", colour = G.C.PURPLE})
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish they were FAMOUS!", colour = G.C.PURPLE})
                    end
                    return true
                end,
                        colour = G.C.PURPLE,
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish they were FAMOUS!", colour = G.C.PURPLE})
                    end
                    return true
                end,
                            colour = G.C.PURPLE,
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish they were FAMOUS!", colour = G.C.PURPLE})
                    end
                    return true
                end,
                            colour = G.C.PURPLE,
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish they were FAMOUS!", colour = G.C.PURPLE})
                    end
                    return true
                end,
                            colour = G.C.PURPLE,
                        extra = {
                            func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish they were FAMOUS!", colour = G.C.BLUE})
            end
            return true
        end,
                            colour = G.C.BLUE
                        }
                        }
                        }
                        }
                        }
                }
            elseif (card.ability.extra.wisheffect or 0) == 3 then
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish for a brand-new CAR!", colour = G.C.RED})
                end
                    return true
                end
                }
            end
        end
    end
}