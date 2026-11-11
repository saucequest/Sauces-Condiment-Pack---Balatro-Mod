
SMODS.Joker{ --The Curse Challenge
    key = "thecursechallenge",
    config = {
        extra = {
            roundsdefeated = 0,
            repetitions = 3,
            repetitions2 = 99,
            repetitions2 = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Curse Challenge',
        ['text'] = {
            [1] = 'Doesn\'t take a {C:attention}Joker Slot{}',
            [2] = 'When bought, give 3 {C:attention}Cursed {}Jokers.',
            [3] = 'After 4 rounds have been {C:attention}defeated {}with',
            [4] = 'the Cursed Jokers, {C:red}wipe {}all Jokers and',
            [5] = 'give an {C:dark_edition}Unnatural {}Joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 25
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.roundsdefeated}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            if true then
                for i = 1, 3 do
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'sauce_cursed' })
                                if joker_card then
                                    
                                    joker_card:add_sticker('eternal', true)
                                end
                                
                                return true
                            end
                        }))
                        
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end}, card)
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.roundsdefeated or 0)) == to_big(4) then
                for i = 1, 99 do
                    SMODS.calculate_effect({func = function()
                        local destructable_jokers = {}
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker ~= card and not joker.getting_sliced then
                                table.insert(destructable_jokers, joker)
                            end
                        end
                        local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
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
                    end}, card)
                end
                for i = 1, 1 do
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'sauce_unnatural' })
                                if joker_card then
                                    
                                    
                                end
                                
                                return true
                            end
                        }))
                        
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end}, card)
                end
            else
                return {
                    func = function()
                        card.ability.extra.roundsdefeated = (card.ability.extra.roundsdefeated) + 1
                        return true
                    end
                }
            end
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_sauce_thecursechallenge" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    	if e.config.ref_table.config.center.key == "j_sauce_thecursechallenge" then
        		e.config.colour = G.C.GREEN
        		e.config.button = "use_card"
    	else
        		can_select_card_ref(e)
    	end
end