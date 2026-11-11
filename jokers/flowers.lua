
SMODS.Joker{ --Flowers
    key = "flowers",
    config = {
        extra = {
            discount_amount_min = '0',
            discount_amount_max = '80',
            debt_amount_min = '0',
            debt_amount_max = '99',
            dollars0_min = NaN,
            dollars0_max = 999,
            emult0_min = NaN,
            emult0_max = 99
        }
    },
    loc_txt = {
        ['name'] = 'Flowers',
        ['text'] = {
            [1] = '{C:attention}All{} items in shop will be at a {C:money}1-80%{} discount',
            [2] = 'Allows you to go {C:money}$1-99{} in {C:attention}debt{}',
            [3] = 'Sets your money to {C:money}$10-999{} when shop {C:attention}entered{}',
            [4] = 'Gives {C:dark_edition,s:5}^0.1-99{}{} Chips',
            [5] = '{C:inactive}This does not count as a Roblox Joker for balancing.{}',
            [6] = '{C:inactive,s:0.8}\"HEAR THE WHISTLE? COVER THE EARS!\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:dark_edition,s:0.8}The Whistle Occurrence{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "sauce_unnatural",
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
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
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = pseudorandom('RANGE:10|999', 10, 999)
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(pseudorandom('RANGE:10|999', 10, 999)), colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = pseudorandom('RANGE:0.1|99', 0.1, 99)
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
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - pseudorandom('RANGE:1|99', 1, 99)
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
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + pseudorandom('RANGE:1|99', 1, 99)
    end
}


local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_sauce_flowers")) then
        if (self.ability.set == 'Joker' or self.ability.set == 'Tarot' or self.ability.set == 'Planet' or self.ability.set == 'Spectral' or self.ability.set == 'Enhanced' or self.ability.set == 'Booster' or self.ability.set == 'Voucher') then
            self.cost = math.max(0, math.floor(self.cost * (1 - (pseudorandom('RANGE:1|80', 1, 80)) / 100)))
        end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end