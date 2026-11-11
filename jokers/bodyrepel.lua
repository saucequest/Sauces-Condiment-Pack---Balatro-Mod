
SMODS.Joker{ --Body Repel
    key = "bodyrepel",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Body Repel',
        ['text'] = {
            [1] = '{C:red}Destroy {}scored cards',
            [2] = 'in {C:attention}first {}played hand of round',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Jujutsu {}{C:red,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 51
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
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
            if G.GAME.current_round.hands_played == 0 then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
}