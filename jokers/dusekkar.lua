
SMODS.Joker{ --Dusekkar
    key = "dusekkar",
    config = {
        extra = {
            levels0 = 1,
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
            levels11 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Dusekkar',
        ['text'] = {
            [1] = 'When a {C:spectral}Spectral{} is used, level up {C:attention}all {}hands',
            [2] = '{C:inactive,s:0.8}\"Destiny\'s powerful hand has made the bed of my future, and it\'s up to me to lie in it.\"{}',
            [3] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 32
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Spectral' then
                local target_hand = "High Card"
                level_up_hand(card, target_hand, true, 1)
                local target_hand2 = "Pair"
                level_up_hand(card, target_hand2, true, 1)
                local target_hand3 = "Two Pair"
                level_up_hand(card, target_hand3, true, 1)
                local target_hand4 = "Three of a Kind"
                level_up_hand(card, target_hand4, true, 1)
                local target_hand5 = "Straight"
                level_up_hand(card, target_hand5, true, 1)
                local target_hand6 = "Flush"
                level_up_hand(card, target_hand6, true, 1)
                local target_hand7 = "Full House"
                level_up_hand(card, target_hand7, true, 1)
                local target_hand8 = "Four of a Kind"
                level_up_hand(card, target_hand8, true, 1)
                local target_hand9 = "Five of a Kind"
                level_up_hand(card, target_hand9, true, 1)
                local target_hand10 = "Straight Flush"
                level_up_hand(card, target_hand10, true, 1)
                local target_hand11 = "Flush House"
                level_up_hand(card, target_hand11, true, 1)
                local target_hand12 = "Flush Five"
                level_up_hand(card, target_hand12, true, 1)
                return {
                    message = localize('k_level_up_ex'),
                    extra = {
                        message = localize('k_level_up_ex'),
                        colour = G.C.RED,
                        extra = {
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                            extra = {
                                message = localize('k_level_up_ex'),
                                colour = G.C.RED,
                                extra = {
                                    message = localize('k_level_up_ex'),
                                    colour = G.C.RED,
                                    extra = {
                                        message = localize('k_level_up_ex'),
                                        colour = G.C.RED,
                                        extra = {
                                            message = localize('k_level_up_ex'),
                                            colour = G.C.RED,
                                            extra = {
                                                message = localize('k_level_up_ex'),
                                                colour = G.C.RED,
                                                extra = {
                                                    message = localize('k_level_up_ex'),
                                                    colour = G.C.RED,
                                                    extra = {
                                                        message = localize('k_level_up_ex'),
                                                        colour = G.C.RED,
                                                        extra = {
                                                            message = localize('k_level_up_ex'),
                                                            colour = G.C.RED,
                                                            extra = {
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