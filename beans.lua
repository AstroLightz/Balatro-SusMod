-- Red Bean: Sussy Flushy
SMODS.Consumable{
    key = 'Bean_red',
    set = 'Bean',
    loc_txt = {
        name = 'Red Bean',
        text = {
            '({V:1}lvl.#1#{}) Level up',
            '{C:attention}#2#{}',
            '{C:mult}+#3#{} Mult and',
            '{C:chips}+#4#{} chips',
        }
    },

    config = { extra = {
        hand_lvl = 0,
        hand_name = 'Sussy Flushy',
        mult = 0,
        chips = 0
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.hand_lvl,
            center.ability.extra.hand_name,
            center.ability.extra.mult,
            center.ability.extra.chips,
            colours = {
                (
                    center.ability.extra.hand_lvl==1 and
                    G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, center.ability.extra.hand_lvl)]
                )
            }
        }}
    end,

    atlas = 'BeansA',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    update = function(self, card, dt)

        local hand_type = base_sus_flush

        local _hand = G.GAME.hands[hand_type.key]

        card.ability.extra.hand_lvl = _hand.level
        card.ability.extra.mult = _hand.l_mult
        card.ability.extra.chips = _hand.l_chips
    end,

    use = function(self, card, area, copier)

        local hand_type = base_sus_flush

        local _hand = G.GAME.hands[hand_type.key]
        local used_consumable = copier or card

        -- Display hand upgrade text
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            {
                handname = card.ability.extra.hand_name,
                chips = _hand.chips,
                mult = _hand.mult,
                level = _hand.level
            }
        )

        -- Level up hand
        level_up_hand(used_consumable, hand_type.key, false, 1)

        -- Reset hand text
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}

-- Blue Bean: Straight Sussy Flushy
SMODS.Consumable{
    key = 'Bean_blue',
    set = 'Bean',
    loc_txt = {
        name = 'Blue Bean',
        text = {
            '({V:1}lvl.#1#{}) Level up',
            '{C:attention}#2#{}',
            '{C:mult}+#3#{} Mult and',
            '{C:chips}+#4#{} chips',
        }
    },

    config = { extra = {
        hand_lvl = 0,
        hand_name = 'Straight Sussy Flushy',
        mult = 0,
        chips = 0
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.hand_lvl,
            center.ability.extra.hand_name,
            center.ability.extra.mult,
            center.ability.extra.chips,
            colours = {
                (
                    center.ability.extra.hand_lvl==1 and
                    G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, center.ability.extra.hand_lvl)]
                )
            }
        }}
    end,

    atlas = 'BeansA',
    pos = { x = 1, y = 0 },
    unlocked = true,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    update = function(self, card, dt)
        
        local hand_type = str_sus_flush

        local _hand = G.GAME.hands[hand_type.key]

        card.ability.extra.hand_lvl = _hand.level
        card.ability.extra.mult = _hand.l_mult
        card.ability.extra.chips = _hand.l_chips
    end,

    use = function(self, card, area, copier)

        local hand_type = str_sus_flush

        local _hand = G.GAME.hands[hand_type.key]
        local used_consumable = copier or card

        -- Display hand upgrade text
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            {
                handname = card.ability.extra.hand_name,
                chips = _hand.chips,
                mult = _hand.mult,
                level = _hand.level
            }
        )

        -- Level up hand
        level_up_hand(used_consumable, hand_type.key, false, 1)

        -- Reset hand text
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}

-- Green Bean: Ultra Sus
SMODS.Consumable{
    key = 'Bean_green',
    set = 'Bean',
    loc_txt = {
        name = 'Green Bean',
        text = {
            '({V:1}lvl.#1#{}) Level up',
            '{C:attention}#2#{}',
            '{C:mult}+#3#{} Mult and',
            '{C:chips}+#4#{} chips',
        }
    },

    config = { extra = {
        hand_lvl = 0,
        hand_name = 'Ultra Sus',
        mult = 0,
        chips = 0
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.hand_lvl,
            center.ability.extra.hand_name,
            center.ability.extra.mult,
            center.ability.extra.chips,
            colours = {
                (
                    center.ability.extra.hand_lvl==1 and
                    G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, center.ability.extra.hand_lvl)]
                )
            }
        }}
    end,

    atlas = 'BeansA',
    pos = { x = 2, y = 0 },
    unlocked = true,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    update = function(self, card, dt)
        
        local hand_type = sus_flush_five

        local _hand = G.GAME.hands[hand_type.key]

        card.ability.extra.hand_lvl = _hand.level
        card.ability.extra.mult = _hand.l_mult
        card.ability.extra.chips = _hand.l_chips
    end,

    use = function(self, card, area, copier)

        local hand_type = sus_flush_five

        local _hand = G.GAME.hands[hand_type.key]
        local used_consumable = copier or card

        -- Display hand upgrade text
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            {
                handname = card.ability.extra.hand_name,
                chips = _hand.chips,
                mult = _hand.mult,
                level = _hand.level
            }
        )

        -- Level up hand
        level_up_hand(used_consumable, hand_type.key, false, 1)

        -- Reset hand text
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}

-- Pink Bean: Sussy Flushy House
SMODS.Consumable{
    key = 'Bean_pink',
    set = 'Bean',
    loc_txt = {
        name = 'Pink Bean',
        text = {
            '({V:1}lvl.#1#{}) Level up',
            '{C:attention}#2#{}',
            '{C:mult}+#3#{} Mult and',
            '{C:chips}+#4#{} chips',
        }
    },

    config = { extra = {
        hand_lvl = 0,
        hand_name = 'Sussy Flushy House',
        mult = 0,
        chips = 0
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.hand_lvl,
            center.ability.extra.hand_name,
            center.ability.extra.mult,
            center.ability.extra.chips,
            colours = {
                (
                    center.ability.extra.hand_lvl==1 and
                    G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, center.ability.extra.hand_lvl)]
                )
            }
        }}
    end,

    atlas = 'BeansA',
    pos = { x = 3, y = 0 },
    unlocked = true,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    update = function(self, card, dt)
        
        local hand_type = sus_flush_house

        local _hand = G.GAME.hands[hand_type.key]

        card.ability.extra.hand_lvl = _hand.level
        card.ability.extra.mult = _hand.l_mult
        card.ability.extra.chips = _hand.l_chips
    end,

    use = function(self, card, area, copier)

        local hand_type = sus_flush_house

        local _hand = G.GAME.hands[hand_type.key]
        local used_consumable = copier or card

        -- Display hand upgrade text
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            {
                handname = card.ability.extra.hand_name,
                chips = _hand.chips,
                mult = _hand.mult,
                level = _hand.level
            }
        )

        -- Level up hand
        level_up_hand(used_consumable, hand_type.key, false, 1)

        -- Reset hand text
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}

-- Orange Bean: Pair of Sus
SMODS.Consumable{
    key = 'Bean_orange',
    set = 'Bean',
    loc_txt = {
        name = 'Orange Bean',
        text = {
            '({V:1}lvl.#1#{}) Level up',
            '{C:attention}#2#{}',
            '{C:mult}+#3#{} Mult and',
            '{C:chips}+#4#{} chips',
        }
    },

    config = { extra = {
        hand_lvl = 0,
        hand_name = 'Pair of Sus',
        mult = 0,
        chips = 0
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.hand_lvl,
            center.ability.extra.hand_name,
            center.ability.extra.mult,
            center.ability.extra.chips,
            colours = {
                (
                    center.ability.extra.hand_lvl==1 and
                    G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, center.ability.extra.hand_lvl)]
                )
            }
        }}
    end,

    atlas = 'BeansA',
    pos = { x = 4, y = 0 },
    unlocked = true,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    update = function(self, card, dt)
        
        local hand_type = sus_pair

        local _hand = G.GAME.hands[hand_type.key]

        card.ability.extra.hand_lvl = _hand.level
        card.ability.extra.mult = _hand.l_mult
        card.ability.extra.chips = _hand.l_chips
    end,

    use = function(self, card, area, copier)

        local hand_type = sus_pair

        local _hand = G.GAME.hands[hand_type.key]
        local used_consumable = copier or card

        -- Display hand upgrade text
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            {
                handname = card.ability.extra.hand_name,
                chips = _hand.chips,
                mult = _hand.mult,
                level = _hand.level
            }
        )

        -- Level up hand
        level_up_hand(used_consumable, hand_type.key, false, 1)

        -- Reset hand text
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}

-- Yellow Bean: Two Pairs of Sus
SMODS.Consumable{
    key = 'Bean_yellow',
    set = 'Bean',
    loc_txt = {
        name = 'Yellow Bean',
        text = {
            '({V:1}lvl.#1#{}) Level up',
            '{C:attention}#2#{}',
            '{C:mult}+#3#{} Mult and',
            '{C:chips}+#4#{} chips',
        }
    },

    config = { extra = {
        hand_lvl = 0,
        hand_name = 'Two Pairs of Sus',
        mult = 0,
        chips = 0
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.hand_lvl,
            center.ability.extra.hand_name,
            center.ability.extra.mult,
            center.ability.extra.chips,
            colours = {
                (
                    center.ability.extra.hand_lvl==1 and
                    G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, center.ability.extra.hand_lvl)]
                )
            }
        }}
    end,

    atlas = 'BeansA',
    pos = { x = 5, y = 0 },
    unlocked = true,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    update = function(self, card, dt)
        
        local hand_type = sus_two_pair

        local _hand = G.GAME.hands[hand_type.key]

        card.ability.extra.hand_lvl = _hand.level
        card.ability.extra.mult = _hand.l_mult
        card.ability.extra.chips = _hand.l_chips
    end,

    use = function(self, card, area, copier)

        local hand_type = sus_two_pair

        local _hand = G.GAME.hands[hand_type.key]
        local used_consumable = copier or card

        -- Display hand upgrade text
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            {
                handname = card.ability.extra.hand_name,
                chips = _hand.chips,
                mult = _hand.mult,
                level = _hand.level
            }
        )

        -- Level up hand
        level_up_hand(used_consumable, hand_type.key, false, 1)

        -- Reset hand text
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}

-- Black Bean: Triple Sus
SMODS.Consumable{
    key = 'Bean_black',
    set = 'Bean',
    loc_txt = {
        name = 'Black Bean',
        text = {
            '({V:1}lvl.#1#{}) Level up',
            '{C:attention}#2#{}',
            '{C:mult}+#3#{} Mult and',
            '{C:chips}+#4#{} chips',
        }
    },

    config = { extra = {
        hand_lvl = 0,
        hand_name = 'Triple Sus',
        mult = 0,
        chips = 0
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.hand_lvl,
            center.ability.extra.hand_name,
            center.ability.extra.mult,
            center.ability.extra.chips,
            colours = {
                (
                    center.ability.extra.hand_lvl==1 and
                    G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, center.ability.extra.hand_lvl)]
                )
            }
        }}
    end,

    atlas = 'BeansA',
    pos = { x = 6, y = 0 },
    unlocked = true,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    update = function(self, card, dt)
        
        local hand_type = triple_sus

        local _hand = G.GAME.hands[hand_type.key]

        card.ability.extra.hand_lvl = _hand.level
        card.ability.extra.mult = _hand.l_mult
        card.ability.extra.chips = _hand.l_chips
    end,

    use = function(self, card, area, copier)

        local hand_type = triple_sus

        local _hand = G.GAME.hands[hand_type.key]
        local used_consumable = copier or card

        -- Display hand upgrade text
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            {
                handname = card.ability.extra.hand_name,
                chips = _hand.chips,
                mult = _hand.mult,
                level = _hand.level
            }
        )

        -- Level up hand
        level_up_hand(used_consumable, hand_type.key, false, 1)

        -- Reset hand text
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}

-- White Bean: Quadruple Sus
SMODS.Consumable{
    key = 'Bean_white',
    set = 'Bean',
    loc_txt = {
        name = 'White Bean',
        text = {
            '({V:1}lvl.#1#{}) Level up',
            '{C:attention}#2#{}',
            '{C:mult}+#3#{} Mult and',
            '{C:chips}+#4#{} chips',
        }
    },

    config = { extra = {
        hand_lvl = 0,
        hand_name = 'Quadruple Sus',
        mult = 0,
        chips = 0
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.hand_lvl,
            center.ability.extra.hand_name,
            center.ability.extra.mult,
            center.ability.extra.chips,
            colours = {
                (
                    center.ability.extra.hand_lvl==1 and
                    G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, center.ability.extra.hand_lvl)]
                )
            }
        }}
    end,

    atlas = 'BeansA',
    pos = { x = 7, y = 0 },
    unlocked = true,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    update = function(self, card, dt)
        
        local hand_type = quadruple_sus

        local _hand = G.GAME.hands[hand_type.key]

        card.ability.extra.hand_lvl = _hand.level
        card.ability.extra.mult = _hand.l_mult
        card.ability.extra.chips = _hand.l_chips
    end,

    use = function(self, card, area, copier)

        local hand_type = quadruple_sus

        local _hand = G.GAME.hands[hand_type.key]
        local used_consumable = copier or card

        -- Display hand upgrade text
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            {
                handname = card.ability.extra.hand_name,
                chips = _hand.chips,
                mult = _hand.mult,
                level = _hand.level
            }
        )

        -- Level up hand
        level_up_hand(used_consumable, hand_type.key, false, 1)

        -- Reset hand text
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}