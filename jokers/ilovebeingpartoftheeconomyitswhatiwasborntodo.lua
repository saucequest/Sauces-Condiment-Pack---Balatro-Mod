
SMODS.Joker{ --I Love Being Part Of The Economy, Its What I Was Born To Do
    key = "ilovebeingpartoftheeconomyitswhatiwasborntodo",
    config = {
        extra = {
            fives = 0,
            dollars0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'I Love Being Part Of The Economy, Its What I Was Born To Do',
        ['text'] = {
            [1] = 'After 9 {C:attention}5s {}have been played,',
            [2] = '{C:red}destroy {}self and give',
            [3] = '{C:attention}double {}your current {C:money}money{}',
            [4] = '{C:inactive}(Can only make up to{}{C:money} $20{}{C:inactive}){}',
            [5] = '{C:inactive}(#1# Currently Played 5s){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 42
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_vocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.fives}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 5 then
                card.ability.extra.fives = (card.ability.extra.fives) + 1
            end
        end
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            if to_big((card.ability.extra.fives or 0)) == to_big(9) then
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
                    end,
                    extra = {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars * 2
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(2), colour = G.C.MONEY})
                            return true
                        end,
                        colour = G.C.MONEY
                    }
                }
            end
        end
    end
}