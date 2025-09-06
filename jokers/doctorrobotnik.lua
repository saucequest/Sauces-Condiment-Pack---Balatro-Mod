SMODS.Joker{ --Doctor Robotnik
    key = "doctorrobotnik",
    config = {
        extra = {
            odds = 10,
            perishable = 0,
            ignore = 0,
            eggman_make = 0,
            eggman_sold = 0
        }
    },
    loc_txt = {
        ['name'] = 'Doctor Robotnik',
        ['text'] = {
            [1] = 'Creates a {C:planet}Perishable {}Moto Bug when Blind selected.',
            [2] = '{C:green}1 in 10{} chance to create Metal Sonic when Boss Blind defeated',
            [3] = 'All cards scored become {C:attention}Steel{}',
            [4] = '{C:inactive}\"Get a load of this!\"{}',
            [5] = '{C:inactive}Originates from{} {C:common}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
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
    soul_pos = {
        x = 1,
        y = 4
    },

    calculate = function(self, card, context)
        if context.setting_blind  then
                play_sound("sauce_eggman_make")
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_motobug' })
                    if joker_card then
                        
                        joker_card:add_sticker('perishable', true)
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fd3eb8f2', 1, card.ability.extra.odds, 'j_sauce_doctorrobotnik', false) then
              play_sound("sauce_eggman_make")
                        SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_metal_sonic' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end}, card)
          end
            end
        end
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_steel)
                return {
                    message = "Card Modified!"
                }
        end
        if context.selling_self  then
                play_sound("sauce_eggman_sold")
        end
    end
}