
SMODS.Joker{ --Harlequin Contraption
    key = "harlequincontraption",
    config = {
        extra = {
            roundsleft = 3
        }
    },
    loc_txt = {
        ['name'] = 'Harlequin Contraption',
        ['text'] = {
            [1] = 'If the {C:attention}next 3 hands{} played are {C:attention}#2#{},',
            [2] = 'give a {C:dark_edition}Negative{} {C:spectral}Perishable {}{C:attention}Uncommon Joker{}',
            [3] = 'and change {C:attention}required {}hand',
            [4] = 'If one of the {C:attention}hands {}is {C:attention}not {}#2#, {C:red}destroy{}',
            [5] = 'a {C:attention}Joker {}and change {C:attention}hand required{}',
            [6] = '{C:inactive,s:0.8}\"Let\'s throw it all away! Reborn upon the stage\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_vocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.roundsleft, localize((G.GAME.current_round.harlequinhand_hand or 'High Card'), 'poker_hands')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.harlequinhand_hand = 'Straight'
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == G.GAME.current_round.harlequinhand_hand then
                card.ability.extra.roundsleft = math.max(0, (card.ability.extra.roundsleft) - 1)
            elseif not (context.scoring_name == G.GAME.current_round.harlequinhand_hand) then
                card.ability.extra.roundsleft = 3
                local harlequinhand_hands = {}
                for handname, _ in pairs(G.GAME.hands) do
                    if G.GAME.hands[handname].visible then
                        harlequinhand_hands[#harlequinhand_hands + 1] = handname
                    end
                end
                if harlequinhand_hands[1] then
                    G.GAME.current_round.harlequinhand_hand = pseudorandom_element(harlequinhand_hands, pseudoseed('harlequinhand' .. G.GAME.round_resets.ante))
                end
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.roundsleft or 0)) == to_big(0) then
                local harlequinhand_hands = {}
                for handname, _ in pairs(G.GAME.hands) do
                    if G.GAME.hands[handname].visible then
                        harlequinhand_hands[#harlequinhand_hands + 1] = handname
                    end
                end
                if harlequinhand_hands[1] then
                    G.GAME.current_round.harlequinhand_hand = pseudorandom_element(harlequinhand_hands, pseudoseed('harlequinhand' .. G.GAME.round_resets.ante))
                end
                return {
                    func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Uncommon' })
                                if joker_card then
                                    joker_card:set_edition(card.ability.extra.e_negative, true)
                                    joker_card:add_sticker('perishable', true)
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
    end
}