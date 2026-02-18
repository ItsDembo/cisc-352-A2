(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-2)
    (arm-free)

    ; Locationg <> Corridor Connections
    (connects c3132 loc-3-1 loc-3-2)
    (connects c3132 loc-3-2 loc-3-1)

    (connects c1222 loc-1-2 loc-2-2)
    (connects c1222 loc-2-2 loc-1-2)

    (connects c2232 loc-2-2 loc-3-2)
    (connects c2232 loc-3-2 loc-2-2)

    (connects c3242 loc-3-2 loc-4-2)
    (connects c3242 loc-4-2 loc-3-2)

    (connects c2223 loc-2-2 loc-2-3)
    (connects c2223 loc-2-3 loc-2-2)

    (connects c3233 loc-3-2 loc-3-3)
    (connects c3233 loc-3-3 loc-3-2)

    (connects c2333 loc-2-3 loc-3-3)
    (connects c2333 loc-3-3 loc-2-3)

    (connects c2324 loc-2-3 loc-2-4)
    (connects c2324 loc-2-4 loc-2-3)

    (connects c3334 loc-3-3 loc-3-4)
    (connects c3334 loc-3-4 loc-3-3)

    (connects c2434 loc-2-4 loc-3-4)
    (connects c2434 loc-3-4 loc-2-4)

    (connects c3444 loc-3-4 loc-4-4)
    (connects c3444 loc-4-4 loc-3-4)

    ; Touches - Location touches a corridor
    (touches c3132 loc-3-1) (touches c3132 loc-3-2)
    (touches c1222 loc-1-2) (touches c1222 loc-2-2)
    (touches c2232 loc-2-2) (touches c2232 loc-3-2)
    (touches c3242 loc-3-2) (touches c3242 loc-4-2)
    (touches c2223 loc-2-2) (touches c2223 loc-2-3)
    (touches c3233 loc-3-2) (touches c3233 loc-3-3)
    (touches c2333 loc-2-3) (touches c2333 loc-3-3)
    (touches c2324 loc-2-3) (touches c2324 loc-2-4)
    (touches c3334 loc-3-3) (touches c3334 loc-3-4)
    (touches c2434 loc-2-4) (touches c2434 loc-3-4)
    (touches c3444 loc-3-4) (touches c3444 loc-4-4)

    ; Key locations
    (key-at key1 loc-2-2)
    (key-at key2 loc-2-4)
    (key-at key3 loc-4-2)
    (key-at key4 loc-4-4)

    ; Locked corridors
    (locked c2324) (lock-colour c2324 red)
    (locked c2434) (lock-colour c2434 red)
    (locked c3242) (lock-colour c3242 purple)
    (locked c3444) (lock-colour c3444 yellow)
    (locked c3132) (lock-colour c3132 rainbow)

    ; Risky corridors
    (risky c2324)
    (risky c2434)

    ; Key colours
    (key-colour key1 red)
    (key-colour key2 yellow)
    (key-colour key3 rainbow)
    (key-colour key4 purple)

    ; Key usage properties (one use, two use, etc)
    (multi-use key1)
    (two-use key2)
    (one-use key3)
    (one-use key4)

    (usable key1)
    (usable key2)
    (usable key3)
    (usable key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-3-1)
    )
  )

)
