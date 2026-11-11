
SMODS.Joker{ --Hwando
    key = "hwando",
    config = {
        extra = {
            adrenaline = 0,
            hands0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Hwando',
        ['text'] = {
            [1] = 'Played {C:attention}hands {}in the {C:attention}Boss {}Blind',
            [2] = 'add 20 {C:attention}score {}to the {C:attention}Adrenaline Meter{}',
            [3] = 'If you have {C:attention}atleast 50 Meter{}, playing',
            [4] = 'your {C:attention}most played{} hand will {C:attention}disable {}the Boss',
            [5] = 'If the meter is {C:attention}full{}, playing a {C:attention}Full House{} will',
            [6] = 'add {C:blue}+1{} Hand for the {C:attention}round{}',
            [7] = '{C:attention}Activating {}will decrement the {C:attention}meter {}by the',
            [8] = 'necessary {C:attention}amount{}',
            [9] = '{C:inactive}Adrenaline Meter: {}{C:attention}#1#/100{}',
            [10] = '{C:inactive,s:0.8}\"So why don\'t we just...not follow what they tell us to?{}',
            [11] = '{C:inactive,s:0.8}To break our chains and run as free Avatars!\"{}',
            [12] = '{C:inactive,s:0.8}Originates from Terror{} {C:red,s:0.8}Realm{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 44
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.adrenaline}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (G.GAME.blind.boss and to_big((card.ability.extra.adrenaline or 0)) ~= to_big(100)) then
                card.ability.extra.adrenaline = (card.ability.extra.adrenaline) + 20
            elseif (to_big((card.ability.extra.adrenaline or 0)) >= to_big(50) and (function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)()) then
                if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.blind:disable()
                            play_sound('timpani')
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                end
                card.ability.extra.adrenaline = math.max(0, (card.ability.extra.adrenaline) - 50)
            elseif (to_big((card.ability.extra.adrenaline or 0)) == to_big(100) and context.scoring_name == "Full House") then
                card.ability.extra.adrenaline = 0
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                        
                        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                        return true
                    end
                }
            end
        end
    end
}