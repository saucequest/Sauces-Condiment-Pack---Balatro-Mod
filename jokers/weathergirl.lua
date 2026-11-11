
SMODS.Joker{ --weathergirl
    key = "weathergirl",
    config = {
        extra = {
            didntyouseethenewstoday = 10,
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'weathergirl',
        ['text'] = {
            [1] = '{C:green}1 in 10{} chance for scored card',
            [2] = 'to become {C:attention}Drenched{}',
            [3] = 'Scoring {C:attention}Queens {}decreases {C:attention}denominator {}by 1',
            [4] = 'Scored {C:attention}Drenched in Tears{} cards balance {C:blue}Chips {}and {C:red}Mult{}',
            [5] = '{C:inactive,s:0.8}\"Didn\'t you see the news today? I heard they said it looked like rain\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 43
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_vocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_drenched"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_drenched\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_weathergirl') 
        return {vars = {card.ability.extra.didntyouseethenewstoday, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 12 then
                card.ability.extra.didntyouseethenewstoday = math.max(0, (card.ability.extra.didntyouseethenewstoday) - 1)
            elseif to_big((card.ability.extra.didntyouseethenewstoday or 0)) == to_big(2) then
                card.ability.extra.didntyouseethenewstoday = 10
            elseif SMODS.get_enhancements(context.other_card)["m_sauce_drenchedintears"] == true then
                return {
                    balance = true
                }
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_542d61f2', 1, card.ability.extra.odds, 'j_sauce_weathergirl', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_sauce_drenched)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}