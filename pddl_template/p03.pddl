(define (problem p3-dungeon)
  (:domain Dungeon)

  (:objects
    loc-3-4 loc-4-5 loc-1-2 loc-2-2 loc-3-2 loc-3-3 loc-2-5 loc-1-3 loc-2-1 loc-1-4 loc-3-5 loc-2-4 loc-4-4 loc-2-3 loc-4-3 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-1)
    (arm-free)

    ; Location <> Corridor Connections (both directions)
    (connects c2122 loc-2-1 loc-2-2)
    (connects c2122 loc-2-2 loc-2-1)

    (connects c1222 loc-1-2 loc-2-2)
    (connects c1222 loc-2-2 loc-1-2)

    (connects c2232 loc-2-2 loc-3-2)
    (connects c2232 loc-3-2 loc-2-2)

    (connects c1213 loc-1-2 loc-1-3)
    (connects c1213 loc-1-3 loc-1-2)

    (connects c1223 loc-1-2 loc-2-3)
    (connects c1223 loc-2-3 loc-1-2)

    (connects c2223 loc-2-2 loc-2-3)
    (connects c2223 loc-2-3 loc-2-2)

    (connects c3223 loc-3-2 loc-2-3)
    (connects c3223 loc-2-3 loc-3-2)

    (connects c3233 loc-3-2 loc-3-3)
    (connects c3233 loc-3-3 loc-3-2)

    (connects c1323 loc-1-3 loc-2-3)
    (connects c1323 loc-2-3 loc-1-3)

    (connects c2333 loc-2-3 loc-3-3)
    (connects c2333 loc-3-3 loc-2-3)

    (connects c1314 loc-1-3 loc-1-4)
    (connects c1314 loc-1-4 loc-1-3)

    (connects c2314 loc-2-3 loc-1-4)
    (connects c2314 loc-1-4 loc-2-3)

    (connects c2324 loc-2-3 loc-2-4)
    (connects c2324 loc-2-4 loc-2-3)

    (connects c2334 loc-2-3 loc-3-4)
    (connects c2334 loc-3-4 loc-2-3)

    (connects c3334 loc-3-3 loc-3-4)
    (connects c3334 loc-3-4 loc-3-3)

    (connects c1424 loc-1-4 loc-2-4)
    (connects c1424 loc-2-4 loc-1-4)

    (connects c2434 loc-2-4 loc-3-4)
    (connects c2434 loc-3-4 loc-2-4)

    (connects c2425 loc-2-4 loc-2-5)
    (connects c2425 loc-2-5 loc-2-4)

    (connects c2535 loc-2-5 loc-3-5)
    (connects c2535 loc-3-5 loc-2-5)

    (connects c3545 loc-3-5 loc-4-5)
    (connects c3545 loc-4-5 loc-3-5)

    (connects c4544 loc-4-5 loc-4-4)
    (connects c4544 loc-4-4 loc-4-5)

    (connects c4443 loc-4-4 loc-4-3)
    (connects c4443 loc-4-3 loc-4-4)

    ; Touches - Location touches a corridor
    (touches c2122 loc-2-1) (touches c2122 loc-2-2)
    (touches c1222 loc-1-2) (touches c1222 loc-2-2)
    (touches c2232 loc-2-2) (touches c2232 loc-3-2)
    (touches c1213 loc-1-2) (touches c1213 loc-1-3)
    (touches c1223 loc-1-2) (touches c1223 loc-2-3)
    (touches c2223 loc-2-2) (touches c2223 loc-2-3)
    (touches c3223 loc-3-2) (touches c3223 loc-2-3)
    (touches c3233 loc-3-2) (touches c3233 loc-3-3)
    (touches c1323 loc-1-3) (touches c1323 loc-2-3)
    (touches c2333 loc-2-3) (touches c2333 loc-3-3)
    (touches c1314 loc-1-3) (touches c1314 loc-1-4)
    (touches c2314 loc-2-3) (touches c2314 loc-1-4)
    (touches c2324 loc-2-3) (touches c2324 loc-2-4)
    (touches c2334 loc-2-3) (touches c2334 loc-3-4)
    (touches c3334 loc-3-3) (touches c3334 loc-3-4)
    (touches c1424 loc-1-4) (touches c1424 loc-2-4)
    (touches c2434 loc-2-4) (touches c2434 loc-3-4)
    (touches c2425 loc-2-4) (touches c2425 loc-2-5)
    (touches c2535 loc-2-5) (touches c2535 loc-3-5)
    (touches c3545 loc-3-5) (touches c3545 loc-4-5)
    (touches c4544 loc-4-5) (touches c4544 loc-4-4)
    (touches c4443 loc-4-4) (touches c4443 loc-4-3)

    ; Key locations
    (key-at key1 loc-2-1)
    (key-at key2 loc-2-3)
    (key-at key3 loc-2-3)
    (key-at key4 loc-2-3)
    (key-at key5 loc-2-3)
    (key-at key6 loc-4-4)

    ; Locked corridors
    (locked c1223) (lock-colour c1223 red)
    (locked c2223) (lock-colour c2223 red)
    (locked c3223) (lock-colour c3223 red)
    (locked c1323) (lock-colour c1323 red)
    (locked c2333) (lock-colour c2333 red)
    (locked c2314) (lock-colour c2314 red)
    (locked c2324) (lock-colour c2324 red)
    (locked c2334) (lock-colour c2334 red)

    (locked c2425) (lock-colour c2425 purple)
    (locked c2535) (lock-colour c2535 green)
    (locked c3545) (lock-colour c3545 purple)
    (locked c4544) (lock-colour c4544 green)
    (locked c4443) (lock-colour c4443 rainbow)

    ; Risky corridors (red locks are risky)
    (risky c1223)
    (risky c2223)
    (risky c3223)
    (risky c1323)
    (risky c2333)
    (risky c2314)
    (risky c2324)
    (risky c2334)

    ; Key colours
    (key-colour key1 red)
    (key-colour key2 green)
    (key-colour key3 green)
    (key-colour key4 purple)
    (key-colour key5 purple)
    (key-colour key6 rainbow)

    ; Key usage
    (multi-use key1)
    (one-use key2)
    (one-use key3)
    (one-use key4)
    (one-use key5)
    (one-use key6)

    (usable key1)
    (usable key2)
    (usable key3)
    (usable key4)
    (usable key5)
    (usable key6)

  )

  (:goal
    (and
      (hero-at loc-4-3)
    )
  )

)
