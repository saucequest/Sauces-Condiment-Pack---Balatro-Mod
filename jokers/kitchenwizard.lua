SMODS.Joker{ --Kitchen Wizard
    key = "kitchenwizard",
    config = {
        extra = {
            xchips = 20,
            chips = 20
        }
    },
    loc_txt = {
        ['name'] = 'Kitchen Wizard',
        ['text'] = {
            [1] = '{C:blue}+20{} Chips',
            [2] = '{C:blue}x20{} Chips if you own Egg and Rice',
            [3] = '',
            [4] = '{C:inactive}\"You\'re a real pain, you know that?\"{}',
            [5] = '{C:inactive}Originates from{} {C:enhanced}Block Tales{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_egg" then
              return true
          end
      end
      return false
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_sauce_rice" then
              return true
          end
      end
      return false
  end)()) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            else
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}