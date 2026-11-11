
SMODS.Joker{ --Minigun
    key = "minigun",
    config = {
        extra = {
            miniguntime = 5,
            xmult0 = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Minigun',
        ['text'] = {
            [1] = '{X:red,C:white}X1.2{} Mult whenever a card scored',
            [2] = 'Lasts for 5 rounds',
            [3] = '{C:dark_edition}Gun Joker{}',
            [4] = '{C:inactive}(#1# remaining rounds){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 17
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_gun"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.miniguntime}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                Xmult = 1.2
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.miniguntime = math.max(0, (card.ability.extra.miniguntime) - 1)
                    return true
                end
            }
        end
        if context.starting_shop  then
            if to_big((card.ability.extra.miniguntime or 0)) == to_big(0) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
        if context.using_consumeable  then
            if context.consumeable and (context.consumeable.ability.set == 'item' or context.consumeable.ability.set == 'item') and context.consumeable.config.center.key == 'c_sauce_bullet' then
                return {
                    func = function()
                        card.ability.extra.miniguntime = (card.ability.extra.miniguntime) + 1
                        return true
                    end
                }
            end
        end
    end
}