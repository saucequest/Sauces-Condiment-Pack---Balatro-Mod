
SMODS.Joker{ --bucket of studs
    key = "bucketofstuds",
    config = {
        extra = {
            repetitions = 3
        }
    },
    loc_txt = {
        ['name'] = 'bucket of studs',
        ['text'] = {
            [1] = 'When {C:attention}sold{}, create 3 7s',
            [2] = 'with random {C:attention}Seals{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 41
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            if true then
                for i = 1, 3 do
                    local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                    local rank_suffix = '7'
                    local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.c_base
                    }, G.discard, true, false, nil, true)
                    
                    base_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','sauce_rage_seal','sauce_chud','sauce_discord_ping','sauce_marked','sauce_greenseal','sauce_yellowseal','sauce_lavenderseal'}, pseudoseed('add_card_hand_seal')), true)
                    
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            base_card:start_materialize()
                            G.play:emplace(base_card)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end
                        }))
                        draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                end
            end
        end
    end
}