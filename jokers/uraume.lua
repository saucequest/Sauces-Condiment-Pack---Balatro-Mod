
SMODS.Joker{ --Uraume
    key = "uraume",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Uraume',
        ['text'] = {
            [1] = 'Scored cards have a {C:green}#1# in #2#{} chance',
            [2] = 'to become {C:attention}Frozen {}if a {C:attention}King {}is in',
            [3] = 'scored hand',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Jujutsu {}{C:red,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 50
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_frozen"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_frozen\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_uraume') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == K then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_8fd7f21f', 1, card.ability.extra.odds, 'j_sauce_uraume', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_sauce_frozen)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}