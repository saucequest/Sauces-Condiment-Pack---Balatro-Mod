
SMODS.Joker{ --Sinnoh
    key = "sinnoh",
    config = {
        extra = {
            sinnohmult = 8.7
        }
    },
    loc_txt = {
        ['name'] = 'Sinnoh',
        ['text'] = {
            [1] = 'All scored {C:attention}Jacks{}, {C:attention}8s{}, and {C:attention}7s {}will add 0.4 to Sinnoh\'s Mult',
            [2] = 'Starts off with {C:dark_edition,s:5}^8.7{} Mult',
            [3] = '{C:inactive}(Currently{} {C:dark_edition}^#1#{} {C:inactive}Mult){}',
            [4] = '{C:inactive,s:0.8}\"WHO ARE YOU RUNNING FROM?\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:tarot,s:0.8}Vs. OURPLE GUY{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 22
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 87,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 22
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.sauce_stage_1_sold and G.GAME.pool_flags.sauce_stage_2_sold and G.GAME.pool_flags.sauce_trauma
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.sinnohmult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = card.ability.extra.sinnohmult
            }
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:get_id() == 11 then
                card.ability.extra.sinnohmult = (card.ability.extra.sinnohmult) + 0.4
            elseif context.other_card:get_id() == 8 then
                card.ability.extra.sinnohmult = (card.ability.extra.sinnohmult) + 0.4
            elseif context.other_card:get_id() == 7 then
                card.ability.extra.sinnohmult = (card.ability.extra.sinnohmult) + 0.4
            end
        end
    end
}