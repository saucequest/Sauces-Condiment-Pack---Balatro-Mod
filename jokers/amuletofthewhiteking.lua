
SMODS.Joker{ --amulet of the white king
    key = "amuletofthewhiteking",
    config = {
        extra = {
            hands0 = 3,
            discards0 = 3,
            hand_size0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'amulet of the white king',
        ['text'] = {
            [1] = 'When a {C:attention}Four of a Kind{} with only {C:attention}face{}',
            [2] = 'cards is played, {C:red}destroy{} scored cards and',
            [3] = 'gain {C:attention}+3{} Hands, {C:attention}+3{} Discards, and {C:attention}+3{} handsize',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 41
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = "sauce_unnatural",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'jud' 
            or args.source == 'buf' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.scoring_name == "Four of a Kind" and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)()) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if (context.scoring_name == "Four of a Kind" and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)()) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3).." Hands", colour = G.C.GREEN})
                        
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 3
                        ease_hands_played(3)
                        
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3).." Discards", colour = G.C.GREEN})
                            
                            G.GAME.round_resets.discards = G.GAME.round_resets.discards + 3
                            ease_discard(3)
                            
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            
                            func = function()
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3).." Hand Limit", colour = G.C.BLUE})
                                
                                G.hand:change_size(3)
                                return true
                            end,
                            colour = G.C.WHITE
                        }
                    }
                }
            end
        end
    end
}