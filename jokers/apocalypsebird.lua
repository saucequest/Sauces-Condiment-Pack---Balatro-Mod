
SMODS.Joker{ --Apocalypse Bird
    key = "apocalypsebird",
    config = {
        extra = {
            operator = 1,
            emult0 = 1.15,
            pb_x_mult_e1d6fb78 = 10,
            hypermult_n0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Apocalypse Bird',
        ['text'] = {
            [1] = 'When {C:attention}Judgement{} is used, create a {C:rare}Rare{} Joker',
            [2] = 'Marks the {C:attention}first {}scoring card with a {C:attention}Red{} Seal',
            [3] = 'Played {C:attention}Red{} Seals get {C:red}destroyed {}and then give {C:dark_edition}^1.15{} Mult',
            [4] = 'Played 2s, 3s, 4s and 5s gain a {C:attention}permanent{} {X:mult,C:white}X10{} Mult',
            [5] = 'Scored {C:attention}face {}cards get {C:red}destroyed {}and give {X:black,C:red}(#1#)1.5{} Mult',
            [6] = 'Whenever a face card is {C:attention}destroyed{}, add an {C:attention}operator {}to {X:black,C:red}HyperMult{}',
            [7] = '{C:inactive,s:0.8}\"Then, in the middle of all the chaotic cries, someone shouted: {}',
            [8] = '{C:inactive,s:0.8}\'It\'s the beast! A big, scary monster lives in the black, dusky forest!\'\"{}',
            [9] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}Lobotomy {}{C:attention,s:0.8}Corporation{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_judgement"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_judgement\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.operator}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  and not context.blueprint then
            if context.consumeable and context.consumeable.ability.set == 'Tarot' and context.consumeable.config.center.key == 'c_judgement' then
                return {
                    func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                                    if joker_card then
                                        
                                        
                                    end
                                    G.GAME.joker_buffer = 0
                                    return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card == context.scoring_hand[1] and not (context.other_card.seal == "Red")) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Red", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif context.other_card.seal == "Red" then
                context.other_card.should_destroy = true
                return {
                    e_mult = 1.15,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            elseif (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 5) then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + 10
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            elseif context.other_card:is_face() then
                context.other_card.should_destroy = true
                card.ability.extra.operator = (card.ability.extra.operator) + 1
                return {
                    message = "Destroyed!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_birdup")
                    
                    return true
                end,
            }))
            return {
                hypermult = {
                    card.ability.extra.operator,
                    1.5
                }
            }
        end
    end
}