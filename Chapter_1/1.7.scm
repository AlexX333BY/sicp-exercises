(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (improve guess x)
  (average guess 
           (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess prev-guess)
  (< (abs (/ (- guess prev-guess) guess)) 0.001))

(define (sqrt x)
  (if (= x 0)
      0
      (sqrt-iter (improve 1.0 x)
                 1.0
                 x)))
