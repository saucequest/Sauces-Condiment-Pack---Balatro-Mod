
SMODS.Joker{ --icecream treat
    key = "icecreamtreat",
    config = {
        extra = {
            icecreamconsumed = 0,
            rounds = 10
        }
    },
    loc_txt = {
        ['name'] = 'icecream treat',
        ['text'] = {
            [1] = 'If a {C:attention}consumable{} was used in the',
            [2] = '{C:attention}round{} and a card is scored, apply',
            [3] = '{C:attention}Burning{} to scored card',
            [4] = 'Can only be {C:attention}activated{} every 10 hands',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 37
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_food"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.icecreamconsumed, card.ability.extra.rounds}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if to_big((card.ability.extra.rounds or 0)) == to_big(10) then
                return {
                    func = function()
                        card.ability.extra.icecreamconsumed = 1
                        return true
                    end
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if to_big((card.ability.extra.icecreamconsumed or 0)) == to_big(1) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_burning)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.rounds or 0)) == to_big(0) then
                return {
                    func = function()
                        card.ability.extra.rounds = 10
                        return true
                    end
                }
            else
                return {
                    func = function()
                        card.ability.extra.rounds = math.max(0, (card.ability.extra.rounds) - 1)
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.rounds or 0)) == to_big(0) then
                card.ability.extra.rounds = 10
            else
                card.ability.extra.rounds = math.max(0, (card.ability.extra.rounds) - 1)
            end
        end
    end
}