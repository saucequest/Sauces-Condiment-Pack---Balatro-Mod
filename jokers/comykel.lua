
SMODS.Joker{ --comykel
    key = "comykel",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'comykel',
        ['text'] = {
            [1] = 'Played cards without {C:attention}seals {}will be given a {C:attention}seal{}',
            [2] = '{C:inactive,s:0.8}(Art by comykel){}',
            [3] = '{C:inactive,s:0.8}https://x.com/komykel{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 5,
        y = 6
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not (context.other_card.seal ~= nil) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                        if random_seal then
                            scored_card:set_seal(random_seal, true)
                        end
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}