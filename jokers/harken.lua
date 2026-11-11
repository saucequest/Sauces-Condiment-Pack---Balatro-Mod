
SMODS.Joker{ --Harken
    key = "harken",
    config = {
        extra = {
            noise = 0,
            enraged = 0,
            ragehands = 0,
            hush = 'calm..'
        }
    },
    loc_txt = {
        ['name'] = 'Harken',
        ['text'] = {
            [1] = 'When a card is scored, {C:attention}increase {}Noise Meter by 1',
            [2] = 'When {C:attention}Noise Meter{} reaches 25, {C:attention}reset {}meter and become',
            [3] = '{C:attention}Enraged {}for 5 hands',
            [4] = 'While {C:attention}Enraged{}, apply a {C:attention}Rage {}Seal to scored cards',
            [5] = 'Noise Meter {C:attention}incrementing {}is paused during {C:attention}Enragement{}',
            [6] = '{C:inactive}(Stay silent.{} {C:attention}#4#{}{C:inactive}){}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:green,s:0.8}Di{}{C:common,s:0.8}e o{}{C:dark_edition,s:0.8}f D{}{C:money,s:0.8}ea{}{C:red,s:0.8}th{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.noise, card.ability.extra.enraged, card.ability.extra.ragehands, card.ability.extra.hush}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big((card.ability.extra.enraged or 0)) == to_big(0) then
                card.ability.extra.noise = (card.ability.extra.noise) + 1
            elseif to_big((card.ability.extra.noise or 0)) >= to_big(25) then
                card.ability.extra.enraged = 1
                card.ability.extra.noise = 1
                card.ability.extra.hush = 'AGITATED'
            elseif to_big((card.ability.extra.enraged or 0)) == to_big(1) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("sauce_", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.enraged or 0)) == to_big(1) then
                card.ability.extra.ragehands = (card.ability.extra.ragehands) + 1
            elseif to_big((card.ability.extra.ragehands or 0)) == to_big(5) then
                card.ability.extra.enraged = 1
                card.ability.extra.hush = 'calm..'
            end
        end
    end
}