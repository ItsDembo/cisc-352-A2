(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
        :equality
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates
        ; given
        (hero-at ?loc - location)

        ; map / connectivity
        (connects ?cor - corridor ?a - location ?b - location)
        (touches ?cor - corridor ?loc - location)

        ; corridor state
        (locked ?cor - corridor)
        (lock-colour ?cor - corridor ?col - colour)
        (risky ?cor - corridor)
        (collapsed ?cor - corridor)

        ; room state
        (messy ?loc - location)

        ; keys & inventory
        (key-at ?k - key ?loc - location)
        (holding ?k - key)
        (arm-free)

        ; key attributes & durability
        (key-colour ?k - key ?col - colour)
        (usable ?k - key)
        (one-use ?k - key)
        (two-use ?k - key)
        (multi-use ?k - key)
        (used-once ?k - key)
    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    (:action move
        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and
            (hero-at ?from)
            (connects ?cor ?from ?to)
            (not (locked ?cor))
            (not (collapsed ?cor))
        )

        :effect (and
            (not (hero-at ?from))
            (hero-at ?to)

            (when (risky ?cor)
                (and
                    (collapsed ?cor)
                    (messy ?to)
                )
            )
        )
    )

    (:action pick-up
        :parameters (?loc - location ?k - key)

        :precondition (and
            (hero-at ?loc)
            (key-at ?k ?loc)
            (arm-free)
            (not (messy ?loc))
        )

        :effect (and
            (holding ?k)
            (not (arm-free))
            (not (key-at ?k ?loc))
        )
    )

    (:action drop
        :parameters (?loc - location ?k - key)

        :precondition (and
            (hero-at ?loc)
            (holding ?k)
        )

        :effect (and
            (not (holding ?k))
            (arm-free)
            (key-at ?k ?loc)
        )
    )

    (:action unlock
        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and
            (hero-at ?loc)
            (touches ?cor ?loc)

            (locked ?cor)
            (lock-colour ?cor ?col)

            (holding ?k)
            (key-colour ?k ?col)
            (usable ?k)
        )

        :effect (and
            (not (locked ?cor))

            ; one-use: after unlocking once, no longer usable
            (when (one-use ?k)
                (not (usable ?k))
            )

            ; two-use: first time -> mark used-once (still usable)
            (when (and (two-use ?k) (not (used-once ?k)))
                (used-once ?k)
            )

            ; two-use: second time -> no longer usable
            (when (and (two-use ?k) (used-once ?k))
                (not (usable ?k))
            )

            ; multi-use: no change needed
        )
    )

    (:action clean
        :parameters (?loc - location)

        :precondition (and
            (hero-at ?loc)
            (messy ?loc)
        )

        :effect (and
            (not (messy ?loc))
        )
    )

)
