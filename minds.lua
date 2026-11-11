
SMODS.Joker{ --3. Minds
    key = "minds",
    config = {
        extra = {
            rankofthesinisterminds = 'Even',
            dollars0 = 3,
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = '3. Minds',
        ['text'] = {
            [1] = '#1# ranks give {C:money}$3{} when scored',
            [2] = 'Switch between {C:attention}Odd {}and {C:attention}Even {}ranks',
            [3] = 'when hand is {C:attention}finished {}scoring'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 36
    },
    display_size = {
        w = 71 * 2, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rankofthesinisterminds}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10) and card.ability.extra.rankofthesinisterminds == 'Even') then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 3
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif ((context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) and card.ability.extra.rankofthesinisterminds == 'Odd') then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 3
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if card.ability.extra.rankofthesinisterminds == 'Even' then
                card.ability.extra.rankofthesinisterminds = 'Odd'
            elseif card.ability.extra.rankofthesinisterminds == 'Odd' then
                card.ability.extra.rankofthesinisterminds = 'Even'
            end
        end
    end
}