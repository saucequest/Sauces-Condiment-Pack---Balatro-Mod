
SMODS.Joker{ --Pest
    key = "pest",
    config = {
        extra = {
            odds = 3,
            dollars0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Pest',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance when {C:attention}Face Card{} scored',
            [2] = 'to subtract {C:money}$3{}',
            [3] = '{C:inactive,s:0.8}\"What? Never seen a bloodsucking bug before? Yeesh.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:legendary,s:0.8}RE{}{s:0.8}GR{}{C:money,s:0.8}ET{}{C:red,s:0.8}EV{}{C:clubs,s:0.8}AT{}{C:planet,s:0.8}OR{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 19
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    soul_pos = {
        x = 7,
        y = 19
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_pest') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(card, 'group_0_9f82ab11', 1, card.ability.extra.odds, 'j_sauce_pest', true) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("sauce_pest")
                            
                            return true
                        end,
                    }))
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars - 3
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(3), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }