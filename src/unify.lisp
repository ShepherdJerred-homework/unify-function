(defun do-unify
  (t1 t2 sigma)
  (let
    (
      (m1 (match t1 t2))
      (m2 (match t2 t1)))
    (if
      (or
        (null m1)
        (null m2))
      (cons sigma (cons m1 (cons m2 nil)))
      (if
        (and
          (eq m1 '(nil))
          (eq m2 '(nil)))
        sigma
        (do-unify (simplify t1 m1) (simplify t2 m2) (cons sigma (cons m1 (cons m2 nil))))))))
      

(defun unify
  (t1 t2)
  (do-unify t1 t2 '(nil)))
