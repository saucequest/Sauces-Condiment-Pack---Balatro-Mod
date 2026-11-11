
SMODS.Joker{ --Starface
    key = "starface",
    config = {
        extra = {
            noace = 2
        }
    },
    loc_txt = {
        ['name'] = 'Starface',
        ['text'] = {
            [1] = 'When a {C:attention}Face{} card is scored and hand {C:red}doesn\'t{}',
            [2] = 'contain an Ace, {C:red}destroy{} the {C:attention}face{}',
            [3] = 'card and create an Ace of {C:diamonds}Diamonds{}',
            [4] = 'If an {C:attention}Ace{} is not played in #1#',
            [5] = 'hands, {C:red}destroy{} a Joker',
            [6] = '{C:inactive,s:0.8}\"Or do you want to be left faceless and forgotten?\" {}',
            [7] = '{C:inactive,s:0.8}Originates from{} {s:0.8}The{} {C:red,s:0.8}June Archive{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 37
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
        
        return {vars = {card.ability.extra.noace}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card:is_face() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == A then
                        count = count + 1
                    end
                end
                return count == 0
            end)()) then
                context.other_card.should_destroy = true
                local suit_prefix = 'D'
                local rank_suffix = 'A'
                local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.c_base
                }, G.discard, true, false, nil, true)
                
                
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(base_card, nil, nil, G.playing_card)
                
                new_card:add_to_deck()
                
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(new_card)
                table.insert(G.playing_cards, new_card)
                
                base_card:remove()
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        new_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Added Card!",
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == A then
                        count = count + 1
                    end
                end
                return count == 0
            end)() then
                card.ability.extra.noace = math.max(0, (card.ability.extra.noace) - 1)
            elseif (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == A then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                card.ability.extra.noace = 2
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.noace or 0)) == to_big(0) then
                return {
                    func = function()
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.noace = 2
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end
}