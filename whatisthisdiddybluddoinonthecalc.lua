
SMODS.Joker{ --WHAT IS THIS DIDDY BLUD DOIN ON THE CALC !?
    key = "whatisthisdiddybluddoinonthecalc",
    config = {
        extra = {
            CALCEQUATIONALANSWER = 0
        }
    },
    loc_txt = {
        ['name'] = 'WHAT IS THIS DIDDY BLUD DOIN ON THE CALC !?',
        ['text'] = {
            [1] = 'Randomly {C:attention}increment {}and decrement',
            [2] = 'CALC EQUATIONAL ANSWER when {C:attention}hand {}played',
            [3] = 'If CEA is 6 or 7, become {C:attention}SCP-067{}',
            [4] = '{C:inactive}(CALC EQUATIONAL ANSWER ={} {C:attention}#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 34
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
        
        local info_queue_0 = G.P_CENTERS["j_sauce_scp067"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_scp067\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.CALCEQUATIONALANSWER}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big((card.ability.extra.CALCEQUATIONALANSWER or 0)) == to_big(6) or to_big((card.ability.extra.CALCEQUATIONALANSWER or 0)) == to_big(7)) then
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
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_scp067' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            else
                local CALCEQUATIONALANSWER_value = card.ability.extra.CALCEQUATIONALANSWER
                card.ability.extra.CALCEQUATIONALANSWER = (card.ability.extra.CALCEQUATIONALANSWER) + pseudorandom('RANGE:1|15', 1, 15)
                card.ability.extra.CALCEQUATIONALANSWER = math.max(0, (card.ability.extra.CALCEQUATIONALANSWER) - pseudorandom('RANGE:1|15', 1, 15))
            end
        end
    end
}