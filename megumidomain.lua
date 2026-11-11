
SMODS.Joker{ --Domain Expansion: Chimera Shadow Garden
    key = "megumidomain",
    config = {
        extra = {
            potentialman = 0,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Domain Expansion: Chimera Shadow Garden',
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance to',
            [2] = 'create a {C:dark_edition}Negative {}{C:planet}Perishable {}Megumi',
            [3] = 'if scored card is a Black Suit {C:attention}face {}card',
            [4] = '{C:inactive,s:1.2}(Domains will only last 5 rounds){}',
            [5] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 48
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_domain",
    blueprint_compat = true,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_megumidomain') 
        return {vars = {card.ability.extra.potentialman, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_face() and context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs")) then
                if SMODS.pseudorandom_probability(card, 'group_0_e9367015', 1, card.ability.extra.odds, 'j_sauce_megumidomain', false) then
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_megumifushiguro' })
                            if joker_card then
                                joker_card:set_edition("e_negative", true)
                                joker_card:add_sticker('perishable', true)
                            end
                            
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                end
            end
        end
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
    end
}