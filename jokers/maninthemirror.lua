
SMODS.Joker{ --Man in the Mirror
    key = "maninthemirror",
    config = {
        extra = {
            denominator = 3,
            odds = 1
        }
    },
    loc_txt = {
        ['name'] = 'Man in the Mirror',
        ['text'] = {
            [1] = 'Scored {C:attention}face {}cards have a',
            [2] = '{C:green}#2# in #3#{} chance to become {C:attention}Glass{}',
            [3] = 'When a {C:attention}Glass{} card breaks, {C:attention}increase{}',
            [4] = 'this Joker\'s chance {C:attention}denominator {}by 1'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 35
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_glass"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_glass\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_maninthemirror') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(card, 'group_0_2682516d', 1, card.ability.extra.odds, 'j_sauce_maninthemirror', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_glass)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
        if context.remove_playing_cards  then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if removed_card.shattered then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    func = function()
                        card.ability.extra.denominator = (card.ability.extra.denominator) + 1
                        return true
                    end
                }
            end
        end
    end
}