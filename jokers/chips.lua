
SMODS.Joker{ --Chips
    key = "chips",
    config = {
        extra = {
            chipsofchips = 80
        }
    },
    loc_txt = {
        ['name'] = 'Chips',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips',
            [2] = '{C:blue}-2{} Chips when card scored',
            [3] = 'When {C:blue}Chips {}reaches 0, {C:red}self-destruct{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_food"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chipsofchips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chipsofchips
            }
        end
        if context.individual and context.cardarea == G.play  then
            card.ability.extra.chipsofchips = math.max(0, (card.ability.extra.chipsofchips) - 2)
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.chipsofchips or 0)) <= to_big(2) then
                return {
                    func = function()
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
                        return true
                    end
                }
            end
        end
    end
}