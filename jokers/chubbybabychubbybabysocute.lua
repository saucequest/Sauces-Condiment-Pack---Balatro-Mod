SMODS.Joker{ --Chubby Baby, Chubby Baby So Cute
    key = "chubbybabychubbybabysocute",
    config = {
        extra = {
            joker_slots = 2,
            joker_slots2 = 2
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
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.joker_slots).." Joker Slot", colour = G.C.RED})
                G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - card.ability.extra.joker_slots)
                return true
            end
                }
        end
        if context.selling_self  then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.joker_slots2).." Joker Slot", colour = G.C.DARK_EDITION})
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots2
                return true
            end
                }
        end
    end
}