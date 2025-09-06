SMODS.Joker{ --All-Father
    key = "allfather",
    config = {
        extra = {
            Xmult = 1.6
        }
    },
    loc_txt = {
        ['name'] = 'All-Father',
        ['text'] = {
            [1] = '{C:red}EXE{} Jokers give {X:red,C:white}1.6x{}',
            [2] = '{C:inactive}\"For now I am truly. GOD.\"{}',
            [3] = '{C:inactive}Originates from {}{C:red}SonicSavesRobloxia{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.other_joker  then
            if ((function()
        return context.other_joker.config.center.key == "j_sauce_elpendriveazul"
    end)() or (function()
        return context.other_joker.config.center.key == "j_sauce_2011x"
    end)() or (function()
        return context.other_joker.config.center.key == "j_sauce_end"
    end)() or (function()
        return context.other_joker.config.center.key == "j_sauce_indigo"
    end)() or (function()
        return context.other_joker.config.center.key == "j_sauce_niku"
    end)() or (function()
        return context.other_joker.config.center.key == "j_sauce_paceandtheshadow"
    end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_sauce_2017x" then
              return true
          end
      end
      return false
  end)()) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}