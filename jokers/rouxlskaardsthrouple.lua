
SMODS.Joker{ --Rouxls Kaards Throuple
    key = "rouxlskaardsthrouple",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Rouxls Kaards Throuple',
        ['text'] = {
            [1] = 'If hand played {C:attention}contains{} exactly 3 {C:attention}Face{} cards,',
            [2] = 'fill {C:purple}consumable{} slots with {C:attention}Rules Card{}',
            [3] = '{C:inactive,s:0.8}\"But can thou defeast... The powere... of Love?\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}DELTARUNE{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 29
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
        
        local info_queue_0 = G.P_CENTERS["c_sauce_rulescard"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_rulescard\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == 3
            end)() then
                for i = 1, math.min(50, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Tarot', key = 'c_sauce_rulescard'})                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_tarot') or nil
                }
            end
        end
    end
}