-- Sussy Joker
SMODS.Joker{
    key = 'sussy',
    loc_txt = {
        name = 'Sussy Joker',
        text = {
            'Played cards with',
            '{C:sus}Sus{} suit give',
            '{C:mult}+#1#{} Mult when scored',
        }
    },
        
    atlas = 'JokersA',
    pos = {x = 0, y = 0},

    config = { extra = {
            s_mult = 3,
            suit = SUS_SUIT.key,
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.s_mult, 
            center.ability.extra.suit,
        }}
    end,

    rarity = 1,
    cost = 5,

    unlocked = true,
    discovered = false,

    blueprint_compat = true,

    calculate = function(self, card, context)
        
        -- Recreation of vanilla Suit Mult jokers
        if context.individual and
        context.cardarea == G.play and
        context.other_card:is_suit(SUS_SUIT.key) then
            
            return {
                mult = card.ability.extra.s_mult,
                card = card
            }

        end

    end
}

-- Sus Guy
SMODS.Joker{
    key = 'sus_guy',
    loc_txt = {
        name = 'The Sus Guy',
        text = {
            '{X:mult,C:white}X#1#{} Mult if {C:attention}played hand{}',
            'contains a {C:sus}Sus{} card. {X:mult,C:white}X#2#{} Mult',
            'if played hand is a {C:sus}Sus poker hand{}',
            '{C:green}#3# in #4#{} chance all non-{C:sus}Sus{}',
            'cards played are {C:attention}converted{}',
            '{s:0.8,X:mult,C:white}Xmult{s:0.8,C:inactive} does not stack'
        }
    },

    atlas = 'JokersA',
    pos = {x = 1, y = 0},

    config = { extra = {
        sus_mult = 2,
        sus_poker_mult = 3,
        odds = 4,
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.sus_mult,
            center.ability.extra.sus_poker_mult,
            G.GAME and G.GAME.probabilities.normal or 1,
            center.ability.extra.odds
        }}
    end,

    rarity = 3,
    cost = 8,

    unlocked = true,
    discovered = false,

    blueprint_compat = false,

    calculate = function(self, card, context)
        
        -- All mod poker hands
        local sus_poker_hands = {
            base_sus_flush.key,
            str_sus_flush.key,
            sus_flush_house.key,
            sus_flush_five.key,
            sus_pair.key,
            sus_two_pair.key,
            triple_sus.key,
            quadruple_sus.key
        }

        local sus_poker = false

        -- Check if played poker hand is a sus hand (Any of the mod's poker hands)
        if context.cardarea == G.jokers and context.joker_main and not context.blueprint then
            
            for _, hand in ipairs(sus_poker_hands) do

                if next(context.poker_hands[hand]) then
                    sus_poker = true

                    return {
                        message = 'X'..card.ability.extra.sus_poker_mult,
                        Xmult_mod = card.ability.extra.sus_poker_mult,
                        card = card
                    }
                end

            end

            if not sus_poker then
                
                -- Check if played hand contains a sus card
                for _, sCard in ipairs(context.scoring_hand) do
                    if sCard:is_suit(SUS_SUIT.key) then
                        return {
                            message = 'X'..card.ability.extra.sus_mult,
                            Xmult_mod = card.ability.extra.sus_mult,
                            card = card
                        }
                    end
                end

            end

        end

        if context.cardarea == G.jokers and context.after and not context.blueprint then
            
            -- Run odds for destroying cards
            local roll = pseudorandom('susguy')

            if roll < G.GAME.probabilities.normal/card.ability.extra.odds then
                
                G.E_MANAGER:add_event(Event({

                    func = function()

                        -- Convert all non-Sus cards played to Sus cards
                        for _, card in ipairs(context.scoring_hand) do
                            
                            if not card:is_suit(SUS_SUIT.key) then
                                assert(SMODS.change_base(card, SUS_SUIT.key))
                            end

                        end

                        return true
                    end

                }))

                return {
                    message = 'Imposter!',
                    colour = G.C.SUSSY,
                    card = card
                }

            end

        end

    end
}