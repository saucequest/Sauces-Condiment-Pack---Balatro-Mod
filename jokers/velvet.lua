
SMODS.Joker{ --Velvet
    key = "velvet",
    config = {
        extra = {
            xmultvar = 1,
            tarotsused = 0,
            activity = 'Inactive'
        }
    },
    loc_txt = {
        ['name'] = 'Velvet',
        ['text'] = {
            [1] = 'Gains {X:mult,C:white}X0.1{} Mult when a {C:attention}non face card{} scores',
            [2] = 'Lowers by {X:mult,C:white}X0.2{} Mult when a {C:attention}face card{} scores',
            [3] = 'After {C:tarot}5{} Tarots have been used, become {C:attention}energized{}',
            [4] = 'When {C:attention}energized {}and a card is {C:attention}destroyed{}, multiply current {X:mult,C:white}xMult{} by {X:mult,C:white}X1.5{}',
            [5] = '{C:inactive}(Becomes unenergized at end of round){}',
            [6] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}',
            [7] = '{C:inactive}({}{C:tarot}#2#{} {C:inactive}Tarots Used){}',
            [8] = '{C:inactive}(#3#){}',
            [9] = '{C:inactive,s:0.8}(Effect and art by gleuonvelvet){}',
            [10] = '{C:inactive,s:0.8}https://gluonvelvet.neocities.org/{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 26
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmultvar, card.ability.extra.tarotsused, card.ability.extra.activity}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if not (context.other_card:is_face()) then
                card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + 0.1
            elseif not (context.other_card:is_face()) then
                card.ability.extra.xmultvar = math.max(0, (card.ability.extra.xmultvar) - 0.2)
            end
        end
        if context.using_consumeable  and not context.blueprint then
            if (context.consumeable and context.consumeable.ability.set == 'Tarot' and to_big((card.ability.extra.tarotsused or 0)) < to_big(5)) then
                card.ability.extra.activity = 'Active'
                return {
                    func = function()
                        card.ability.extra.tarotsused = (card.ability.extra.tarotsused) + 1
                        return true
                    end
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if to_big((card.ability.extra.tarotsused or 0)) == to_big(5) then
                card.ability.extra.activity = 'Inactive'
                return {
                    func = function()
                        card.ability.extra.tarotsused = 1
                        return true
                    end
                }
            end
        end
        if context.remove_playing_cards  and not context.blueprint then
            if to_big((card.ability.extra.tarotsused or 0)) == to_big(5) then
                return {
                    func = function()
                        card.ability.extra.xmultvar = (card.ability.extra.xmultvar) * 1.5
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmultvar
            }
        end
    end
}