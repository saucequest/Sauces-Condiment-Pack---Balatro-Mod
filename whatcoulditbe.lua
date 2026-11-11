
SMODS.Joker{ --What Could it Be?
    key = "whatcoulditbe",
    config = {
        extra = {
            queensneeded = 6,
            mult0 = -2,
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'What Could it Be?',
        ['text'] = {
            [1] = 'Scored {C:attention}Queens {}lose {C:red}-2{} Mult',
            [2] = 'After #1# {C:attention}Queens {}have been',
            [3] = 'played, give {X:mult,C:white}X2{} Mult when',
            [4] = 'the next {C:attention}Queen {}is scored and',
            [5] = '{C:red}destroy {}the scored card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 43
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true, ["sauce_sinisterminds"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.queensneeded}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card:get_id() == 12 and to_big((card.ability.extra.queensneeded or 0)) > to_big(0)) then
                card.ability.extra.queensneeded = math.max(0, (card.ability.extra.queensneeded) - 1)
                return {
                    mult = -2
                }
            elseif (context.other_card:get_id() == 12 and to_big((card.ability.extra.queensneeded or 0)) == to_big(0)) then
                context.other_card.should_destroy = true
                card.ability.extra.queensneeded = 6
                return {
                    Xmult = 2,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}