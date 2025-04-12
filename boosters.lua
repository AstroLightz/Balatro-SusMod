-- Bean Packs
-- Normal
SMODS.Booster{
    key = 'beanPack_normal',
    loc_txt = {
        name = 'Bean Pack',
        group_name = 'Bean Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:bean}Bean{} cards to',
            'add to your deck',
        }
    },

    config = {
        choose = 1,
        extra = 3
    },

    atlas = 'PacksA',
    pos = { x = 0, y = 0 },

    discovered = false,
    weight = 0.8,
    cost = 5,
    kind = 'Bean',

    ease_background_colour = function(self)
        ease_background_colour{new_colour = G.C.BLACK, contrast = 2}
    end,

    create_card = function(self, card, i)
        local _card = SMODS.create_card({
            set = 'Bean',
            area = G.pack_cards,
            skip_materialize = true
        })

        return _card
    end,

    get_weight = function(self)
        return G.GAME.bean_rate * self.weight
    end
}

-- Jumbo
SMODS.Booster{
    key = 'beanPack_jumbo',
    loc_txt = {
        name = 'Jumbo Bean Pack',
        group_name = 'Bean Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:bean}Bean{} cards to',
            'add to your deck',
        }
    },

    config = {
        choose = 1,
        extra = 5
    },

    atlas = 'PacksA',
    pos = { x = 1, y = 0 },

    discovered = false,
    weight = 0.6,
    cost = 7,
    kind = 'Bean',

    ease_background_colour = function(self)
        ease_background_colour{new_colour = G.C.BLACK, contrast = 2}
    end,

    create_card = function(self, card, i)
        local _card = SMODS.create_card({
            set = 'Bean',
            area = G.pack_cards,
            skip_materialize = true
        })

        return _card
    end
}

-- Mega
SMODS.Booster{
    key = 'beanPack_mega',
    loc_txt = {
        name = 'Mega Bean Pack',
        group_name = 'Bean Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:bean}Bean{} cards to',
            'add to your deck',
        }
    },

    config = {
        choose = 2,
        extra = 5
    },

    atlas = 'PacksA',
    pos = { x = 2, y = 0 },

    discovered = false,
    weight = 0.4,
    cost = 9,
    kind = 'Bean',

    ease_background_colour = function(self)
        ease_background_colour{new_colour = G.C.BLACK, contrast = 2}
    end,

    create_card = function(self, card, i)
        local _card = SMODS.create_card({
            set = 'Bean',
            area = G.pack_cards,
            skip_materialize = true
        })

        return _card
    end
}



-- Sussy Packs
-- Normal
SMODS.Booster{
    key = 'sussyPack_normal',
    loc_txt = {
        name = 'Sussy Pack',
        group_name = 'Sussy Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{C:sus} Sus{} cards to',
            'add to your deck',
        }
    },

    config = {
        choose = 1,
        extra = 3
    },

    atlas = 'PacksA',
    pos = { x = 0, y = 1 },

    discovered = false,
    weight = 0.5,
    cost = 5,
    kind = 'Sussy',

    ease_background_colour = function(self)
        ease_background_colour{new_colour = G.C.SUSSY, contrast = 2}
    end,

    create_card = function(self, card, i)
        local _card = SMODS.create_card({
            set = (pseudorandom(pseudoseed('stdset'..G.GAME.round_resets.ante)) > 0.6) and "Enhanced" or "Base",
            area = G.pack_cards,
            skip_materialize = true
        })

        assert(SMODS.change_base(_card, SUS_SUIT.key))

        return _card
    end
}

-- Jumbo
SMODS.Booster{
    key = 'sussyPack_jumbo',
    loc_txt = {
        name = 'Jumbo Sussy Pack',
        group_name = 'Sussy Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{C:sus} Sus{} cards to',
            'add to your deck',
        }
    },

    config = {
        choose = 1,
        extra = 5
    },

    atlas = 'PacksA',
    pos = { x = 1, y = 1 },

    discovered = false,
    weight = 0.5,
    cost = 7,
    kind = 'Sussy',

    ease_background_colour = function(self)
        ease_background_colour{new_colour = G.C.SUSSY, contrast = 2}
    end,

    create_card = function(self, card, i)
        local _card = SMODS.create_card({
            set = (pseudorandom(pseudoseed('stdset'..G.GAME.round_resets.ante)) > 0.6) and "Enhanced" or "Base",
            area = G.pack_cards,
            skip_materialize = true
        })

        assert(SMODS.change_base(_card, SUS_SUIT.key))

        return _card
    end
}

-- Mega
SMODS.Booster{
    key = 'sussyPack_mega',
    loc_txt = {
        name = 'Mega Sussy Pack',
        group_name = 'Sussy Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{C:sus} Sus{} cards to',
            'add to your deck',
        }
    },

    config = {
        choose = 2,
        extra = 5
    },

    atlas = 'PacksA',
    pos = { x = 2, y = 1 },

    discovered = false,
    weight = 0.25,
    cost = 9,
    kind = 'Sussy',

    ease_background_colour = function(self)
        ease_background_colour{new_colour = G.C.SUSSY, contrast = 2}
    end,

    create_card = function(self, card, i)
        local _card = SMODS.create_card({
            set = (pseudorandom(pseudoseed('stdset'..G.GAME.round_resets.ante)) > 0.6) and "Enhanced" or "Base",
            area = G.pack_cards,
            skip_materialize = true
        })

        assert(SMODS.change_base(_card, SUS_SUIT.key))

        return _card
    end
}