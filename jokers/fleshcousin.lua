
SMODS.Joker{ --FleshCousin
    key = "fleshcousin",
    config = {
        extra = {
            faces = 0
        }
    },
    loc_txt = {
        ['name'] = 'FleshCousin',
        ['text'] = {
            [1] = 'After 25 {C:attention}Face {}cards have been scored,',
            [2] = 'sell this Joker to {C:attention}duplicate {}the {C:attention}leftmost {}Joker',
            [3] = '{C:inactive}(#1# Face Cards currently scored){}',
            [4] = '{C:inactive}(Requires room){}',
            [5] = '{C:inactive,s:0.8}\"It\'s my birthday!\"{}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:legendary,s:0.8}RE{}{s:0.8}GR{}{C:money,s:0.8}ET{}{C:red,s:0.8}EV{}{C:clubs,s:0.8}AT{}{C:planet,s:0.8}OR{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    soul_pos = {
        x = 3,
        y = 10
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.faces}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            card.ability.extra.faces = (card.ability.extra.faces) + 1
        end
        if context.selling_self  then
            if to_big((card.ability.extra.faces or 0)) >= to_big(25) then
                return {
                    func = function()
                        local target_joker = G.jokers.cards[1] or nil
                        
                        if target_joker and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                                    
                                    copied_joker:add_to_deck()
                                    G.jokers:emplace(copied_joker)
                                    G.GAME.joker_buffer = 0
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                        end
                        return true
                    end
                }
            end
        end
    end
}