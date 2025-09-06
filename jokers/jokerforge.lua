SMODS.Joker{ --JokerForge
    key = "jokerforge",
    config = {
        extra = {
            mult = 6,
            odds = 4,
            Xmult = 2.5,
            odds2 = 6
        }
    },
    loc_txt = {
        ['name'] = 'JokerForge',
        ['text'] = {
            [1] = '{C:red}+6{} Mult',
            [2] = '{C:green}1 in 4{} chance for {X:red,C:white}X2.5{} Mult',
            [3] = '{C:green}1 in 6{} chance when Blind selected to instantly kill the run'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = card.ability.extra.mult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_48b49545', 1, card.ability.extra.odds, 'j_sauce_jokerforge', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
          end
                        return true
                    end
                }
            end
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_09b311cf', 1, card.ability.extra.odds, 'j_sauce_jokerforge', false) then
              SMODS.calculate_effect({func = function()
                
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                          G.STATE = G.STATES.GAME_OVER
                          G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end}, card)
          end
            end
        end
    end
}