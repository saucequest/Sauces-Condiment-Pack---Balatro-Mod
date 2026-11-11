
SMODS.Joker{ --Deck Fixing at its Finest
    key = "deckfixingatitsfinest",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Deck Fixing at its Finest',
        ['text'] = {
            [1] = '{C:attention}Leftmost{} scoring card will be {C:red}destroyed{}',
            [2] = '{C:attention}Rightmost {}scoring card will be {C:attention}duplicated{}',
            [3] = '{C:inactive,s:0.8}\"What the heck, cut the deck!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card == context.scoring_hand[1] then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            elseif context.other_card == context.scoring_hand[#context.scoring_hand] then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copied_card)
                G.hand:emplace(copied_card)
                copied_card.states.visible = nil
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Copied Card to Hand!"
                }
            end
        end
    end
}