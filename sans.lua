
SMODS.Joker{ --sans
    key = "sans",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'sans',
        ['text'] = {
            [1] = 'give a {C:attention}food {}joker when a {C:attention}Blue{} Seal is scored',
            [2] = '{C:inactive}(Requires room){}',
            [3] = '{C:inactive,s:0.8}\"i\'m sans. sans the skeleton.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}UNDER{}{C:money,s:0.8}TALE{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 46
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
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 7,
        y = 46
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'uta' 
            or args.source == 'sho' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Blue" then
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'sauce_food' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_papyrus' })
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
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            if not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_papyrus" then 
                        return true
                    end
                end
            end)()) then
                return {
                    message = "ive got one question for you.",
                    extra = {
                        message = "whyd you kill my brother?",
                        colour = G.C.RED,
                        extra = {
                            func = function()
                                local target_joker = card
                                
                                if target_joker then
                                    target_joker.getting_sliced = true
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            target_joker:shatter({G.C.RED}, nil, 1.6)
                                            return true
                                        end
                                    }))
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                                end
                                return true
                            end,
                            colour = G.C.RED,
                            extra = {
                                func = function()
                                    local target_joker = G.P_CENTERS["j_sauce_badtime"]
                                    if target_joker then
                                        unlock_card(target_joker)
                                        discover_card(target_joker)
                                        
                                    else
                                        error("JOKERFORGE: Invalid joker key in Unlock Joker Effect. Did you forget the modprefix or misspelled the key?")
                                    end
                                    return true
                                end,
                                colour = G.C.BLUE,
                                extra = {
                                    func = function()
                                        
                                        local created_joker = true
                                        G.E_MANAGER:add_event(Event({
                                            func = function()
                                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_badtime' })
                                                if joker_card then
                                                    
                                                    joker_card:add_sticker('eternal', true)
                                                end
                                                
                                                return true
                                            end
                                        }))
                                        
                                        if created_joker then
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                                        end
                                        return true
                                    end,
                                    colour = G.C.BLUE
                                }
                            }
                        }
                    }
                }
            end
        end
    end
}