
SMODS.Joker{ --Zombie
    key = "zombie",
    config = {
        extra = {
            rot = 0,
            mult0 = -5,
            odds = 8
        }
    },
    loc_txt = {
        ['name'] = 'Zombie',
        ['text'] = {
            [1] = '{C:red}-5{} Mult',
            [2] = 'After 3 {C:attention}hands {}have been played,',
            [3] = 'this Zombie will be {C:red}destroyed{}',
            [4] = 'Scored cards have a {C:green}#2# in #3#{}',
            [5] = 'chance to be {C:red}destroyed {}and create',
            [6] = 'another {C:attention}Eternal Zombie{}',
            [7] = '{C:inactive}(Overflows){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 33
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
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_zombie') 
        return {vars = {card.ability.extra.rot, new_numerator, new_denominator}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.rot = (card.ability.extra.rot) + 1
            return {
                mult = -5,
                message = "Braaaains..."
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.rot or 0)) == to_big(3) then
                return {
                    func = function()
                        local target_joker = card
                        
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
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_cd7fe735', 1, card.ability.extra.odds, 'j_sauce_zombie', false) then
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_zombie' })
                            if joker_card then
                                
                                joker_card:add_sticker('eternal', true)
                            end
                            
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                end
                if SMODS.pseudorandom_probability(card, 'group_1_cd7fe735', 1, card.ability.extra.odds, 'j_sauce_zombie', false) then
                    context.other_card.should_destroy = true
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_zombie' })
                            if joker_card then
                                
                                joker_card:add_sticker('eternal', true)
                            end
                            
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
    end
}