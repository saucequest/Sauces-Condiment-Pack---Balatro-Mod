
SMODS.Joker{ --DOUG: A DougDoug Story
    key = "dougadougdougstory",
    config = {
        extra = {
            dougsmultofdougness = 4
        }
    },
    loc_txt = {
        ['name'] = 'DOUG: A DougDoug Story',
        ['text'] = {
            [1] = 'Whenever a {C:attention}Jack {}is played, increase',
            [2] = '{C:red}+Mult{} by 6',
            [3] = 'If played {C:attention}rank {}is not {C:attention}Jack{}, reset {C:red}+Mult{}',
            [4] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.dougsmultofdougness}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:get_id() == 11 then
                card.ability.extra.dougsmultofdougness = (card.ability.extra.dougsmultofdougness) + 6
            elseif not (context.other_card:get_id() == 11) then
                card.ability.extra.dougsmultofdougness = 4
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.dougsmultofdougness
            }
        end
    end
}