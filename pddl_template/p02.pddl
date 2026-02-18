(define (problem p2-dungeon)
  (:domain Dungeon)

  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-2)
    (arm-free)

    ; Location <> Corridor Connections (BOTH directions)
    (connects c2122 loc-2-1 loc-2-2)
    (connects c2122 loc-2-2 loc-2-1)

    (connects c1222 loc-1-2 loc-2-2)
    (connects c1222 loc-2-2 loc-1-2)

    (connects c2232 loc-2-2 loc-3-2)
    (connects c2232 loc-3-2 loc-2-2)

    (connects c3242 loc-3-2 loc-4-2)
    (connects c3242 loc-4-2 loc-3-2)

    (connects c2223 loc-2-2 loc-2-3)
    (connects c2223 loc-2-3 loc-2-2)

    ; Touches - Location touches a corridor
    (touches c2122 loc-2-1) (touches c2122 loc-2-2)
    (touches c1222 loc-1-2) (touches c1222 loc-2-2)
    (touches c2232 loc-2-2) (touches c2232 loc-3-2)
    (touches c3242 loc-3-2) (touches c3242 loc-4-2)
    (touches c2223 loc-2-2) (touches c2223 loc-2-3)

    ; Key locations
    (key-at key1 loc-2-1)
    (key-at key2 loc-1-2)
    (key-at key3 loc-2-2)
    (key-at key4 loc-2-3)

    ; Locked corridors
    (locked c2122) (lock-colour c2122 purple)
    (locked c1222) (lock-colour c1222 yellow)
    (locked c2232) (lock-colour c2232 yellow)
    (locked c3242) (lock-colour c3242 rainbow)
    (locked c2223) (lock-colour c2223 green)

    ; Risky corridors
    ; No red locks, so no risky corridors

    ; Key colours
    (key-colour key1 green)
    (key-colour key2 rainbow)
    (key-colour key3 purple)
    (key-colour key4 yellow)

    ; Key usage properties (one use, two use, etc)
    (one-use key2)
    (two-use key4)
    (one-use key1)
    (one-use key3)

    (usable key1)
    (usable key2)
    (usable key3)
    (usable key4)

  )

  (:goal
    (and
      (hero-at loc-4-2)
    )
  )

)
