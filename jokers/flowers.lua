SMODS.Joker{ --FLOWERS
    key = "flowers",
    config = {
        extra = {
            discount_amount = 80,
            debt_amount = 99,
            reroll_amount = 99,
            echips = 99,
            dollars = 999,
            sell_value = 99
        }
    },
    loc_txt = {
        ['name'] = 'FLOWERS',
        ['text'] = {
            [1] = 'All items in shop will be at a {C:money}80%{} discount',
            [2] = 'Allows you to go {C:money}$99{} in debt',
            [3] = 'Gives you {C:uncommon}99 {}free rerolls',
            [4] = 'Sets your money to {C:money}$999{}',
            [5] = 'Gives {C:dark_edition,s:5}^99{}{} Chips',
            [6] = '{C:inactive}\"HEAR THE WHISTLE? COVER THE EARS!\"{}',
            [7] = '{C:inactive}Originates from{} {C:dark_edition}The Whistle Occurrence{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 55,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    message = "HEAR THE WHISTLE?",
                    extra = {
                        e_chips = card.ability.extra.echips,
                            message = "COVER THE EARS!",
                        colour = G.C.DARK_EDITION
                        }
                }
        end
        if context.starting_shop  then
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
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - (card.ability.extra.debt_amount)
        SMODS.change_free_rerolls(card.ability.extra.reroll_amount)
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
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + (card.ability.extra.debt_amount)
        SMODS.change_free_rerolls(-(card.ability.extra.reroll_amount))
    end
}


local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_sauce_flowers")) then
        if (self.ability.set == 'Joker' or self.ability.set == 'Tarot' or self.ability.set == 'Planet' or self.ability.set == 'Spectral' or self.ability.set == 'Enhanced' or self.ability.set == 'Booster' or self.ability.set == 'Voucher') then self.cost = math.max(0, math.floor(self.cost * (1 - (card.ability.extra.discount_amount) / 100))) end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end