
SMODS.Joker{ --DEATH GRIP
    key = "deathgrip",
    config = {
        extra = {
            deathgripofhearts = 0,
            deathgripofstone = 0
        }
    },
    loc_txt = {
        ['name'] = 'DEATH GRIP',
        ['text'] = {
            [1] = 'This Joker gains {C:mult}+1.7{} Mult per card with {C:hearts}Heart{} suit played',
            [2] = 'This Joker gains {C:chips}+5{} Chips per {C:attention}Stone Card{} played',
            [3] = 'If current {C:mult}Mult{} or {C:chips}Chips{} reaches {C:attention}50{},',
            [4] = '{C:red,E:1}self destruct{} and create an {C:purple}Eternal{} {C:attention}End',
            [5] = '{C:inactive,s:0.8}(Does not require room)',
            [6] = '{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult and {C:chips}+#2#{C:inactive} Chips){}',
            [7] = '{C:inactive,s:0.8}(thank you glitchkat10 for the better worded desc){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 45
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true, ["sauce_sinisterminds"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_stone"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_stone\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_sauce_end"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_end\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.deathgripofhearts, card.ability.extra.deathgripofstone}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.deathgripofhearts,
                extra = {
                    chips = card.ability.extra.deathgripofstone,
                    colour = G.C.CHIPS
                }
            }
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:is_suit("Hearts") then
                card.ability.extra.deathgripofhearts = (card.ability.extra.deathgripofhearts) + 1.7
            elseif SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                card.ability.extra.deathgripofstone = (card.ability.extra.deathgripofstone) + 5
            end
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if (to_big((card.ability.extra.deathgripofhearts or 0)) >= to_big(50) or to_big((card.ability.extra.deathgripofstone or 0)) == to_big(50)) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:shatter({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            local created_joker = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_end' })
                                    if joker_card then
                                        
                                        
                                    end
                                    
                                    return true
                                end
                            }))
                            
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                            end
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end
}