(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-1 loc-2-1 loc-3-1 loc-4-1 loc-5-1 loc-6-1 loc-7-1 - location
    c1121 c2131 c3141 c4151 c5161 c6171 - corridor
    key1 key2 key3 key4 key5 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-1)
    (arm-free)

    ; Location <> Corridor Connections
    (connects c1121 loc-1-1 loc-2-1)
    (connects c2131 loc-2-1 loc-3-1)
    (connects c3141 loc-3-1 loc-4-1)
    (connects c4151 loc-4-1 loc-5-1)
    (connects c5161 loc-5-1 loc-6-1)
    (connects c6171 loc-6-1 loc-7-1)

    ; Touches - Location touches a corridor
    (touches c1121 loc-1-1) (touches c1121 loc-2-1)
    (touches c2131 loc-2-1) (touches c2131 loc-3-1)
    (touches c3141 loc-3-1) (touches c3141 loc-4-1)
    (touches c4151 loc-4-1) (touches c4151 loc-5-1)
    (touches c5161 loc-5-1) (touches c5161 loc-6-1)
    (touches c6171 loc-6-1) (touches c6171 loc-7-1)

    ; Key locations
    (key-at key1 loc-2-1)
    (key-at key2 loc-3-1)
    (key-at key3 loc-4-1)
    (key-at key4 loc-5-1)
    (key-at key5 loc-6-1)

    ; Locked corridors
    (locked c1121) (lock-colour c1121 red)
    (locked c2131) (lock-colour c2131 yellow)
    (locked c3141) (lock-colour c3141 green)
    (locked c4151) (lock-colour c4151 purple)
    (locked c5161) (lock-colour c5161 rainbow)

    ; Risky corridors (red locks are risky)
    (risky c1121)

    ; Key colours
    (key-colour key1 red)
    (key-colour key2 yellow)
    (key-colour key3 green)
    (key-colour key4 purple)
    (key-colour key5 rainbow)

    ; Key usage properties (one use, two use, etc)
    (multi-use key1)
    (two-use key2)
    (one-use key3)
    (one-use key4)
    (one-use key5)

    (usable key1)
    (usable key2)
    (usable key3)
    (usable key4)
    (usable key5)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-7-1)
    )
  )

)