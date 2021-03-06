(define (double n)
  (* n 2))

(define (halve n)
  (quotient n 2))

(define (fast-* a b)
  (define (fast-*-iter a b t)
    (cond ((= b 0) 0)
          ((= b 1) (+ a t))
          ((even? b) (fast-*-iter (double a) (halve b) t))
          (else (fast-*-iter a (- b 1) (+ a t)))))
  (cond ((or (= a 0) (= b 0)) 0)
        ((= a 1) b)
        ((= b 1) a)
        (else (fast-*-iter a b 0))))
