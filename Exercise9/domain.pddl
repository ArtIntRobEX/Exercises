(define (domain gripper-strips)
(:requirements :strips)
   (:predicates (room ?r)
		(ball ?b)
		(gripper ?g)
		(at-robby ?r)
		(at ?b ?r)
		(free ?g)
		(carry ?o ?g)
		(notinplace ?b))

   (:action move
       :parameters  (?from ?to)
       :precondition (and (room ?from) (room ?to) (at-robby ?from))
       :effect (and  (at-robby ?to)
		     (not (at-robby ?from))))



   (:action pick
       :parameters (?obj ?room ?gripper)
       :precondition  (and (ball ?obj) (room ?room) (gripper ?gripper)
			    (at ?obj ?room) (at-robby ?room) (free ?gripper) (notinplace ?obj))
       :effect (and (carry ?obj ?gripper) 
		    (not (at ?obj ?room)) 
		    (not (free ?gripper))))


   (:action drop
       :parameters  (?obj  ?room ?gripper)
       :precondition  (and  (ball ?obj) (room ?room) (gripper ?gripper)
			    (carry ?obj ?gripper) (at-robby ?room) (notinplace ?obj))
       :effect (and (at ?obj ?room)
		    (free ?gripper)
		    (not (carry ?obj ?gripper))))


   (:action pick-move-drop 
       :parameters (?obj ?from ?to ?gripper)
       :precondition  (and 
                            (ball ?obj) (room ?from) (gripper ?gripper) 
                            (at ?obj ?from) (at-robby ?from) (free ?gripper) 
                            (notinplace ?obj)
                      )
       :effect (and 
                    (at ?obj ?to) (not (at ?obj ?from)) (free ?gripper) (not (carry ?obj ?gripper))
                    (at-robby ?to) (not (at-robby ?from))
		        )
    )
    )
		    