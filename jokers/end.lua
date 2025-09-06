SMODS.Joker{ --END
    key = "end",
    config = {
        extra = {
            pluschips = 30,
            odds = 6,
            yes = 0,
            var1 = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'END',
        ['text'] = {
            [1] = 'Low-rank cards will score {C:blue}+#1#{} Chips',
            [2] = 'Additive Chips value will be increased by {C:blue}+15 {}whenever',
            [3] = 'a face card is scored',
            [4] = '{C:green}1 in 6{} chance to replace a Joker with itself when Round ends',
            [5] = '{C:inactive}\"Climb the green mountain trail..\"{}',
            [6] = '{C:inactive}Originates from{} {C:uncommon}Green Mountain{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_end') 
        return {vars = {card.ability.extra.pluschips, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 5) then
                return {
                    chips = card.ability.extra.pluschips
                }
            elseif context.other_card:is_face() then
                card.ability.extra.pluschips = (card.ability.extra.pluschips) + 15
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_ee8c8c09', 1, card.ability.extra.odds, 'j_sauce_end', false) then
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
                        SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_end' })
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
                        SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
          end
            end
        end
    end
}