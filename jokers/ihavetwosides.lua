SMODS.Joker{ --I have two sides
    key = "ihavetwosides",
    config = {
        extra = {
            yes = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'I have two sides',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance of retriggering leftmost Joker',
            [2] = 'If chance failed, destroy rightmost Joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.pseudorandom_result  then
            if not context.result then
                return {
                    func = function()
                local target_joker = nil
                for i = #G.jokers.cards, 1, -1 do
                    local joker = G.jokers.cards[i]
                    if joker ~= card and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
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