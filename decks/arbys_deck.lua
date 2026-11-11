
SMODS.Back {
    key = 'arbys_deck',
    pos = { x = 3, y = 1 },
    config = {
        extra = {
            remove_starting_cards_count0 = 52,
            add_starting_cards_count0 = 1,
            add_starting_cards_count = 1,
            add_starting_cards_count2 = 1,
            add_starting_cards_count3 = 1,
            add_starting_cards_count4 = 1,
            add_starting_cards_count5 = 1,
            add_starting_cards_count6 = 1,
            add_starting_cards_count7 = 1,
            add_starting_cards_count8 = 1,
            add_starting_cards_count9 = 1,
            add_starting_cards_count10 = 1,
            add_starting_cards_count11 = 1,
            add_starting_cards_count12 = 40
        },
    },
    loc_txt = {
        name = 'Arbys Deck',
        text = {
            [1] = 'Start with only {C:attention}face {}cards',
            [2] = 'and {C:attention}Meat {}cards'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i=#G.deck.cards, 1, -1 do
                    G.deck.cards[i]:remove()
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'J'
                    local _suit = 'Spades'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'J'
                    local _suit = 'Hearts'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'J'
                    local _suit = 'Diamonds'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'J'
                    local _suit = 'Clubs'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'Q'
                    local _suit = 'Spades'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'Q'
                    local _suit = 'Hearts'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'Q'
                    local _suit = 'Diamonds'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'Q'
                    local _suit = 'Clubs'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'K'
                    local _suit = 'Spades'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'K'
                    local _suit = 'Hearts'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'K'
                    local _suit = 'Diamonds'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 1 do
                    local _rank = 'K'
                    local _suit = 'Clubs'
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 40 do
                    local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                    local _suit = nil
                    local enhancement = G.P_CENTERS['m_sauce_meat']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}