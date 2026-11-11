
SMODS.Joker{ --hitman
    key = "hitman",
    config = {
        extra = {
            mult0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'hitman',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} selected, pick a {C:attention}rank{}',
            [2] = 'that is a {C:attention}face{} card',
            [3] = 'When the {C:attention}rank{} is scored, {C:red}destroy{} it,',
            [4] = 'give {C:red}+10{} Mult, and {C:attention}repick{} rank',
            [5] = '{C:inactive}(#1#){}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 39
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_ia"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.ranky_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.ranky_card = { rank = 'Jack', id = 11 }
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            local rank_pool = {}
            G.GAME.current_round.ranky_card.rank = pseudorandom_element(rank_pool, pseudoseed('randomRank'))
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:get_id() == 14 then
                context.other_card.should_destroy = true
                local rank_pool = {}
                G.GAME.current_round.ranky_card.rank = pseudorandom_element(rank_pool, pseudoseed('randomRank'))
                return {
                    mult = 10,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}