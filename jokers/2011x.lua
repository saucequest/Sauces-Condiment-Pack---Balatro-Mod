
SMODS.Joker{ --2011X
    key = "2011x",
    config = {
        extra = {
            ragemeter = 0,
            raging = 0,
            ragetimer = 8,
            lordxtrue = 0,
            xmult0 = 3
        }
    },
    loc_txt = {
        ['name'] = '2011X',
        ['text'] = {
            [1] = 'Whenever a card is destroyed, add 5 to {C:attention}Rage Meter{}',
            [2] = 'When {C:attention}Rage Meter{} is at 50, {C:attention}reset {}Rage Meter and give {X:red,C:white}X3{} Mult for',
            [3] = 'the next 8 hands',
            [4] = 'If Rage Meter has already been {C:attention}activated {}at least {C:attention}once {}in the run',
            [5] = 'and 2011X is {C:attention}sold{}, give Lord X',
            [6] = '{C:inactive}(RAGE METER: {C:red}#1#{}{C:inactive}){}',
            [7] = '{C:inactive,s:0.8}\"THINKING OUTSIDE THE BOX, ARE WE?\"{}',
            [8] = '{C:inactive,s:0.8}Originates from{} {C:hearts,s:0.8}SONIC 2011{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 11,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sonic"] = true },
    soul_pos = {
        x = 2,
        y = 0
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ragemeter, card.ability.extra.raging, card.ability.extra.ragetimer, card.ability.extra.lordxtrue}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_tails" then 
                        return true
                    end
                end
            end)() then
                return {
                    func = function()
                        card.ability.extra.ragemeter = (card.ability.extra.ragemeter) + 5
                        return true
                    end
                }
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_tails" then 
                        return true
                    end
                end
            end)() then
                return {
                    func = function()
                        card.ability.extra.ragemeter = (card.ability.extra.ragemeter) + 10
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.ragemeter or 0)) >= to_big(50) then
                card.ability.extra.raging = 1
                card.ability.extra.ragemeter = 1
            elseif to_big((card.ability.extra.raging or 0)) == to_big(1) then
                card.ability.extra.ragetimer = math.max(0, (card.ability.extra.ragetimer) - 1)
                card.ability.extra.lordxtrue = 1
                return {
                    Xmult = 3
                }
            elseif to_big((card.ability.extra.ragetimer or 0)) == to_big(0) then
                card.ability.extra.raging = 1
                card.ability.extra.ragetimer = 8
            end
        end
        if context.selling_self  then
            if to_big((card.ability.extra.lordxtrue or 0)) == to_big(1) then
                return {
                    func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_lordx' })
                                if joker_card then
                                    
                                    
                                end
                                
                                return true
                            end
                        }))
                        
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end
                }
            end
        end
    end
}