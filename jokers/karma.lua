
SMODS.Joker{ --KARMA
    key = "karma",
    config = {
        extra = {
            karma = 0,
            karmaactive = 0
        }
    },
    loc_txt = {
        ['name'] = 'KARMA',
        ['text'] = {
            [1] = 'Destroying {C:attention}Queens {}will fill karma',
            [2] = 'Once karma is {C:attention}full{}, reset karma and',
            [3] = 'the {C:attention}face{} cards scored in the',
            [4] = '{C:attention}next hand{} will be {C:red}destroyed {}and',
            [5] = 'give {C:attention}Judgement{}',
            [6] = '{C:inactive}Karma:{} {C:attention}#1#/3{}',
            [7] = '{C:inactive}(Requires room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        
        local info_queue_0 = G.P_CENTERS["c_judgement"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_judgement\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.karma, card.ability.extra.karmaactive}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  and not context.blueprint then
            if ((function()
                for k, removed_card in ipairs(context.removed) do
                    if removed_card:get_id() == 12 then
                        return true
                    end
                end
                return false
            end)() and to_big((card.ability.extra.karmaactive or 0)) == to_big(0) and to_big((card.ability.extra.karma or 0)) <= to_big(2)) then
                return {
                    func = function()
                        card.ability.extra.karma = (card.ability.extra.karma) + 1
                        return true
                    end
                }
            end
        end
        if context.hand_drawn  and not context.blueprint then
            if to_big((card.ability.extra.karma or 0)) == to_big(3) then
                return {
                    func = function()
                        card.ability.extra.karmaactive = 1
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.karma = 0
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card:is_face() and to_big((card.ability.extra.karmaactive or 0)) == to_big(1)) then
                context.other_card.should_destroy = true
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Tarot', key = 'c_judgement'})                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_tarot') or nil,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}