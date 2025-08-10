SMODS.Joker{ --Metal Sonic
    key = "metalsonic",
    config = {
        extra = {
            electricmeter = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Metal Sonic',
        ['text'] = {
            [1] = 'First scoring card and Kings scored will',
            [2] = 'be turned into {C:attention}Steel{} Cards.',
            [3] = 'All Jacks scored will be destroyed and add a',
            [4] = 'random {C:enhanced}Electric {}card to your deck.',
            [5] = '{C:enhanced}Electric {}cards played add 2 to the Electric Meter.',
            [6] = '{C:money}Steel {}cards played add 1.5 to the Electric Meter.',
            [7] = 'Reaching 30 Electric Meter will {C:red}unlock Metal\'s true potential.{}',
            [8] = 'First scoring card, Kings, and Jacks {C:red}do not count{} toward',
            [9] = 'the Electric Meter when played {C:inactive}(sorry, code doesn\'t allow',
            [10] = 'me to do it!){}',
            [11] = '{C:inactive}(ELECTRIC METER:{} {C:common}#1#{}{C:inactive}){}',
            [12] = '{C:inactive}\"SONIC, DEAD OR ALIVE, IS MINE.\"{}',
            [13] = '{C:inactive}Originates from{} {C:common}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 2
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.electricmeter}}
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card == context.scoring_hand[1] then
                context.other_card:set_ability(G.P_CENTERS.m_steel)
                return {
                    message = "I WILL BATTLE YOU AS MANY TIMES AS IT IS NECESSARY."
                }
            elseif context.other_card:get_id() == 13 then
                context.other_card:set_ability(G.P_CENTERS.m_steel)
                return {
                    message = "I WILL BATTLE YOU AS MANY TIMES AS IT IS NECESSARY."
                }
            elseif context.other_card:get_id() == 11 then
                context.other_card.should_destroy = true
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_electric
                }, G.discard, true, false, nil, true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(base_card, nil, nil, G.playing_card)
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(new_card)
                table.insert(G.playing_cards, new_card)
                
                base_card:remove()
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        new_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Added Card!",
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                        }
                }
            elseif SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true then
                card.ability.extra.electricmeter = (card.ability.extra.electricmeter) + 2
            elseif SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                card.ability.extra.electricmeter = (card.ability.extra.electricmeter) + 1.5
            elseif (card.ability.extra.electricmeter or 0) >= 30 then
                local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_neometalsonic' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!",
                    extra = {
                        message = created_joker and localize('k_plus_joker') or nil,
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}