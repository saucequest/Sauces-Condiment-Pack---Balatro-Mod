
SMODS.Joker{ --Lets take a look...
    key = "letstakealook",
    config = {
        extra = {
            money÷5 = 0,
            tarotcardsused = 0
        }
    },
    loc_txt = {
        ['name'] = 'Lets take a look...',
        ['text'] = {
            [1] = 'If {C:money}money {}divided by {C:attention}5{} is the same as how',
            [2] = 'many {C:purple}Tarots {}used this {C:attention}run {}when',
            [3] = '{C:attention}Booster Pack {}opened, redeem a {C:attention}voucher{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(math.floor(lenient_bignum(G.GAME.dollars / 5)) or 0), ((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0) or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.open_booster  then
            if to_big(math.floor(lenient_bignum(G.GAME.dollars / 5))) == to_big((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)) then
                local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "b9f24354").key
                local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
                voucher_card:start_materialize()
                voucher_card.cost = 0
                G.play:emplace(voucher_card)
                delay(0.8)
                voucher_card:redeem()
                
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        voucher_card:start_dissolve()                
                        return true
                    end
                }))
                return {
                    message = nil
                }
            end
        end
    end
}