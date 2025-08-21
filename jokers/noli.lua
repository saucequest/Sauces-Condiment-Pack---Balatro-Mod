SMODS.Joker{ --Noli
    key = "noli",
    config = {
        extra = {
            xchips = 2.01,
            odds = 4,
            Xmult = 0.8
        }
    },
    loc_txt = {
        ['name'] = 'Noli',
        ['text'] = {
            [1] = '{X:chips,C:white}x2.010{} Chips',
            [2] = '{C:green}1 in 4{} chance for {X:red,C:white}X0.8{} Mult',
            [3] = 'Creates a {C:dark_edition}Negative {}Hallucination Noli when hand played',
            [4] = '',
            [5] = '{C:inactive}\"This thing of darkness I acknowledge mine.\"{}',
            [6] = '{C:inactive}Originates from{} {C:spades}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_nolihallucination' })
                          if joker_card then
                              joker_card:set_edition("e_negative", true)
                              
                          end
                          
                          return true
                      end
                  }))
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        message = created_joker and localize('k_plus_joker') or nil,
                        colour = G.C.BLUE
                        }
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_e103e172', 1, card.ability.extra.odds, 'j_sauce_noli') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                  end
                        return true
                    end
                }
            end
        end
    end
}