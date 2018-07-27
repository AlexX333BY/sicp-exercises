(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes first last)
  (define (search-for-primes-iter cur last)
    (cond ((<= cur last) (timed-prime-test cur)
                         (search-for-primes-iter (+ cur 2) last))))
  (if (even? first)
      (search-for-primes-iter (+ first 1) last)
      (search-for-primes-iter first last)))

(search-for-primes 1000 1125) (newline)
(search-for-primes 10000 10625) (newline)
(search-for-primes 100000 103125) (newline)
(search-for-primes 1000000 1015625) (newline)
