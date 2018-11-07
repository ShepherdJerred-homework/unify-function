(defun is-nil-list
  (term)
  (if
    (eq term '(nil))
    T
    nil))

(defun both-null
  (t1 t2)
  (if
    (and
      (null t1)
      (null t2))
    T
    nil))

(defun either-null
  (t1 t2)
  (if
    (or
      (null t1)
      (null t2))
    T
    nil))

(defun both-nil-list
  (t1 t2)
  (if
    (and
      (is-nil-list t1)
      (is-nil-list t2))
    T
    nil))

(defun merge-two-lists
  (t1 t2)
  (if
    (is-nil-list t1)
    t2
    (if
      (is-nil-list t2)
      t1
      (list t1 t2))))

(defun merge-three-lists
  (m1 m2 sigma)
  (merge-two-lists m1 (merge-two-lists m2 sigma)))

(defun merge-sigma
  (m1 m2 sigma)
  (if
    (is-nil-list sigma)
    (merge-two-lists m1 m2)
    (merge-three-lists m1 m2 m3)))
    
(defun do-unify
  (t1 t2 sigma)
  (let
    (
      (m1 (match t1 t2))
      (m2 (match t2 t1)))
    (if
      (both-null m1 m2)
      nil
      (if
        (both-nil-list m1 m2)
        sigma
        (let
          (
            (new-sigma (merge-sigma m1 m2 sigma)))
          (do-unify (simplify t1 new-sigma) (simplify t2 new-sigma) new-sigma))))))

(defun unify
  (t1 t2)
  (do-unify t1 t2 '(nil)))
