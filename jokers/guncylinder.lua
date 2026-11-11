
SMODS.Joker{ --Gun Cylinder
    key = "guncylinder",
    config = {
        extra = {
            cylindervar = 6
        }
    },
    loc_txt = {
        ['name'] = 'Gun Cylinder',
        ['text'] = {
            [1] = 'Give a {C:attention}Bullet {}every 6th scored card',
            [2] = '{C:inactive}(Cards left: #1#){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_sauce_bullet"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_bullet\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.cylindervar}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big((card.ability.extra.cylindervar or 0)) == to_big(0) then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'item', key = 'c_sauce_bullet2'})                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                card.ability.extra.cylindervar = 6
                return {
                    message = created_consumable and localize('k_plus_consumable') or nil
                }
            else
                card.ability.extra.cylindervar = math.max(0, (card.ability.extra.cylindervar) - 1)
            end
        end
    end
}