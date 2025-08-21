SMODS.Joker{ --Flowers
    key = "flowers",
    config = {
        extra = {
            discount_amount_min = 1,
            discount_amount_max = 80,
            reroll_amount = 1,
            debt_amount = 1,
            dollars_min = 10,
            dollars_max = 999,
            emult_min = 0.1,
            emult_max = 99
        }
    },
    loc_txt = {
        ['name'] = 'Flowers',
        ['text'] = {
            [1] = 'All items in shop will be at a {C:money}1-80%{} discount',
            [2] = 'Allows you to go {C:money}$1-99{} in debt',
            [3] = 'Sets your money to {C:money}$10-999{} when shop entered',
            [4] = 'Gives {C:dark_edition,s:5}^0.1-99{}{} Chips',
            [5] = '{C:inactive}\"HEAR THE WHISTLE? COVER THE EARS!\"{}',
            [6] = '{C:inactive}Originates from{} {C:dark_edition}The Whistle Occurrence{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    cost = 0,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.starting_shop  then
                return {
                    func = function()
                    local target_amount = pseudorandom('dollars_58033213', card.ability.extra.dollars_min, card.ability.extra.dollars_max)
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(pseudorandom('dollars_58033213', card.ability.extra.dollars_min, card.ability.extra.dollars_max)), colour = G.C.MONEY})
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = pseudorandom('emult_3e5e333d', card.ability.extra.emult_min, card.ability.extra.emult_max)
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
        SMODS.change_free_rerolls(card.ability.extra.reroll_amount)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - (card.ability.extra.debt_amount)
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
        SMODS.change_free_rerolls(-(card.ability.extra.reroll_amount))
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + (card.ability.extra.debt_amount)
    end
}


local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_sauce_flowers")) then
        if (self.ability.set == 'Joker' or self.ability.set == 'Tarot' or self.ability.set == 'Planet' or self.ability.set == 'Spectral' or self.ability.set == 'Enhanced' or self.ability.set == 'Booster' or self.ability.set == 'Voucher') then
            self.cost = math.max(0, math.floor(self.cost * (1 - (pseudorandom('discount_amount_5a50fed5', card.ability.extra.discount_amount_min, card.ability.extra.discount_amount_max)) / 100)))
        end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end