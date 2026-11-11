
SMODS.Joker{ --Kitsunami the Fennec
    key = "kitsunamithefennec",
    config = {
        extra = {
            watercannons = 0,
            waterychips = 50
        }
    },
    loc_txt = {
        ['name'] = 'Kitsunami the Fennec',
        ['text'] = {
            [1] = 'Every 3 {C:attention}hands{}, make cards {C:attention}Drenched{}',
            [2] = '{C:attention}Drenched{} cards {C:attention}increase{} Kit\'s Chips by {C:chips}25{}',
            [3] = '{C:inactive}(Currently{}{C:chips} +#2#{} {C:inactive}Chips) {}',
            [4] = '{C:inactive,s:0.8}\"Get back to Surge! Support Surge! Be with Surge!\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 30
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true },
    soul_pos = {
        x = 7,
        y = 30
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_drenched"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_drenched\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.watercannons, card.ability.extra.waterychips}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.watercannons or 0)) == to_big(0) then
                return {
                    func = function()
                        card.ability.extra.watercannons = 3
                        return true
                    end
                }
            end
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if to_big((card.ability.extra.watercannons or 0)) == to_big(0) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_drenched)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif SMODS.get_enhancements(context.other_card)["m_sauce_drenched"] == true then
                card.ability.extra.waterychips = (card.ability.extra.waterychips) + 25
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.watercannons = math.max(0, (card.ability.extra.watercannons) - 1)
            return {
                chips = card.ability.extra.waterychips
            }
        end
    end
}