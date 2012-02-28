(ns boston
  (:refer-clojure :exclude [==])
  (:use clojure.core.logic))

;;;
;;; Individiuals
;;;

(defrel male p)
(defrel female p)

(fact male 'Matthew)
(fact male 'Nicholas)
(fact male 'Jeffrey)
(fact female 'Ruth)

(fact male 'Wendell)
(fact female 'Nancy)
(fact male 'Dan)

(fact male 'Gerald)
(fact female 'Freda)
(fact male 'Terry)
(fact female 'Melissa)

;;;
;;; Relationships
;;;

(defrel parent c p)

(fact parent 'Matthew 'Jeffrey)
(fact parent 'Nicholas 'Jeffrey)
(fact parent 'Matthew 'Ruth)
(fact parent 'Nicholas 'Ruth)

(fact parent 'Jeffrey 'Wendell)
(fact parent 'Dan 'Wendell)
(fact parent 'Jeffrey 'Nancy)
(fact parent 'Dan 'Nancy)

(fact parent 'Ruth 'Gerald)
(fact parent 'Terry 'Gerald)
(fact parent 'Melissa 'Gerald)
(fact parent 'Ruth 'Freda)
(fact parent 'Terry 'Freda)
(fact parent 'Melissa 'Freda)

;;;
;;; Associations
;;;

(defrel father [child father]
  (male father)
  (parent child father))

(defn grandparent [grandchild grandparent]
  (fresh [p]
         (parent grandchild p)
         (parent p grandparent)))

;;;
;;; Queries
;;;

;; (run* [q]
;;   (fresh [c p]
;;     (male p)
;;     (parent 'Matthew p)
;;     (== q p))) ; (Jeffrey)