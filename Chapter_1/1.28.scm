(define (miller-rabin-test n)
  (define (miller-rabin-expmod base exp m)
    (define (miller-rabin-square-check x m)
      (define (check-nontrivial-sqrt square-mod x m)
        (if (and (= square-mod 1)
                 (not (= x 1))
                 (not (= x (- m 1))))
            0
            square-mod))
      (check-nontrivial-sqrt (remainder (square x) m) x m))
    (cond ((= exp 0) 1)
          ((even? exp) (miller-rabin-square-check (miller-rabin-expmod base (/ exp 2) m) m))
          (else (remainder (* base (miller-rabin-expmod base (- exp 1) m)) m))))
  (= (miller-rabin-expmod (+ 1 (random (- n 1))) (- n 1) n) 1))

(define (fast-miller-rabin-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-miller-rabin-prime? n (- times 1)))
        (else false)))

(define (display-miller-rabin-prime n times)
  (define (boolean->string b)
    (if b
        "true"
        "false"))
  (display (string-append (number->string n) " is prime ? " (boolean->string (fast-miller-rabin-prime? n times))))
  (newline))

(define times 100)

(display-miller-rabin-prime 42 times)
(display-miller-rabin-prime 43 times)
(display-miller-rabin-prime 44 times)
(display-miller-rabin-prime 45 times)
(display-miller-rabin-prime 46 times)
(display-miller-rabin-prime 47 times)

(display-miller-rabin-prime 561 times)
(display-miller-rabin-prime 1105 times)
(display-miller-rabin-prime 1729 times)
(display-miller-rabin-prime 2465 times)
(display-miller-rabin-prime 2821 times)
(display-miller-rabin-prime 6601 times)
