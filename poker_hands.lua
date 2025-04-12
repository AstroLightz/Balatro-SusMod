-- POKER HANDS
-- Sussy Flushy (Flush)

base_sus_flush = SMODS.PokerHand{
    key = 'Sus_Flush',
    chips = 35,
    mult = 5,
    l_chips = 15,
    l_mult = 2,
    example = {
        { 'susMod_SUS_A', true },
        { 'susMod_SUS_K', true },
        { 'susMod_SUS_T', true },
        { 'susMod_SUS_5', true },
        { 'susMod_SUS_4', true }
    },

    loc_txt = {
        name = 'Sussy Flushy',
        description = {
            'Five cards of any rank',
            'all from the Sus suit'
        }
    },

    visible = false,

    evaluate = function(parts, hand)
        
        -- Check if all cards played are sus suit
        local flush_count = 0
        for i=1, #hand do
            if hand[i]:is_suit(SUS_SUIT.key) then
                flush_count = flush_count + 1
            end
        end

        if flush_count == 5 and next(parts._flush) then
            return { hand }
        else
            return {}
        end

    end
}

-- Straight Sussy Flush (Straight Flush)

str_sus_flush = SMODS.PokerHand{
    key = 'Straight_Sus_Flush',
    chips = 100,
    mult = 9,
    l_chips = 40,
    l_mult = 4,
    example = {
        { 'susMod_SUS_Q', true },
        { 'susMod_SUS_J', true },
        { 'susMod_SUS_T', true },
        { 'susMod_SUS_9', true },
        { 'susMod_SUS_8', true }
    },

    loc_txt = {
        name = 'Straight Sussy Flushy',
        description = {
            'Five cards in consecutive order',
            'all from the Sus suit'
        }
    },

    visible = false,

    evaluate = function(parts, hand)
        
        -- Check if all cards played are sus suit
        local flush_count = 0
        for i=1, #hand do
            if hand[i]:is_suit(SUS_SUIT.key) then
                flush_count = flush_count + 1
            end
        end

        if flush_count == 5 and next(parts._flush) and next(parts._straight) then
            return { hand }
        else
            return {}
        end

    end
}

-- Sussy Flushy House (Flush House)

sus_flush_house = SMODS.PokerHand{
    key = 'Sus_Flush_House',
    chips = 140,
    mult = 15,
    l_chips = 40,
    l_mult = 4,
    example = {
        { 'susMod_SUS_7', true },
        { 'susMod_SUS_7', true },
        { 'susMod_SUS_7', true },
        { 'susMod_SUS_4', true },
        { 'susMod_SUS_4', true }
    },

    loc_txt = {
        name = 'Sussy Flushy House',
        description = {
            'A Three of a Kind and a Pair with',
            'all cards sharing the Sus suit',
        }
    },

    visible = false,

    evaluate = function(parts, hand)
        
        -- Check if all cards played are sus suit
        local flush_count = 0
        for i=1, #hand do
            if hand[i]:is_suit(SUS_SUIT.key) then
                flush_count = flush_count + 1
            end
        end

        if flush_count == 5 and next(parts._3) and (#parts._2 == 2) then
            return { hand }
        else
            return {}
        end

    end
}

-- Ultra Sus (Flush Five)

sus_flush_five = SMODS.PokerHand{
    key = 'Sus_Flush_Five',
    chips = 160,
    mult = 17,
    l_chips = 50,
    l_mult = 3,
    example = {
        { 'susMod_SUS_A', true },
        { 'susMod_SUS_A', true },
        { 'susMod_SUS_A', true },
        { 'susMod_SUS_A', true },
        { 'susMod_SUS_A', true }
    },

    loc_txt = {
        name = 'Ultra Sus',
        description = {
            '5 Sus cards with the same rank,',
        }
    },

    visible = false,

    evaluate = function(parts, hand)
        
        -- Check if all cards played are sus suit
        local flush_count = 0
        for i=1, #hand do
            if hand[i]:is_suit(SUS_SUIT.key) then
                flush_count = flush_count + 1
            end
        end

        if flush_count == 5 and next(parts._flush) and next(parts._5) then
            return { hand }
        else
            return {}
        end

    end
}

-- Pair of Sus (Pair)
sus_pair = SMODS.PokerHand{
    key = 'Sus_Pair',
    chips = 10,
    mult = 3,
    l_chips = 15,
    l_mult = 1,
    example = {
        { 'S_K', false },
        { 'susMod_SUS_9', true },
        { 'susMod_SUS_9', true },
        { 'H_6', false },
        { 'D_3', false }
    },

    loc_txt = {
        name = 'Pair of Sus',
        description = {
            '2 Sus cards that share the same rank. They may',
            'be played with up to 3 other unscored cards',
        }
    },

    visible = false,

    evaluate = function(parts, hand)

        -- Check for pair and if pair is Sus suit
        if next(parts._2) then
            local sus_pair = false
            
            local pair = parts._2[1]
            local pair_c1 = pair[1]
            local pair_c2 = pair[2]

            if pair_c1:is_suit(SUS_SUIT.key) and pair_c2:is_suit(SUS_SUIT.key) then
                sus_pair = true
            end
            
            if sus_pair then
                return { SMODS.merge_lists(parts._2) }
            else
                return {}
            end
        end
    end
}

-- Two Pairs of Sus (Two Pair)

sus_two_pair = SMODS.PokerHand{
    key = 'Double_Sus_Pair',
    chips = 20,
    mult = 3,
    l_chips = 20,
    l_mult = 2,
    example = {
        { 'susMod_SUS_A', true },
        { 'susMod_SUS_A', true },
        { 'C_Q', false },
        { 'susMod_SUS_4', true },
        { 'susMod_SUS_4', true }
    },

    loc_txt = {
        name = 'Two Pairs of Sus',
        description = {
            '2 pairs of Sus cards with different ranks, may',
            'be played with 1 other unscored card',
        }
    },

    visible = false,

    evaluate = function(parts, hand)
        
        -- Check for pair and if pair is Sus suit
        if (#parts._2 == 2) or (#parts._3 == 1 and #parts._2 == 1) then
            local two_sus_pair = 0

            for i=1, #parts._2 do
                for j=1, #parts._2[i] do
                    if parts._2[i][j]:is_suit(SUS_SUIT.key) then
                        two_sus_pair = two_sus_pair + 1
                    end
                end
            end
            
            if two_sus_pair == 4 then
                return { SMODS.merge_lists(parts._all_pairs) }
            else
                return {}
            end
        end
    end
}

-- Triple Sus (Three of a Kind)

triple_sus = SMODS.PokerHand{
    key = 'Triple_Sus',
    chips = 30,
    mult = 4,
    l_chips = 20,
    l_mult = 2,
    example = {
        { 'susMod_SUS_T', true },
        { 'susMod_SUS_T', true },
        { 'susMod_SUS_T', true },
        { 'H_6', false },
        { 'D_5', false }
    },

    loc_txt = {
        name = 'Triple Sus',
        description = {
            '3 Sus cards with the same rank. They may be',
            'played with up to 2 other unscored cards',
        }
    },

    visible = false,

    evaluate = function(parts, hand)
        
        -- Check if all cards played are sus suit
        if next(parts._3) then
            local sus_count = 0

            for i=1, #parts._3[1] do
                if parts._3[1][i]:is_suit(SUS_SUIT.key) then
                    sus_count = sus_count + 1
                end
            end

            if sus_count == 3 then
                return { SMODS.merge_lists(parts._3) }
            else
                return {}
            end
        end
    end
}

-- Quadruple Sus (Four of a Kind)

quadruple_sus = SMODS.PokerHand{
    key = 'Quadruple_Sus',
    chips = 60,
    mult = 8,
    l_chips = 100,
    l_mult = 8,
    example = {
        { 'susMod_SUS_J', true },
        { 'susMod_SUS_J', true },
        { 'susMod_SUS_J', true },
        { 'susMod_SUS_J', true },
        { 'D_3', false }
    },

    loc_txt = {
        name = 'Quadruple Sus',
        description = {
            '4 Sus cards with the same rank. They may',
            'be played with 1 other unscored card',
        }
    },

    visible = false,

    evaluate = function(parts, hand)
        
        if next(parts._4) then
            local sus_count = 0

            for i=1, #parts._4[1] do
                if parts._4[1][i]:is_suit(SUS_SUIT.key) then
                    sus_count = sus_count + 1
                end
            end

            if sus_count == 4 then
                return { SMODS.merge_lists(parts._3) }
            else
                return {}
            end
        end
    end
}