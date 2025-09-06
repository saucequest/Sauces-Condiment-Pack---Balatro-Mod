SMODS.Joker{ --MINIMUM RAGE
    key = "minimumrage",
    config = {
        extra = {
            ragemeter = 0,
            food = 0,
            respect = 0,
            no = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'MINIMUM RAGE',
        ['text'] = {
            [1] = 'Create a Food Joker when Blind selected and increase Rage',
            [2] = 'Upon Rage hitting 8, flip and shuffle all Jokers,',
            [3] = 'then destroy 3 Jokers and self',
            [4] = '{C:inactive}(RAGE:{} {C:red}#1#{}{C:inactive}){}',
            [5] = '{C:inactive}\"Smile baby, smile, for the corporation!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ragemeter}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'sauce_food' })
                    if joker_card then
                        
                        
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                    extra = {
                        func = function()
                    card.ability.extra.ragemeter = math.max(0, (card.ability.extra.ragemeter) - 1)
                    return true
                end,
                        colour = G.C.RED
                        }
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.ragemeter or 0) == 8 then
                if #G.jokers.cards > 0 then
      for _, joker in ipairs(G.jokers.cards) do
        joker:flip()
      end
    end
                if #G.jokers.cards > 1 then
  G.jokers:unhighlight_all()
  G.E_MANAGER:add_event(Event({
      trigger = 'before',
      func = function()
          G.E_MANAGER:add_event(Event({
              func = function()
                  G.jokers:shuffle('aajk')
                  play_sound('cardSlide1', 0.85)
                  return true
              end,
          }))
          delay(0.15)
          G.E_MANAGER:add_event(Event({
              func = function()
                  G.jokers:shuffle('aajk')
                  play_sound('cardSlide1', 1.15)
                  return true
              end
          }))
          delay(0.15)
          G.E_MANAGER:add_event(Event({
              func = function()
                  G.jokers:shuffle('aajk')
                  play_sound('cardSlide1', 1)
                  return true
              end
          }))
        delay(0.5)
        return true
      end
    }))
  end
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                return {
                    message = "Flip!",
                    extra = {
                        message = "Shuffle!",
                        colour = G.C.ORANGE,
                        extra = {
                            func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Destroyed!",
                            colour = G.C.RED
                        }
                        }
                }
            end
        end
    end
}