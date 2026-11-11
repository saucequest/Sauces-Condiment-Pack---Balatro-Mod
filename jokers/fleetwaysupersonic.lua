
SMODS.Joker{ --Fleetway Super Sonic
    key = "fleetwaysupersonic",
    config = {
        extra = {
            repetitions0 = 1,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Fleetway Super Sonic',
        ['text'] = {
            [1] = 'If played hand is a {C:red}Red Suit {}{C:attention}Flush{},',
            [2] = '{C:attention}retrigger {}all cards, {C:red}destroy {}scored',
            [3] = '{C:attention}face {}cards, and give remaining cards',
            [4] = 'a {C:money}Yellow {}Seal',
            [5] = '{C:inactive,s:0.8}\"The cute blue hedgehog is gone - now you\'re against {}',
            [6] = '{C:inactive,s:0.8}Super Sonic! And it ain\'t gonna be pretty.\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 43
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)() and not (context.other_card:is_face())) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("sauce_yellowseal", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            elseif ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)() and context.other_card:is_face()) then
                context.other_card.should_destroy = true
                return {
                    repetitions = 1,
                    message = localize('k_again_ex'),
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}