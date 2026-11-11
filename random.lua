
SMODS.Joker{ --??? 
    key = "random",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = '??? ',
        ['text'] = {
            [1] = 'When {C:attention}sold{}, create a random {C:spectral}Perishable{}',
            [2] = '{C:attention}Grace{} or {C:attention}NULLSCAPE{} Joker',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}NU{}{C:tarot,s:0.8}LL{}{C:dark_edition,s:0.8}SC{}{C:red,s:0.8}APE{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 37
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_gracescape"] = true, ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'sauce_gracescape' })
                                if joker_card then
                                    
                                    joker_card:add_sticker('perishable', true)
                                end
                                G.GAME.joker_buffer = 0
                                return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end
}