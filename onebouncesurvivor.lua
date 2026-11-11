
SMODS.Joker{ --One Bounce Survivor
    key = "onebouncesurvivor",
    config = {
        extra = {
            xmult0 = 1.5,
            odds = 10,
            odds2 = 3
        }
    },
    loc_txt = {
        ['name'] = 'One Bounce Survivor',
        ['text'] = {
            [1] = '{C:enhanced}Enhanced{} face cards give {X:mult,C:white}x1.5{} Mult',
            [2] = '{C:attention}Discarded{} cards have a {C:green}#1# in #2#{} chance',
            [3] = 'to gain a random {C:enhanced}Enhancement{}',
            [4] = 'When a {C:attention}Cursed {}Joker is evaluated,',
            [5] = '{C:green}#1# in #2#{} chance to {C:red}destroy {}self',
            [6] = 'When Blind {C:attention}skipped{}, create an {C:attention}Item{}',
            [7] = '{C:inactive}(Requires room){}',
            [8] = '{C:inactive,s:0.8}\"JUST ONE BOUNCE BACK  IS ALL I NEED TO WIN!\"{}',
            [9] = '{C:inactive,s:0.8}Originates from{} {C:green,s:0.8}Di{}{C:common,s:0.8}e o{}{C:dark_edition,s:0.8}f D{}{C:money,s:0.8}ea{}{C:red,s:0.8}th{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 33
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_nonbuyable",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_onebouncesurvivor')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_onebouncesurvivor')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() and context.other_card:is_face()) then
                return {
                    Xmult = 1.5
                }
            end
        end
        if context.other_joker  and not context.blueprint then
            if (function()
                return context.other_joker.config.center.rarity == "sauce_cursed"
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_a3545666', 1, card.ability.extra.odds, 'j_sauce_onebouncesurvivor', false) then
                    SMODS.calculate_effect({func = function()
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
                    end}, card)
                end
            end
        end
        if context.skip_blind  then
            return {
                func = function()
                    
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'item', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
        if context.discard  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_35589ae6', 1, card.ability.extra.odds2, 'j_sauce_onebouncesurvivor', false) then
                    SMODS.calculate_effect({func = function()
                        local enhancement_pool = {}
                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                            if enhancement.key ~= 'm_stone' then
                                enhancement_pool[#enhancement_pool + 1] = enhancement
                            end
                        end
                        local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                        context.other_card:set_ability(random_enhancement)
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                end
            end
        end
    end
}