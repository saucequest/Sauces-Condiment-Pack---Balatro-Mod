
SMODS.Joker{ --wake up call
    key = "wakeupcall",
    config = {
        extra = {
            mult0 = 8
        }
    },
    loc_txt = {
        ['name'] = 'wake up call',
        ['text'] = {
            [1] = 'When {C:attention}last{} card scored, give',
            [2] = '{C:red}+8{} Mult and {C:attention}flip{} all Jokers',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 41
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                if #G.jokers.cards > 0 then
                    for _, joker in ipairs(G.jokers.cards) do
                        joker:flip()
                    end
                end
                return {
                    mult = 8,
                    extra = {
                        message = "Flip!",
                        colour = G.C.ORANGE
                    }
                }
            end
        end
    end
}