
SMODS.Joker{ --You Are An Idiot!
    key = "youareanidiot",
    config = {
        extra = {
            idiot = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'You Are An Idiot!',
        ['text'] = {
            [1] = 'Starts off with {X:red,C:white}x1.5{} Mult',
            [2] = 'Adds {X:mult,C:white}x0.2{} Mult whenever {C:red}2 or less{} cards are {C:attention}discarded{}',
            [3] = 'Subtracts {X:mult,C:white}x0.2{} Mult whenever a {C:attention}hand {}that is {C:red}not{}',
            [4] = '{C:red}High Card{} is scored{}',
            [5] = 'Adds {X:mult,C:white}x0.3{} Mult whenever a {C:attention}hand {}that is only{C:red}{}',
            [6] = '{C:red}High Card{} is scored{}',
            [7] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}',
            [8] = '{C:inactive,s:0.8}\"You are an idiot! A-hahaha!\"{}',
            [9] = '{C:inactive,s:0.8}Originates from{} {C:dark_edition,s:0.8}You Are An Idiot{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 28
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
    soul_pos = {
        x = 8,
        y = 28
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.idiot}}
    end,
    
    calculate = function(self, card, context)
        if context.pre_discard  and not context.blueprint then
            if to_big(#context.full_hand) <= to_big(2) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_idiot")
                        
                        return true
                    end,
                }))
                return {
                    func = function()
                        card.ability.extra.idiot = (card.ability.extra.idiot) + 0.2
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "High Card" then
                card.ability.extra.idiot = (card.ability.extra.idiot) + 0.3
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_idiot")
                        
                        return true
                    end,
                }))
            elseif context.scoring_name == "High Card" then
                card.ability.extra.idiot = math.max(0, (card.ability.extra.idiot) - 0.2)
            else
                return {
                    Xmult = card.ability.extra.idiot
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_idiot")
                    
                    return true
                end,
            }))
        end
    end
}