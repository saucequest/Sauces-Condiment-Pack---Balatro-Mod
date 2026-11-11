
SMODS.Joker{ --Yuta Okkotsu and Rika
    key = "yutaokkotsuandrika",
    config = {
        extra = {
            domainexpansion = 0
        }
    },
    loc_txt = {
        ['name'] = 'Yuta Okkotsu and Rika',
        ['text'] = {
            [1] = 'Copy the {C:attention}Joker{}\'s ability to the right,',
            [2] = 'then {C:red}destroy {}it',
            [3] = 'After destroying 10 {C:attention}Jokers{}, activate {C:attention}Authentic{}',
            [4] = '{C:attention}Mutual Love{}',
            [5] = '({C:inactive}#1# Jokers Destroyed){}',
            [6] = '{C:inactive,s:0.8}“I just, don’t want to see anyone getting hurt again.”{}',
            [7] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 47
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 7,
        y = 47
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_sauce_yutadomain"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_yutadomain\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.domainexpansion}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_joker = nil
                    if my_pos and my_pos < #G.jokers.cards then
                        local joker = G.jokers.cards[my_pos + 1]
                        if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                            target_joker = joker
                        end
                    end
                    
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
                        card.ability.extra.domainexpansion = (card.ability.extra.domainexpansion) + 1
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.domainexpansion or 0)) == to_big(10) then
                card.ability.extra.domainexpansion = 0
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_yutadomain' })
                        if joker_card then
                            
                            joker_card:add_sticker('eternal', true)
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
        
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos < #G.jokers.cards) and G.jokers.cards[my_pos + 1] or nil
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}