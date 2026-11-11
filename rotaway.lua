
SMODS.Joker{ --ROT AWAY
    key = "rotaway",
    config = {
        extra = {
            lastisface = 0,
            trigger = 0
        }
    },
    loc_txt = {
        ['name'] = 'ROT AWAY',
        ['text'] = {
            [1] = 'If {C:attention}last {}played hand contains 3 or more {C:attention}face {}cards,',
            [2] = '{C:red}destroy {}scored {C:attention}face {}cards and',
            [3] = 'create a {C:attention}Red{} Seal when destroying',
            [4] = 'Once no more {C:attention}face {}cards are in {C:attention}deck{}, scoring',
            [5] = 'a {C:attention}Red{} Seal will instantly {C:red}lose {}the run'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 45
    },
    display_size = {
        w = 71 * 2, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true, ["sauce_sinisterminds"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.lastisface, card.ability.extra.trigger}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count >= 3
            end)() then
                card.ability.extra.lastisface = 1
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card:is_face() and to_big((card.ability.extra.lastisface or 0)) == to_big(1)) then
                context.other_card.should_destroy = true
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.c_base
                }, G.discard, true, false, nil, true)
                
                base_card:set_seal("Red", true)
                
                
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
                card.ability.extra.trigger = 1
                return {
                    message = "Added Card!",
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if to_big((card.ability.extra.trigger or 0)) == to_big(1) then
                return {
                    func = function()
                        card.ability.extra.lastisface = 0
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.trigger = 0
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end
}