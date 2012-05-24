(define (sqrte x times)
  (define (iter expansion)
    (if (= expansion 0)
        0
        (/ 1 (+ x (iter (- expansion 1))))))
  (+ 1 (iter times)))

(define (euler57 n max)
  
  (define (iter times count)
    (define sq 0)
    
    (if (> times max)
        count
        (begin
          (set! sq (sqrte n times))
          (if (> 
               (string-length (number->string (numerator sq)))
               (string-length (number->string (denominator sq))))
              (set! count (+ 1 count)))
          (iter (+ 1 times) count))))
  
  (iter 0 0))

(display (euler57 2 1000))