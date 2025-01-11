-- Decks
susDeck = SMODS.Back{
    key = 'susDeck',
    loc_txt = {
        name = 'Suspicious Deck',
        text = {
            'Start run with {C:attention}52{}',
            '{C:sus}Sus{} cards in deck'
        }
    },

    atlas = 'DecksA',
    pos = {x = 0, y = 0},

    apply = function ()
        
        G.E_MANAGER:add_event(Event({

            func = function ()
                
                -- Remove all cards in deck
                -- while #G.playing_cards ~= 0 do                    
                --     G.playing_cards[1]:remove()
                -- end

                for _, card in ipairs(G.playing_cards) do
                    if card.base.suit ~= sus_suit.key then
                        assert(SMODS.change_base(card, sus_suit.key))
                    end
                end

                -- local _card = SMODS.create_card({
                --     set = 'Base',
                --     skip_materialize = true,
                -- })

                return true
            end
        }))

    end
}

-- -- Full Deck: 52 + 16 Sus cards
-- fullDeck = SMODS.Back{
--     key = 'fullDeck',
--     loc_txt = {
--         name = 'Full Deck',
--         text = {
--             'The deck is looking',
--             'a bit {C:sus}Sus{}'
--         }
--     },

--     atlas = 'DecksA',
--     pos = {x = 1, y = 0},

--     apply = function ()
        
--         G.E_MANAGER:add_event(Event({

--             func = function ()
                
                

--                 return true
--             end
--         }))

--     end
-- }