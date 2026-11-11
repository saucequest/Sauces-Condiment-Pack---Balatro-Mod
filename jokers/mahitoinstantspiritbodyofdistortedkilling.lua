
SMODS.Joker{ --Mahito: Instant Spirit Body of Distorted Killing
    key = "mahitoinstantspiritbodyofdistortedkilling",
    config = {
        extra = {
            xmult0 = 2,
            echips0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Mahito: Instant Spirit Body of Distorted Killing',
        ['text'] = {
            [1] = 'Scored {C:attention}face {}cards give {X:red,C:white}X2{} Mult,',
            [2] = 'then get {C:red}destroyed{}',
            [3] = 'Scored {C:attention}Meat {}cards give {C:dark_edition}^2{} Mult',
            [4] = 'Create an {C:purple}Eternal {}{C:attention}Polymorphic Soul Isomer{}',
            [5] = 'when entering {C:attention}Boss {}Blind',
            [6] = 'Playing a hand with a {C:red}Red {}Suit and',
            [7] = 'a {C:attention}Black {}Suit will make this Joker change',
            [8] = 'back to {C:attention}Mahito{}, and vice-versa',
            [9] = '{C:inactive,s:0.8}\"How about wishing me a happy birthday... Itadori?!\"{}',
            [10] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Jujutsu {}{C:red,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 51
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'sou' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_meat"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_meat\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_sauce_polymorphicsoulisomer"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_polymorphicsoulisomer\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["j_sauce_mahito"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_mahito\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_face() then
                context.other_card.should_destroy = true
                return {
                    Xmult = 2,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            elseif SMODS.get_enhancements(context.other_card)["m_sauce_meat"] == true then
                return {
                    e_chips = 2
                }
            end
        end
        if context.setting_blind  then
            if G.GAME.blind.boss then
                return {
                    func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_polymorphicsoulisomer' })
                                if joker_card then
                                    
                                    joker_card:add_sticker('eternal', true)
                                end
                                
                                return true
                            end
                        }))
                        
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Spades") or playing_card:is_suit("Clubs") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                local target_joker = card
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_mahito' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
    end
}