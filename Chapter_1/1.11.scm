(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (f-recursive (- n 2))
         (f-recursive (- n 3)))))

(define (f-iterative n)
  (define (iteration a b c count)
    (if (= count 0)
        c
        (iteration (+ a b c) a b (- count 1))))
  (iteration 2 1 0 n))
