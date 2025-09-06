SMODS.Joker{ --Kendrick Lamar
    key = "kendricklamar",
    config = {
        extra = {
            Xmult = 1.2,
            Xmult2 = 1.2,
            Xmult3 = 1.4,
            Xmult4 = 1.2,
            Xmult5 = 1.2,
            Xmult6 = 1.2,
            Xmult7 = 1.2,
            Xmult8 = 1.6,
            Xmult9 = 1.2,
            Xmult10 = 1.2,
            Xmult11 = 1.2,
            Xmult12 = 1.2,
            Xmult13 = 2,
            Xmult14 = 1.2,
            Xmult15 = 1.4,
            Xmult16 = 1.6,
            Xmult17 = 1.2,
            Xmult18 = 1.4,
            Xmult19 = 1.2,
            Xmult20 = 1.2,
            Xmult21 = 1.4,
            Xmult22 = 1.6,
            Xmult23 = 1.2,
            Xmult24 = 1.4,
            Xmult25 = 1.4,
            Xmult26 = 2,
            Xmult27 = 1.2,
            Xmult28 = 1.2,
            Xmult29 = 1.4,
            Xmult30 = 1.4,
            Xmult31 = 1.8,
            Xmult32 = 1.2,
            Xmult33 = 1.2,
            Xmult34 = 1.4,
            Xmult35 = 1.6,
            Xmult36 = 1.8,
            Xmult37 = 1.2,
            Xmult38 = 1.2,
            Xmult39 = 1.8,
            Xmult40 = 2,
            Xmult41 = 1.4,
            Xmult42 = 2,
            Xmult43 = 1.4,
            Xmult44 = 1.2,
            Xmult45 = 1.2,
            Xmult46 = 1.4,
            Xmult47 = 1.2,
            Xmult48 = 1.8,
            Xmult49 = 1.2,
            Xmult50 = 1.4,
            Xmult51 = 1.4,
            Xmult52 = 1.2,
            Xmult53 = 1.2,
            Xmult54 = 1.4,
            Xmult55 = 1.6,
            Xmult56 = 1.2,
            Xmult57 = 1.2,
            Xmult58 = 1.2,
            Xmult59 = 1.4,
            Xmult60 = 1.4,
            Xmult61 = 1.4,
            Xmult62 = 1.8,
            Xmult63 = 1.4
        }
    },
    loc_txt = {
        ['name'] = 'Kendrick Lamar',
        ['text'] = {
            [1] = '{C:red,s:3}!CURRENTLY UNFINISHED!{}{}',
            [2] = 'When Joker is evaluated, give {X:mult,C:white}XMult {} based on',
            [3] = 'how much {C:money}yellow {}or {C:attention}orange {}text the Joker contains',
            [4] = '{C:inactive}(Only works for Base Game Jokers){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.other_joker  then
            if (function()
        return context.other_joker.config.center.key == "j_8_ball"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_abstract"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult2
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_acrobat"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult3
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_ancient"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult4
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_astronomer"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult5
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_banner"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult6
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_baron"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult7
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_blackboard"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult8
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_blue_joker"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult9
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_blueprint"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult10
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_bootstraps"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult11
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_brainstorm"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult12
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_burglar"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult13
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_burnt"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult14
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_business"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult15
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_campfire"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult16
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_caino"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult17
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_card_sharp"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult18
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_cartomancer"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult19
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_castle"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult20
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_ceremonial"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult21
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_certificate"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult22
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_chaos"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult23
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_chicot"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult24
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_clever"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult25
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_cloud_9"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult26
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_crafty"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult27
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_crazy"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult28
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_delayed_grat"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult29
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_diet_cola"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult30
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_dna"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult31
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_drivers_license"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult32
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_droll"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult33
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_dusk"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult34
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_egg"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult35
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_erosion"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult36
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_even_steven"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult37
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_even_steven"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult38
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_faceless"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult39
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_fibonacci"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult40
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_four_fingers"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult41
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_gift"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult42
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_glass"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult43
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_golden"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult44
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_golden_ticket"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult45
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_golden_ticket"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult46
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_greedy_joker"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult47
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_hack"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult48
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_half"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult49
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_hallucination"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult50
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_hanging_chad"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult51
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_hiker"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult52
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_hit_the_road"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult53
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_hologram"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult54
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_invisible"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult55
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_stencil"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult56
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_jolly"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult57
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_loyalty_card"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult58
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_luchador"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult59
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_luchador"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult60
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_mad"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult61
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_madness"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult62
                }
            elseif (function()
        return context.other_joker.config.center.key == "j_mail"
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult63
                }
            end
        end
    end
}