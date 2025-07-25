SMODS.Joker{ --FLOWERS
    name = "FLOWERS",
    key = "flowers",
    config = {
        extra = {
            echips = 99,
            dollars = 999,
            sell_value = 99
        }
    },
    loc_txt = {
        ['name'] = 'FLOWERS',
        ['text'] = {
            [1] = 'HEAR THE WHISTLE? COVER THE EARS!',
            [2] = '{C:inactive}Originates from{} {C:dark_edition}The Whistle Occurrence{}'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    cost = 55,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    message = "HEAR THE WHISTLE?",
                    extra = {
                        e_chips = card.ability.extra.echips,
                            message = "COVER THE EARS!",
                        colour = G.C.DARK_EDITION
                        }
                }
        end
        if context.starting_shop and not context.blueprint then
                return {
                    func = function()
                    local target_amount = card.ability.extra.dollars
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(card.ability.extra.dollars), colour = G.C.MONEY})
                    return true
                end,
                    extra = {
                        func = function()
            card.ability.extra_value = card.ability.extra.sell_value
            card:set_cost()
                    return true
                end,
                            message = "Sell Value: $"..tostring(card.ability.extra.sell_value),
                        colour = G.C.MONEY
                        }
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - 99
        SMODS.change_free_rerolls(99)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + 99
        SMODS.change_free_rerolls(-99)
    end
}


local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_sauce_flowers")) then
        if (self.ability.set == 'Joker' or self.ability.set == 'Tarot' or self.ability.set == 'Planet' or self.ability.set == 'Spectral' or self.ability.set == 'Enhanced' or self.ability.set == 'Booster' or self.ability.set == 'Voucher') then self.cost = math.max(0, math.floor(self.cost * (1 - 80 / 100))) end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end