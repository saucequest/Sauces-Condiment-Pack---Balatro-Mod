
SMODS.Joker{ --Eight-Handled Sword Divergent Sila Divine General Mahoraga
    key = "mahoraga",
    config = {
        extra = {
            flushdamage = 25,
            housedamage = 25,
            gaydamage = 25,
            mommyraga = 300,
            yeahyourecookedbro = 50
        }
    },
    loc_txt = {
        ['name'] = 'Eight-Handled Sword Divergent Sila Divine General Mahoraga',
        ['text'] = {
            [1] = 'Play {C:attention}Flushes, Straights, and Full Houses{}',
            [2] = 'to damage Mahoraga by 25 health',
            [3] = 'Scored cards will be {C:red}destroyed {}by Mahoraga and deal',
            [4] = '{C:red}3 damage{} to you',
            [5] = 'Mahoraga will {C:attention}adapt {}to hands and {C:attention}divide {}the damage',
            [6] = 'dealt by said hands by 1.4',
            [7] = '{C:red}Mahoraga HP: #4#{}',
            [8] = '{C:red}Player HP: #5#{}',
            [9] = '{C:red}Good luck.{}',
            [10] = '{C:inactive,s:0.8}\"The ability to adapt to any and all phenomena\".{}',
            [11] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 48
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'jud' 
            or args.source == 'buf' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.flushdamage, card.ability.extra.housedamage, card.ability.extra.gaydamage, card.ability.extra.mommyraga, card.ability.extra.yeahyourecookedbro}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Straight" then
                local gaydamage_value = card.ability.extra.gaydamage
                card.ability.extra.mommyraga = math.max(0, (card.ability.extra.mommyraga) - card.ability.extra.gaydamage)
                card.ability.extra.gaydamage = (card.ability.extra.gaydamage) / 1.4
            elseif context.scoring_name == "Flush" then
                local flushdamage_value = card.ability.extra.flushdamage
                card.ability.extra.mommyraga = math.max(0, (card.ability.extra.mommyraga) - card.ability.extra.flushdamage)
                card.ability.extra.flushdamage = (card.ability.extra.flushdamage) / 1.4
            elseif context.scoring_name == "Full House" then
                card.ability.extra.mommyraga = math.max(0, (card.ability.extra.mommyraga) - card.ability.extra.housedamage)
                card.ability.extra.flushdamage = (card.ability.extra.flushdamage) / 1.4
            end
        end
        if context.individual and context.cardarea == G.play  then
            card.ability.extra.yeahyourecookedbro = math.max(0, (card.ability.extra.yeahyourecookedbro) - 3)
        end
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            if to_big((card.ability.extra.yeahyourecookedbro or 0)) == to_big(0) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif to_big((card.ability.extra.mommyraga or 0)) == to_big(0) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}