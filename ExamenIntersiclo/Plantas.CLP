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
(assert (problemas-planta(read)))
)
(defrule preguntas1
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "tiene color pardo rojizo(si/no)?" crlf)
(assert (problemas-planta1(read)))
)

(defrule preguntas2
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "la raíz de la planta tiene poco crecimiento (si/no)?" crlf)
(assert (problemas-planta2(read)))
)


(defrule preguntas3
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "la planta tiene un tallo fusiforme (si/no)?" crlf)
(assert (problemas-planta3(read)))
)

(defrule preguntas4
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "la planta tiene color púrpura  (si/no)?" crlf)
(assert (problemas-planta4(read)))
)

(defrule preguntas5
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "la planta tiene un retraso en la madurez(si/no)?" crlf)
(assert (problemas-planta5(read)))
)

(defrule preguntas6
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "la planta tiene los bordes de las hojas chamuscados(si/no)?" crlf)
(assert (problemas-planta6(read)))
)
(defrule preguntas7
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "la planta tiene los tallos debilitados  (si/no)?" crlf)
(assert (problemas-planta7(read)))
)
(defrule preguntas8
(or(tipo-problema no)(tipo-problema si))
=>
(printout t "la planta tiene semillas o frutas marchitas  (si/no)?" crlf)
(assert (problemas-planta8(read)))
)

(defrule resultado1
(or(tipo-problema si)
(problemas-planta si)
(problemas-planta1 si))
=>(printout t "Tiene deficiencia de nitrogeno" crlf)
)


(defrule resultado2
(or
(problemas-planta2 si)
(problemas-planta3 si)
(problemas-planta4 si)
(problemas-planta5 si))
=>(printout t "Tiene deficiencia de fosforo" crlf)
)

(defrule resultado3
(or
(problemas-planta6 si)
(problemas-planta7 si)
(problemas-planta8 si))
=>(printout t "Tiene deficiencia potasio" crlf)
)


