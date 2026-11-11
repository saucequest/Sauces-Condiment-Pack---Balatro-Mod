
SMODS.Joker{ --Domain Expansion: Unlimited Void
    key = "gojodomain",
    config = {
        extra = {
            play_size_increase = '999999999',
            potentialman = 0,
            fraudwatch = 0,
            enhancedcardsindeck = 0,
            odds = 4,
            hypermult_n0 = 2,
            hypermult_n = 2
        }
    },
    loc_txt = {
        ['name'] = 'Domain Expansion: Unlimited Void',
        ['text'] = {
            [1] = '{C:attention}Held {}and {C:attention}scored{} cards have rank',
            [2] = 'and suit {C:attention}randomized{}',
            [3] = 'All {C:attention}played {}cards score',
            [4] = 'Gain infinite play size',
            [5] = '{C:green}#4# in #5#{} chance for scored',
            [6] = 'cards to be {C:red}destroyed {}and give',
            [7] = '{X:black,C:red}(#2#)2{} Mult, where #2# equals',
            [8] = '{C:enhanced}Enhanced {}cards in deck',
            [9] = '{C:inactive,s:1.2}(Domains will only last 5 rounds){}',
            [10] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 48
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_domain",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_gojodomain') 
    return {vars = {card.ability.extra.potentialman, card.ability.extra.fraudwatch, (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)(), new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.potentialman or 0)) < to_big(5) then
                return {
                    func = function()
                        card.ability.extra.potentialman = (card.ability.extra.potentialman) + 1
                        return true
                    end
                }
            elseif to_big((card.ability.extra.potentialman or 0)) == to_big(5) then
                return {
                    func = function()
                        local target_joker = card
                        
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
                    end
                }
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            return {
                func = function()
                    assert(SMODS.change_base(context.other_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                end,
                message = "Card Modified!"
            }
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if true then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                if SMODS.pseudorandom_probability(card, 'group_0_740dbcfd', 1, card.ability.extra.odds, 'j_sauce_gojodomain', false) then
                    SMODS.calculate_effect({hypermult = {
                        card.ability.extra.fraudwatch,
                        2
                    }}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_740dbcfd', 1, card.ability.extra.odds, 'j_sauce_gojodomain', false) then
                    context.other_card.should_destroy = true
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    SMODS.calculate_effect({hypermult = {
                        card.ability.extra.fraudwatch,
                        2
                    }}, card)
                end
            end
        end
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                func = function()
                card.ability.extra.fraudwatch = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()
                    return true
                end
            }
        end
        
        if context.modify_scoring_hand and not context.blueprint then
            return {
                add_to_hand = true
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(999999999)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-999999999)
    end
}