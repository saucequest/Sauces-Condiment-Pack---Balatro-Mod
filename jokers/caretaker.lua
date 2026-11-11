
SMODS.Joker{ --Caretaker
    key = "caretaker",
    config = {
        extra = {
            levels0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Caretaker',
        ['text'] = {
            [1] = 'If hand played activates the {C:attention}Boss{}',
            [2] = 'Blind, {C:attention}level up hand{} by 5',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:green,s:0.8}Di{}{C:common,s:0.8}e o{}{C:dark_edition,s:0.8}f D{}{C:money,s:0.8}ea{}{C:red,s:0.8}th{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.blind.triggered then
                local target_hand = (context.scoring_name or "High Card")
                level_up_hand(card, target_hand, true, 5)
                return {
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}