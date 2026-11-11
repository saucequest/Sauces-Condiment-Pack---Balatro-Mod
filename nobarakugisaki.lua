
SMODS.Joker{ --Nobara Kugisaki
    key = "nobarakugisaki",
    config = {
        extra = {
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Nobara Kugisaki',
        ['text'] = {
            [1] = 'Held {C:attention}Steel{} Cards are {C:attention}retriggered{}',
            [2] = 'and then {C:red}destroyed{}',
            [3] = '{C:inactive,s:0.8}\"It wasn\'t so bad!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 48
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                context.other_card.should_destroy = true
                return {
                    repetitions = 1,
                    message = localize('k_again_ex'),
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}