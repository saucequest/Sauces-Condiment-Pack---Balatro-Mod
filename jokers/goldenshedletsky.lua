
SMODS.Joker{ --Golden Shedletsky
    key = "goldenshedletsky",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Golden Shedletsky',
        ['text'] = {
            [1] = '{C:red}Destroy {}scored {C:attention}Gold{} cards',
            [2] = 'and create a random {C:attention}consumable{}',
            [3] = '{C:inactive}(Requires room){}',
            [4] = '{C:inactive,s:0.8}\"Imbued with an ancient power\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}',
            [6] = '{C:dark_edition}Shedletsky Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 42
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_shed"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_gold"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_gold\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
                context.other_card.should_destroy = true
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            local sets = {'Tarot', 'Planet', 'Spectral'}
                            local random_set = pseudorandom_element(sets, 'random_consumable_set')
                            SMODS.add_card({ set = random_set, })                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_consumable') or nil,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}