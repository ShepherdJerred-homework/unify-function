; unify
; Jerred Shepherd

(defun do-unify
  (t1 t2 sigma)
  (if
    (eq t1 t2)
    sigma
    (if
      (or
        (atom t1)
        (atom t2))
      (if
        (isvar t1)
        (let*
          (
            (new-sigma
              (if
                (eq sigma '(nil))
                (cons (cons t1 t2) nil)
                (cons sigma (cons t1 t2))))
            (new-t1 t2))
          (do-unify new-t1 t2 new-sigma))
        (if
          (isvar t2)
          (do-unify t2 t1 sigma)
          nil))
      (let*
        (
          (new-sigma (do-unify (car t1) (car t2) sigma)))
        (if
          (null new-sigma)
          nil
          (do-unify (cdr t1) (cdr t2) new-sigma))))))

(defun unify
  (t1 t2)
  (do-unify t1 t2 '(nil)))
