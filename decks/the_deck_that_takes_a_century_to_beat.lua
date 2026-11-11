
SMODS.Back {
    key = 'the_deck_that_takes_a_century_to_beat',
    pos = { x = 2, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'The Deck that Takes a Century to Beat',
        text = {
            [1] = 'Winning Ante is 16'
        },
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
        end
    end,
    apply = function(self, back)
        G.GAME.win_ante = 16
    end
}