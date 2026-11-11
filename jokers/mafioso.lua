
SMODS.Joker{ --Mafioso
    key = "mafioso",
    config = {
        extra = {
            xmult0 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Mafioso',
        ['text'] = {
            [1] = 'If in {C:attention}debt{}, give {X:mult,C:white}X0.5{} Mult',
            [2] = '{C:inactive,s:0.8}\"I didn\'t really expect to find one of our targets here.\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:planet,s:0.8}Dream Game{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.dollars) < to_big(10) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_mafioso")
                        
                        return true
                    end,
                }))
                return {
                    Xmult = 0.1
                }
            end
        end
    end
}