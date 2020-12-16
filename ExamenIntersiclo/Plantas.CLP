(defrule tipo-problemas_plantas1
(initial-fact)
=>
(printout t "la planta crese poco si/no?" crlf)
(assert (tipo-problema (read)))
)

(defrule preguntas
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "la planta tiene color amarrillo(si/no)?" crlf)
(assert (problemas-plata(read)))
)
(defrule preguntas1
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "tiene color pardo rojiso(si/no)?" crlf)
(assert (problemas-plata2(read)))
)

(defrule preguntas2
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "la raíz de la planta tiene poco crecimiento (si/no)?" crlf)
(assert (problemas-plata3(read)))
)

(defrule resultado1
(or(tipo-problema si)
(problemas-planta si)
(problemas-plata2 si))
=>(printout t "Tiene defisiensia nitrogeno" crlf)
)


(defrule resultado2
(problemas-plata3 si)
=>(printout t "Tiene defisiensia fosforo" crlf)
)

