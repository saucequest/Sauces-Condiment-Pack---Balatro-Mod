
SMODS.Joker{ --THE TOUCH OF MIDAS?!
    key = "thetouchofmidas",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'THE TOUCH OF MIDAS?!',
        ['text'] = {
            [1] = '{C:attention}Leftmost {}scoring card becomes {C:attention}Gold{}',
            [2] = '{C:green}#1# in #2#{} chance to {C:attention}destroy{} scored cards',
            [3] = '{C:inactive,s:0.8}\"You think this is a game? I\'m about to- GOO GOO!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 25
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_gold"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_gold\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_thetouchofmidas') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card == context.scoring_hand[1] then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_gold)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "THE TOUCH OF MIDAS?!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_ddd55d68', 1, card.ability.extra.odds, 'j_sauce_thetouchofmidas', false) then
                    context.other_card.should_destroy = true
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "GOO GOO!", colour = G.C.RED})
                end
            end
        end
    end
}