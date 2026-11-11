
SMODS.Joker{ --Extremely Stoned Joker
    key = "reallystoned",
    config = {
        extra = {
            cigaweed = 0,
            weedmult = 1,
            stonecardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Extremely Stoned Joker',
        ['text'] = {
            [1] = 'Gain {X:red,C:white}X0.1{} Mult for every {C:attention}Stone{} Card',
            [2] = 'in deck when {C:attention}High Card{} is played',
            [3] = '{C:inactive}(Works once per round){}',
            [4] = '{C:inactive}(Currently{} {X:red,C:white}X#2#{} {C:inactive}Mult){}',
            [5] = '{C:inactive,s:0.8}What a fool.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 48
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
    pools = { ["sauce_sauce_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.sauce_cigaweed
    end,
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {card.ability.extra.cigaweed, card.ability.extra.weedmult, ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_stone') then count = count + 1 end end; return count end)()) * 0.1}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (context.scoring_name == "High Card" and to_big((card.ability.extra.cigaweed or 0)) == to_big(0)) then
            card.ability.extra.weedmult = (card.ability.extra.weedmult) + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_stone') then count = count + 1 end end; return count end)()) * 0.1
                card.ability.extra.cigaweed = 1
            else
                return {
                    Xmult = card.ability.extra.weedmult
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.cigaweed = 0
                    return true
                end
            }
        end
    end
}