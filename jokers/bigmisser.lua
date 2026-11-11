
SMODS.Joker{ --4. Big Misser
    key = "bigmisser",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = '4. Big Misser',
        ['text'] = {
            [1] = 'If played hand is {C:red}not {}the {C:attention}most played hand{}, give {X:mult,C:white}X1.5{} Mult',
            [2] = '{C:inactive,s:0.8}\"WITHOUT A MIND TO THINK AND WRITHE!\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 2
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
    pools = { ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not ((function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)()) then
                return {
                    Xmult = 1.5
                }
            end
        end
    end
}