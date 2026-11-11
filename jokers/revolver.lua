
SMODS.Joker{ --Revolver
    key = "revolver",
    config = {
        extra = {
            bulletrounds = 1,
            blindsentered = 0,
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Revolver',
        ['text'] = {
            [1] = 'Give {X:mult,C:white}X2{} Mult for #1# round(s)',
            [2] = 'Give a {C:attention}bullet {}every 2 rounds',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:green,s:0.8}Di{}{C:common,s:0.8}e o{}{C:dark_edition,s:0.8}f D{}{C:money,s:0.8}ea{}{C:red,s:0.8}th{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 21
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_sauce_bullet"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_bullet\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.bulletrounds, card.ability.extra.blindsentered}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.bulletrounds or 0)) > to_big(0) then
                return {
                    Xmult = 2
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.bulletrounds = math.max(0, (card.ability.extra.bulletrounds) - 1)
                    return true
                end
            }
        end
        if context.setting_blind  and not context.blueprint then
            if to_big((card.ability.extra.blindsentered or 0)) == to_big(2) then
                return {
                    func = function()
                        
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
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.blindsentered = 1
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            else
                return {
                    func = function()
                        card.ability.extra.blindsentered = (card.ability.extra.blindsentered) + 1
                        return true
                    end
                }
            end
        end
    end
}