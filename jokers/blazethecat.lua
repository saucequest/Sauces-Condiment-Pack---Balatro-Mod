
SMODS.Joker{ --Blaze the Cat
    key = "blazethecat",
    config = {
        extra = {
            odds = 5,
            xmult0 = 0.5,
            xmult = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Blaze the Cat',
        ['text'] = {
            [1] = '{C:attention}Queens {}played will be given {C:attention}Burning{}',
            [2] = '{C:green}#1# in #2#{} chance to {C:red}destroy {}the triggered Queen and give {X:red,C:white}X0.5{} Mult',
            [3] = '{C:inactive,s:0.8}\"I will not allow my people to come to such suffering!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sonic"] = true },
    soul_pos = {
        x = 6,
        y = 2
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_blazethecat') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:get_id() == 12 then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_burning)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                if SMODS.pseudorandom_probability(card, 'group_0_3c40be7a', 1, card.ability.extra.odds, 'j_sauce_blazethecat', false) then
                    SMODS.calculate_effect({Xmult = 0.5}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_3c40be7a', 1, card.ability.extra.odds, 'j_sauce_blazethecat', false) then
                    context.other_card.should_destroy = true
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    SMODS.calculate_effect({Xmult = 0.5}, card)
                end
            end
        end
    end
}