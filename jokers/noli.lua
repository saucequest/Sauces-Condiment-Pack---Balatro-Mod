SMODS.Joker{ --Noli
    key = "noli",
    config = {
        extra = {
            xchips = 2.01,
            odds = 4,
            Xmult = 0.8,
            noli_taunt = 0,
            noli_stun = 0,
            noli_intro = 0,
            noli_outro = 0
        }
    },
    loc_txt = {
        ['name'] = 'Noli',
        ['text'] = {
            [1] = '{X:chips,C:white}x2.010{} Chips',
            [2] = '{C:green}1 in 4{} chance for {X:red,C:white}X0.8{} Mult',
            [3] = 'Creates a {C:dark_edition}{}Hallucination Noli when hand played',
            [4] = '',
            [5] = '{C:inactive}\"This thing of darkness I acknowledge mine.\"{}',
            [6] = '{C:inactive}Originates from{} {C:spades}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
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
                play_sound("sauce_noli_taunt")
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        message = created_joker and localize('k_plus_joker') or nil,
                        colour = G.C.BLUE
                        }
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_e103e172', 1, card.ability.extra.odds, 'j_sauce_noli', false) then
              play_sound("sauce_noli_stun")
                        SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
          end
                        return true
                    end
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                play_sound("sauce_noli_intro")
        end
        if context.selling_self  then
                play_sound("sauce_noli_outro")
        end
    end
}