
SMODS.Joker{ --Pochita, the Hero of Hell
    key = "pochitatheheroofhell",
    config = {
        extra = {
            hypermult_n0 = 999999999,
            hypermult_arrows0 = 99999999
        }
    },
    loc_txt = {
        ['name'] = 'Pochita, the Hero of Hell',
        ['text'] = {
            [1] = 'If the selected {C:attention}rank {}{C:inactive}(#1#) {}is scored,',
            [2] = '{C:red}destroy {}scored card, change rank selected,',
            [3] = 'and win the {C:attention}Blind{}',
            [4] = '{C:inactive,s:0.8}\"VANCE!\"{}',
            [5] = '{C:inactive,s:0.8}Originates from {}{C:attention,s:0.8}Chainsaw{} {s:0.8}Man{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 51
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_unnatural",
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
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.vance_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.vance_card = { rank = 'King', id = 13 }
    end,
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            if G.playing_cards then
                local valid_vance_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_vance_cards[#valid_vance_cards + 1] = v
                    end
                end
                if valid_vance_cards[1] then
                    local vance_card = pseudorandom_element(valid_vance_cards, pseudoseed('vance' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.vance_card.rank = vance_card.base.value
                    G.GAME.current_round.vance_card.id = vance_card.base.id
                end
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:get_id() == 14 then
                context.other_card.should_destroy = true
                if G.playing_cards then
                    local valid_vance_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_rank(v) then
                            valid_vance_cards[#valid_vance_cards + 1] = v
                        end
                    end
                    if valid_vance_cards[1] then
                        local vance_card = pseudorandom_element(valid_vance_cards, pseudoseed('vance' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.vance_card.rank = vance_card.base.value
                        G.GAME.current_round.vance_card.id = vance_card.base.id
                    end
                end
                return {
                    hypermult = {
                        99999999,
                        999999999
                    },
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}