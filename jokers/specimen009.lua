
SMODS.Joker{ --Specimen 009
    key = "specimen009",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Specimen 009',
        ['text'] = {
            [1] = 'When a 9 is scored, create a {C:attention}Black Hole{}',
            [2] = '{C:inactive,s:0.8}\"Little to nothing is known about what he is or what he can do.\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Pizza{} {C:red,s:0.8}Game{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 23
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_black_hole"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_black_hole\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 9 then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Spectral', key = 'c_black_hole'})                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_spectral') or nil
                }
            end
        end
    end
}