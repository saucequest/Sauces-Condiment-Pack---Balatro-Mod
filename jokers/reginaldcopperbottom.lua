
SMODS.Joker{ --Reginald Copperbottom
    key = "reginaldcopperbottom",
    config = {
        extra = {
            otherjokerssellvalue = 0,
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Reginald Copperbottom',
        ['text'] = {
            [1] = 'For every {C:attention}Joker {}owned, gain {C:money}sell value{} of all {C:attention}Jokers{}',
            [2] = 'when {C:attention}Boss {}defeated',
            [3] = 'When {C:attention}sold{}, has a {C:green}#2# in #3#{} chance to {C:red}destroy {}another',
            [4] = '{C:attention}Joker {}with it',
            [5] = '{C:inactive,s:0.8}\"Look like we\'ll be sharing this last ride together!\"{}',
            [6] = '{C:inactive,s:0.8}Originates from He{}{C:money,s:0.8}nry {}{C:red,s:0.8}Sti{}{C:uncommon,s:0.8}ckmin{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_reginaldcopperbottom') 
    return {vars = {(function() local total = 0; for _, joker in ipairs(G.jokers and (G.jokers and G.jokers.cards or {}) or {}) do if joker ~= card then total = total + joker.sell_cost end end; return total end)(), new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_card = G.jokers.cards[my_pos]
                target_card.ability.extra_value = (card.ability.extra_value or 0) + (function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do if joker ~= card then total = total + joker.sell_cost end end; return total end)()
                    target_card:set_cost()
                    return true
                end,
                message = "+"..tostring((function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do if joker ~= card then total = total + joker.sell_cost end end; return total end)()).." Sell Value"
            }
        end
        if context.selling_self  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_bcd76120', 1, card.ability.extra.odds, 'j_sauce_reginaldcopperbottom', false) then
                    SMODS.calculate_effect({func = function()
                        local destructable_jokers = {}
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
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
                    end}, card)
                end
            end
        end
    end
}