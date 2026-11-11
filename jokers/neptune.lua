
SMODS.Joker{ --Neptune
    key = "neptune",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Neptune',
        ['text'] = {
            [1] = 'When Neptune is used, create a {C:dark_edition}Negative {}{C:attention}Perishable{}',
            [2] = 'copy of the {C:attention}leftmost {}Joker',
            [3] = '{C:inactive,s:0.8}\"THE RETURN OF THE BUBBLY BOYYYY!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {X:attention,C:black,s:0.8}5SOS:{} {X:attention,C:black,s:0.8}Bean\'s{} {X:attention,C:black,s:0.8}Show{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_neptune"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_neptune\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_neptune' then
                return {
                    func = function()
                        local target_joker = G.jokers.cards[1] or nil
                        
                        if target_joker then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                                    copied_joker:set_edition("e_negative", true)
                                    copied_joker:add_sticker('perishable', true)
                                    copied_joker:add_to_deck()
                                    G.jokers:emplace(copied_joker)
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