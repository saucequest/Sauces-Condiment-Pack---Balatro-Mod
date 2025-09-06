SMODS.Joker{ --John Forsaken
    key = "johnforsaken",
    config = {
        extra = {
            xmult = 1,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'John Forsaken',
        ['text'] = {
            [1] = 'For every successful \"average shedletsky',
            [2] = 'player\" chance add {X:mult,C:white}X2{} to Mult',
            [3] = '{s:0.7}When bought, give average shedletsky player{}',
            [4] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}',
            [5] = '{C:inactive}Originates from{} {C:red}FORSAKEN{}',
            [6] = '{C:dark_edition}Shedletsky Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_shed"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_averageshedletskyplayer' })
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
        if context.pseudorandom_result  then
            if (context.identifier == "sauce_averageshedletskyplayer" and context.result) then
                return {
                    func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 2
                    return true
                end
                }
            end
        end
    end
}