(define (square x) (* x x))

(define (get-sum-of-squares x y) (+ (square x) (square y)))

(define (get-max-of-3 x y z) (cond ((and (> x y) (> x z)) x)
                                   ((and (> y x) (> y z)) y)
                                   (else z)))

(define (get-mid-of-3 x y z) (cond ((or (= x y) (= x z)) x)
                                   ((= y z) y)
                                   ((or (and (> x y) (< x z)) (and (< x y) (> x z))) x)
                                   ((or (and (> y x) (< y z)) (and (< y x) (> y z))) y)
                                   (else z)))

(define (get-sum-of-squares-of-2-max x y z) (get-sum-of-squares (get-max-of-3 x y z) (get-mid-of-3 x y z)))
