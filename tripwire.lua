
SMODS.Joker{ --Tripwire
    key = "tripwire",
    config = {
        extra = {
            sealsadded = 0,
            chips0 = 35
        }
    },
    loc_txt = {
        ['name'] = 'Tripwire',
        ['text'] = {
            [1] = 'When {C:attention}hand {}played, create a',
            [2] = 'card with a {C:attention}Seal{}',
            [3] = 'When a {C:attention}Sealed {}card is scored,',
            [4] = '{C:red}destroy {}it and give {C:blue}+35{} Chips',
            [5] = '{C:inactive,s:0.9}(Tripwire can only add up to 10 Sealed cards){}',
            [6] = '{C:inactive,s:0.8}\"Where is the sun? Where is this sky?\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}Outco{}{C:attention,s:0.8}me Mem{}{C:clubs,s:0.8}ories{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 43
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.sealsadded}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if to_big((card.ability.extra.sealsadded or 0)) < to_big(0) then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.c_base
                }, G.discard, true, false, nil, true)
                
                base_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','sauce_rage_seal','sauce_chud','sauce_discord_ping','sauce_marked','sauce_greenseal','sauce_yellowseal','sauce_lavenderseal'}, pseudoseed('add_card_hand_seal')), true)
                
                
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
                card.ability.extra.sealsadded = (card.ability.extra.sealsadded) + 1
                return {
                    message = "Added Card!"
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card.seal ~= nil then
                context.other_card.should_destroy = true
                return {
                    chips = 35,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}