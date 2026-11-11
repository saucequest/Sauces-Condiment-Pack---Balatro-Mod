
SMODS.Joker{ --Utahime Iori
    key = "utahimeiori",
    config = {
        extra = {
            xmult0 = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Utahime Iori',
        ['text'] = {
            [1] = 'A {C:attention}random {}rank that is a {C:attention}face {}card',
            [2] = 'will be selected every {C:attention}round{}',
            [3] = 'Selected rank gives {X:red,C:white}X1.2{} Mult when scored',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 49
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.yomaino_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.yomaino_card = { rank = 'Jack', id = 11 }
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            local rank_pool = {}
            G.GAME.current_round.yomaino_card.rank = pseudorandom_element(rank_pool, pseudoseed('randomRank'))
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                return {
                    Xmult = 1.2
                }
            end
        end
    end
}