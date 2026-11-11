
SMODS.Joker{ --11. Feel That Dread?
    key = "feelthatdread",
    config = {
        extra = {
            dread = 0,
            mult0 = 6
        }
    },
    loc_txt = {
        ['name'] = '11. Feel That Dread?',
        ['text'] = {
            [1] = 'Scored {C:attention}face {}cards give {C:red}+6{} Mult',
            [2] = 'and {C:attention}increase {}the Dread meter',
            [3] = 'If Dread is {C:attention}full {}at the end of',
            [4] = 'the round, {C:red}destroy {}a random Joker',
            [5] = '{C:inactive}Dread Meter: #1#/7{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 36
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.dread}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_face() and to_big((card.ability.extra.dread or 0)) < to_big(7)) then
                card.ability.extra.dread = (card.ability.extra.dread) + 1
                return {
                    mult = 6
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if to_big((card.ability.extra.dread or 0)) == to_big(7) then
                return {
                    func = function()
                        local destructable_jokers = {}
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
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
                        return true
                    end
                }
            end
        end
    end
}