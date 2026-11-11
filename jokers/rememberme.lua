
SMODS.Joker{ --Remember Me
    key = "rememberme",
    config = {
        extra = {
            jointhegore = 1.1,
            discardedfaces = 0
        }
    },
    loc_txt = {
        ['name'] = 'Remember Me',
        ['text'] = {
            [1] = 'Scored {C:attention}Wild{} cards give {X:red,C:white}X#1#{} Mult',
            [2] = 'Discarded {C:attention}face {}cards increment xMult by {X:red,C:white}0.05{}',
            [3] = 'After 30 {C:attention}face {}cards have been {C:attention}discarded{},',
            [4] = '{C:red}destroy {}self'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 45
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true, ["sauce_sinisterminds"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_wild"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_wild\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.jointhegore, card.ability.extra.discardedfaces}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                return {
                    Xmult = card.ability.extra.jointhegore
                }
            end
        end
        if context.discard  and not context.blueprint then
            if context.other_card:is_face() then
                return {
                    func = function()
                        card.ability.extra.discardedfaces = (card.ability.extra.discardedfaces) + 1
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.jointhegore = (card.ability.extra.jointhegore) + 0.05
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if to_big((card.ability.extra.discardedfaces or 0)) == to_big(30) then
                local target_joker = card
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
    end
}