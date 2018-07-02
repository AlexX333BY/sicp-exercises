(define (third-root-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (third-root-iter (improve guess x)
                       guess
                       x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3.0))

(define (good-enough? guess prev-guess)
  (< (abs (/ (- guess prev-guess) guess)) 0.001))

(define (third-root x)
  (if (= x 0)
      0
      (third-root-iter (improve 1.0 x)
                       1.0
                       x)))

(define (square x)
  (* x x))
