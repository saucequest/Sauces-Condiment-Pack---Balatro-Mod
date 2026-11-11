
SMODS.Joker{ --Domain Expansion: Authentic Mutual Love
    key = "yutadomain",
    config = {
        extra = {
            domain = 0,
            repetitions0_min = NaN,
            repetitions0_max = 3
        }
    },
    loc_txt = {
        ['name'] = 'Domain Expansion: Authentic Mutual Love',
        ['text'] = {
            [1] = '{C:attention}Retrigger {}all cards scored 3 times',
            [2] = '{C:inactive,s:1.2}(Domains will only last 5 rounds){}',
            [3] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 47
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_domain",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
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
        
        return {vars = {card.ability.extra.domain}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            return {
                repetitions = pseudorandom('RANGE:1|3', 1, 3),
                message = localize('k_again_ex')
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.domain or 0)) < to_big(45) then
                return {
                    func = function()
                        card.ability.extra.domain = (card.ability.extra.domain) + 1
                        return true
                    end
                }
            elseif to_big((card.ability.extra.domain or 0)) == to_big(5) then
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