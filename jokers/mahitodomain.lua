
SMODS.Joker{ --Domain Expansion: Self-Embodiment of Perfection
    key = "mahitodomain",
    config = {
        extra = {
            jiheidendonka = 0
        }
    },
    loc_txt = {
        ['name'] = 'Domain Expansion: Self-Embodiment of Perfection',
        ['text'] = {
            [1] = 'All {C:attention}scored{} and {C:attention}held{} cards become Meat',
            [2] = 'in {C:attention}Small Blinds{}',
            [3] = '{C:inactive,s:1.2}(Domains will only last 5 rounds){}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 51
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
        
        return {vars = {card.ability.extra.jiheidendonka}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if G.GAME.blind:get_type() == 'Small' then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_meat)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if G.GAME.blind:get_type() == 'Small' then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_sauce_meat)
                    end,
                    message = "Card Modified!"
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.jiheidendonka or 0)) < to_big(5) then
                return {
                    func = function()
                        card.ability.extra.jiheidendonka = (card.ability.extra.jiheidendonka) + 1
                        return true
                    end
                }
            elseif to_big((card.ability.extra.jiheidendonka or 0)) == to_big(5) then
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
                                    target_joker:shatter({G.C.RED}, nil, 1.6)
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
    end
}