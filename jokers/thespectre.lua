
SMODS.Joker{ --The Spectre
    key = "thespectre",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Spectre',
        ['text'] = {
            [1] = '{C:red}Destroys {}the Joker to the {C:attention}right {}of it',
            [2] = 'when {C:attention}Shop {}entered (bypasses {C:tarot}Eternals{})',
            [3] = '{C:inactive,s:0.8}\"you wouldn\'t dare defy me.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 25
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.starting_shop  then
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
                        if true and not joker.getting_sliced then
                            target_joker = joker
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
}