
SMODS.Joker{ --A-Train
    key = "atrain",
    config = {
        extra = {
            icantstop = 1
        }
    },
    loc_txt = {
        ['name'] = 'A-Train',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.2{} Mult per',
            [2] = '{C:attention}Blue{} Seal in played hand',
            [3] = 'If scoring hand {C:attention}does not{} contain',
            [4] = 'any {C:attention}Blue {}Seals, {C:red}destroy {}a random Joker',
            [5] = '{C:inactive}(Currently {}{X:red,C:white}X1{}{C:inactive} Mult){}',
            [6] = '{C:inactive,s:0.8}\"Can\'t stop the A-Train!\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}The {}{C:blue,s:0.8}Boys{}',
            [8] = '{C:inactive,s:0.8}Revised concept by Glitchkat10{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 51
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
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 5,
        y = 51
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.icantstop}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Blue" then
                card.ability.extra.icantstop = (card.ability.extra.icantstop) + 0.2
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_zoom")
                        
                        return true
                    end,
                }))
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if not ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card.seal == "Blue" then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)()) then
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I cant stop...", colour = G.C.RED})
                end
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_icantstop")
                        
                        return true
                    end,
                }))
            else
                return {
                    Xmult = card.ability.extra.icantstop
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_atrain")
                    
                    return true
                end,
            }))
        end
    end
}