
SMODS.Joker{ --7Zip
    key = "_7zip",
    config = {
        extra = {
            jfpleasefixurautosavesibegyou = 0,
            cuzthisisthethirdtimeivehad = 0,
            tomakethisjokeragainduetoit = 0,
            booster_slots0 = 0.5
        }
    },
    loc_txt = {
        ['name'] = '7Zip',
        ['text'] = {
            [1] = 'When a 7 is {C:attention}scored{}, increase {C:attention}Booster Pack{}',
            [2] = '{C:attention}slots {}in the {C:attention}shop {}by 0.5',
            [3] = 'When {C:attention}Boss {}defeated, {C:attention}reset {}extra slots',
            [4] = '{C:inactive}(Currently #1# extra Booster slots){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.jfpleasefixurautosavesibegyou, card.ability.extra.cuzthisisthethirdtimeivehad, card.ability.extra.tomakethisjokeragainduetoit}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 7 then
                card.ability.extra.jfpleasefixurautosavesibegyou = (card.ability.extra.jfpleasefixurautosavesibegyou) + 0.5
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(0.5).." Booster Slots", colour = G.C.BLUE})
                        
                        SMODS.change_booster_limit(0.5)
                        return true
                    end
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.jfpleasefixurautosavesibegyou_value).." Booster Slots", colour = G.C.BLUE})
                    
                    SMODS.change_booster_limit(-card.ability.extra.jfpleasefixurautosavesibegyou_value)
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.jfpleasefixurautosavesibegyou = 1
                        return true
                    end,
                    colour = G.C.BLUE
                }
            }
        end
    end
}