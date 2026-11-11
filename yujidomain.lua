
SMODS.Joker{ --Domain Expansion: Hometown
    key = "yujidomain",
    config = {
        extra = {
            potentialman = 0,
            emult0 = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Domain Expansion: Hometown',
        ['text'] = {
            [1] = 'If scored hand is a {C:attention}single face{}',
            [2] = 'card, {C:red}destroy {}it and give {C:dark_edition}^1.2{} Mult',
            [3] = '{C:inactive,s:1.2}(Domains will only last 5 rounds){}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
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
        
        return {vars = {card.ability.extra.potentialman}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card:is_face() and to_big(#context.full_hand) == to_big(1)) then
                context.other_card.should_destroy = true
                return {
                    e_mult = 1.2,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
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