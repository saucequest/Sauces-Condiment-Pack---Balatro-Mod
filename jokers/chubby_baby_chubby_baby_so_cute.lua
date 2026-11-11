
SMODS.Joker{ --Chubby Baby, Chubby Baby So Cute
    key = "chubby_baby_chubby_baby_so_cute",
    config = {
        extra = {
            joker_slots0 = 2,
            joker_slots = 2,
            xmult0 = 0.8
        }
    },
    loc_txt = {
        ['name'] = 'Chubby Baby, Chubby Baby So Cute',
        ['text'] = {
            [1] = 'This is a {C:money}yellow {}pufferfish. It is {C:green}poisonous{}. So here\'s {C:blue}fishing {}tips.',
            [2] = 'Don\'t hold it with your {C:red}bare hands{}, otherwise you would get {C:green}poisoned{}.',
            [3] = 'So let\'s send it to the {C:blue}sea {}to live {C:diamonds}happily{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = "sauce_trash",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(2).." Joker Slot", colour = G.C.RED})
                    G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 2)
                    return true
                end
            }
        end
        if context.selling_self  then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Joker Slot", colour = G.C.DARK_EDITION})
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 2
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 0.8
            }
        end
    end
}