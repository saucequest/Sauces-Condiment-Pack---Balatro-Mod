
SMODS.Joker{ --a generic generic platformer
    key = "agenericgenericplatformer",
    config = {
        extra = {
            stupidgame = 0.8,
            dollars0 = 1,
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'a generic generic platformer',
        ['text'] = {
            [1] = 'When a {C:attention}non Face{} card is scored, gain {C:money}$1{}',
            [2] = '{C:green}#2# in #3#{} chance to fall down instead and give {X:mult,C:white}X#1#{} Mult',
            [3] = 'For every falling instance, {C:attention}lower {}{X:mult,C:white}xMult{} by {X:mult,C:white}0.05{}',
            [4] = '{C:inactive,s:0.8}(Game by ECLA_17){}',
            [5] = '{C:inactive,s:0.8}(don\'t play it){}',
            [6] = '{C:inactive,s:0.8}https://scratch.mit.edu/projects/1217703928/{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 42
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_agenericgenericplatformer') 
        return {vars = {card.ability.extra.stupidgame, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not (context.other_card:is_face()) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 1
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_41cad834', 1, card.ability.extra.odds, 'j_sauce_agenericgenericplatformer', false) then
                    card.ability.extra.stupidgame = math.max(0, (card.ability.extra.stupidgame) - 0.05)
                    SMODS.calculate_effect({Xmult = card.ability.extra.stupidgame_value}, card)
                end
            end
        end
    end
}