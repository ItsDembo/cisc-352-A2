(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-2)
    (handfree)

    ; Location <> Corridor Connections
    (adjacent loc-2-1 loc-2-2 c2122)
    (adjacent loc-2-2 loc-2-1 c2122)
    (adjacent loc-1-2 loc-2-2 c1222)
    (adjacent loc-2-2 loc-1-2 c1222)
    (adjacent loc-2-2 loc-3-2 c2232)
    (adjacent loc-3-2 loc-2-2 c2232)
    (adjacent loc-3-2 loc-4-2 c3242)
    (adjacent loc-4-2 loc-3-2 c3242)
    (adjacent loc-2-2 loc-2-3 c2223)
    (adjacent loc-2-3 loc-2-2 c2223)

    (touches loc-2-1 c2122)
    (touches loc-2-2 c2122)
    (touches loc-1-2 c1222)
    (touches loc-2-2 c1222)
    (touches loc-2-2 c2232)
    (touches loc-3-2 c2232)
    (touches loc-3-2 c3242)
    (touches loc-4-2 c3242)
    (touches loc-2-2 c2223)
    (touches loc-2-3 c2223)

    ; Key locations
    (key-at key1 loc-2-1)
    (key-at key2 loc-1-2)
    (key-at key3 loc-2-2)
    (key-at key4 loc-2-3)

    ; Locked corridors
    (locked c2122)
    (lock-colour c2122 purple)
    (locked c1222)
    (lock-colour c1222 yellow)
    (locked c2232)
    (lock-colour c2232 yellow)
    (locked c3242)
    (lock-colour c3242 rainbow)
    (locked c2223)
    (lock-colour c2223 green)

    ; Key colours
    (key-colour key1 green)
    (key-colour key2 rainbow)
    (key-colour key3 purple)
    (key-colour key4 yellow)

    ; Key usage properties (one use, two use, etc)
    (one-use key1)
    (one-use key2)
    (one-use key3)
    (two-use key4)
    (usable key1)
    (usable key2)
    (usable key3)
    (usable key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-2)
    )
  )

)