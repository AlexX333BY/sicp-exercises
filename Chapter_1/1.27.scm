(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (boolean->string b)
  (if b
      "true"
      "false"))

(define (fermat-cycle n)
  (define (fermat-iter n a)
    (cond ((>= a n) true)
          ((not (fermat-test n a)) false)
          (else (fermat-iter n (+ a 1)))))
  (fermat-iter n 1))

(define (display-fermat-prime n)
  (display (string-append (number->string n) " is prime ? " (boolean->string (fermat-cycle n))))
  (newline))

(display-fermat-prime 561)
(display-fermat-prime 1105)
(display-fermat-prime 1729)
(display-fermat-prime 2465)
(display-fermat-prime 2821)
(display-fermat-prime 6601)
