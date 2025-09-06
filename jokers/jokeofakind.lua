SMODS.Joker{ --Joke of a Kind
    key = "jokeofakind",
    config = {
        extra = {
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Joke of a Kind',
        ['text'] = {
            [1] = 'Whenever a {C:dark_edition}Five of a Kind{} is played, give 5 Jokers',
            [2] = '{C:inactive}(by Jokers, I mean the default Joker ofcourse.){}',
            [3] = '{C:inactive}Originates from{} {C:spectral}Discord{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 6
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Five of a Kind" then
                local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil,
                    extra = {
                        message = created_joker and localize('k_plus_joker') or nil,
                        colour = G.C.BLUE,
                        extra = {
                            message = created_joker and localize('k_plus_joker') or nil,
                            colour = G.C.BLUE,
                        extra = {
                            message = created_joker and localize('k_plus_joker') or nil,
                            colour = G.C.BLUE,
                        extra = {
                            message = created_joker and localize('k_plus_joker') or nil,
                            colour = G.C.BLUE
                        }
                        }
                        }
                        }
                }
            end
        end
    end
}