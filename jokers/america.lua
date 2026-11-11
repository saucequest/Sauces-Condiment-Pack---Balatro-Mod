
SMODS.Joker{ --america
    key = "america",
    config = {
        extra = {
            chips0 = 1000
        }
    },
    loc_txt = {
        ['name'] = 'america',
        ['text'] = {
            [1] = '{C:attention}Lastmost{} scoring {C:attention}face{} card will',
            [2] = 'be {C:red}destroyed{} and give {C:blue}+1000{} Chips',
            [3] = '{C:red}When this Joker is triggered, destroy self{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 37
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_gun"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (function()
                for i = #context.scoring_hand, 1, -1 do
                    local scoring_card = context.scoring_hand[i]
                    if scoring_card:is_face() then
                        return scoring_card == context.other_card
                    end
                end
                return false
            end)() then
                context.other_card.should_destroy = true
                local target_joker = card
                
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
                    chips = 1000,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}