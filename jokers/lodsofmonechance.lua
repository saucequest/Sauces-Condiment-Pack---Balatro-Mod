
SMODS.Joker{ --Lods Of Mone Chance
    key = "lodsofmonechance",
    config = {
        extra = {
            odds = 2,
            dollars0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Lods Of Mone Chance',
        ['text'] = {
            [1] = 'When card scored, {C:green}#1# in #2#{} chance to give {C:money}$2{}',
            [2] = '{C:inactive}Chance is not changable{}',
            [3] = '{C:inactive,s:0.8}\"SHUT YOUR MOUTH AND LOOK AT MY WAD!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_lodsofmonechance') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_c1dece72', 1, card.ability.extra.odds, 'j_sauce_lodsofmonechance', true) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 2
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shut your mouth and look at my WAD!", colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }