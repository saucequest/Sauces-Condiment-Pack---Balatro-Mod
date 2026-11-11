
SMODS.Joker{ --sans.
    key = "badtime",
    config = {
        extra = {
            odds = 2,
            hand_size0 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'sans.',
        ['text'] = {
            [1] = 'all cards scored become {C:blue}Blue{}',
            [2] = '{C:attention}leftmost and rightmost{} cards have a {C:green}1 in 2{} chance to',
            [3] = 'subtract {C:red}-0.1{} {C:attention}handsize{} when scored',
            [4] = '{C:red}destroy {}all cards scored every 2',
            [5] = 'hands that have {C:attention}5 cards or over{} scored',
            [6] = '{C:inactive,s:0.8}\"kids like you, should be burning in hell.\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}UNDER{}{C:money,s:0.8}TALE{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 47
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = false,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 2,
        y = 47
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'uta' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_blue"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_blue\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_badtime') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[1] and context.other_card == context.scoring_hand[#context.scoring_hand]) then
                if SMODS.pseudorandom_probability(card, 'group_0_5b763cc2', 1, card.ability.extra.odds, 'j_sauce_badtime', true) then
                    SMODS.calculate_effect({
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(0.1).." Hand Limit", colour = G.C.BLUE})
                            
                            G.hand:change_size(-0.1)
                            return true
                        end}, card)
                    end
                else
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_sauce_blue)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                end
            end
        end
    }