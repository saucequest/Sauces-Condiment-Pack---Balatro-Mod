
SMODS.Joker{ --John Doe
    key = "johndoe",
    config = {
        extra = {
            chips0 = 30
        }
    },
    loc_txt = {
        ['name'] = 'John Doe',
        ['text'] = {
            [1] = 'Applies {C:red}Corrupted {}to the {C:attention}last {}scoring card.',
            [2] = 'Played {C:attention}Aces {}and {C:attention}8s {}give {C:blue}+80{} Chips',
            [3] = '{C:inactive,s:0.8}\"DON\'T PLAY ROBLOX ON MARCH 18TH?!?!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_corrupted"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_corrupted\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 8) then
                return {
                    chips = 30
                }
            elseif context.other_card == context.scoring_hand[#context.scoring_hand] then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_corrupted)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_john")
                        
                        return true
                    end,
                }))
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("johnbuy")
                    
                    return true
                end,
            }))
        end
    end
}