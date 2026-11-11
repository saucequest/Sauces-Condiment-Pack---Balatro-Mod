
SMODS.Joker{ --Skinwalker
    key = "skinwalker",
    config = {
        extra = {
            firsthand = 'true'
        }
    },
    loc_txt = {
        ['name'] = 'Skinwalker',
        ['text'] = {
            [1] = 'The {C:attention}lastmost{} scored card of {C:attention}first hand{} of round',
            [2] = 'will be put into description{C:inactive} (#2#){}',
            [3] = 'When a card with the {C:attention}logged{} {C:attention}rank{} is scored,',
            [4] = 'make it a {C:attention}Jack{} with a {C:attention}Purple{} Seal',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}NU{}{C:tarot,s:0.8}LL{}{C:dark_edition,s:0.8}SC{}{C:red,s:0.8}APE{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 37
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_gracescape"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.firsthand, localize((G.GAME.current_round.itsrightbehindmeisntit_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.itsrightbehindmeisntit_card = { rank = '2', id = 2 }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[#context.scoring_hand] or card.ability.extra.firsthand == 'true') then
                G.GAME.current_round.itsrightbehindmeisntit_card.rank = context.other_card.base.id
            elseif context.other_card:get_id() == 14 then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "Jack"))
                        scored_card:set_seal("Purple", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
        if context.after and context.cardarea == G.jokers  then
            card.ability.extra.firsthand = 'false'
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            card.ability.extra.firsthand = 'true'
        end
    end
}