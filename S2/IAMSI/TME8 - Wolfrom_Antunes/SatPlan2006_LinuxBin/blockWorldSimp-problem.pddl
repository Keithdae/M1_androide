(define (problem blockProblemSimp)
	(:domain blockWorldSimp)
	(:objects A B C D - block A B C D T - object)
	(:init (clear B) (on B A) (clear C) (on C D) (on A T) (on D T))
	(:goal (and (on A B) (on B C) (on C D))))
