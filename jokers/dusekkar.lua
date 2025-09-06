SMODS.Joker{ --Dusekkar
    key = "dusekkar",
    config = {
        extra = {
            levels = 1,
            levels2 = 1,
            levels3 = 1,
            levels4 = 1,
            levels5 = 1,
            levels6 = 1,
            levels7 = 1,
            levels8 = 1,
            levels9 = 1,
            levels10 = 1,
            levels11 = 1,
            levels12 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Dusekkar',
        ['text'] = {
            [1] = 'When a {C:spectral}Spectral{} is used, level up all hands'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Spectral' then
                target_hand = "High Card"
                target_hand2 = "Pair"
                target_hand3 = "Two Pair"
                target_hand4 = "Three of a Kind"
                target_hand5 = "Straight"
                target_hand6 = "Flush"
                target_hand7 = "Full House"
                target_hand8 = "Four of a Kind"
                target_hand9 = "Five of a Kind"
                target_hand10 = "Straight Flush"
                target_hand11 = "Flush House"
                target_hand12 = "Flush Five"
                return {
                    level_up = card.ability.extra.levels,
      level_up_hand = target_hand,
                    message = localize('k_level_up_ex'),
                    extra = {
                        level_up = card.ability.extra.levels2,
      level_up_hand = target_hand2,
                            message = localize('k_level_up_ex'),
                        colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels3,
      level_up_hand = target_hand3,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels4,
      level_up_hand = target_hand4,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels5,
      level_up_hand = target_hand5,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels6,
      level_up_hand = target_hand6,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels7,
      level_up_hand = target_hand7,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels8,
      level_up_hand = target_hand8,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels9,
      level_up_hand = target_hand9,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels10,
      level_up_hand = target_hand10,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels11,
      level_up_hand = target_hand11,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels12,
      level_up_hand = target_hand12,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                }
            end
        end
    end
}