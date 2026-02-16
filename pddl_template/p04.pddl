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
    (handfree)

    ; Location <> Corridor Connections
    (adjacent loc-1-1 loc-2-1 c1121)
    (adjacent loc-2-1 loc-1-1 c1121)
    (adjacent loc-2-1 loc-3-1 c2131)
    (adjacent loc-3-1 loc-2-1 c2131)
    (adjacent loc-3-1 loc-4-1 c3141)
    (adjacent loc-4-1 loc-3-1 c3141)
    (adjacent loc-4-1 loc-5-1 c4151)
    (adjacent loc-5-1 loc-4-1 c4151)
    (adjacent loc-5-1 loc-6-1 c5161)
    (adjacent loc-6-1 loc-5-1 c5161)
    (adjacent loc-6-1 loc-7-1 c6171)
    (adjacent loc-7-1 loc-6-1 c6171)

    (touches loc-1-1 c1121)
    (touches loc-2-1 c1121)
    (touches loc-2-1 c2131)
    (touches loc-3-1 c2131)
    (touches loc-3-1 c3141)
    (touches loc-4-1 c3141)
    (touches loc-4-1 c4151)
    (touches loc-5-1 c4151)
    (touches loc-5-1 c5161)
    (touches loc-6-1 c5161)
    (touches loc-6-1 c6171)
    (touches loc-7-1 c6171)

    ; Key locations
    (key-at key1 loc-1-1)
    (key-at key2 loc-1-1)
    (key-at key3 loc-1-1)
    (key-at key4 loc-1-1)
    (key-at key5 loc-1-1)

    ; Locked corridors
    (locked c1121)
    (lock-colour c1121 red)
    (locked c2131)
    (lock-colour c2131 yellow)
    (locked c3141)
    (lock-colour c3141 green)
    (locked c4151)
    (lock-colour c4151 purple)
    (locked c5161)
    (lock-colour c5161 rainbow)

    ; Key colours
    (key-colour key1 red)
    (key-colour key2 yellow)
    (key-colour key3 green)
    (key-colour key4 purple)
    (key-colour key5 rainbow)

    ; Key usage properties (one use, two use, etc)
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