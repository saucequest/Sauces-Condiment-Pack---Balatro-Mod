
SMODS.Joker{ --Fear
    key = "fear",
    config = {
        extra = {
            fearful = 0,
            destroyedheld = 0
        }
    },
    loc_txt = {
        ['name'] = 'Fear',
        ['text'] = {
            [1] = 'The {C:attention}last {}scored card will gain',
            [2] = 'a {C:attention}Purple{} Seal',
            [3] = 'If a {C:red}red {}suit {C:attention}Face {}card is',
            [4] = 'played, {C:red}destroy {}the first',
            [5] = '3 {C:attention}held {}in hand cards',
            [6] = '{C:inactive,s:0.8}\"A-All I did... ...was try to save you...\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}Block Tales{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 35
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sin"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.fearful, card.ability.extra.destroyedheld}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Purple", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif (context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") and context.other_card:is_face()) then
                card.ability.extra.fearful = 1
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            context.other_card.should_destroy = false
            if to_big((card.ability.extra.fearful or 0)) == to_big(1) then
                context.other_card.should_destroy = true
                return {
                    func = function()
                        card.ability.extra.destroyedheld = (card.ability.extra.destroyedheld) + 1
                        return true
                    end,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            elseif to_big((card.ability.extra.destroyedheld or 0)) == to_big(3) then
                return {
                    func = function()
                        card.ability.extra.fearful = 1
                        return true
                    end
                }
            end
        end
    end
}