(defrule tipo-robot-regla
(initial-fact)
=>
(printout t "Que tipo de robot/configuracion tienes(peaton/carro)?" crlf)
(assert (tipo-robot (read)))
)

(defrule semaforo-color-regla
(or (tipo-robot peaton)(tipo-robot carro))
=>
(printout t "Ingrese el color del semaforo(rojo/verde/amarillo)?" crlf)
(assert (semaforo(read)))
)

(defrule pasar-regla-peaton
(tipo-robot peaton)
(semaforo verde)
=>
(printout t "El roboot:no puede pasar el peaton ,pasa el carro " crlf)
)
(defrule pasar-regla-carro
(tipo-robot carro)
(semaforo verde)
=>
(printout t "El roboot: puede pasar el carro ,no pasa el peaton " crlf)
)

(defrule precaucion-regla-peaton
(tipo-robot peaton)
(semaforo amarillo)
=>
(printout t "El robot:el peaton no puede pasar ,el carro pasa rapido" crlf)
)

(defrule precaucion-regla-carro
(tipo-robot carro)
(semaforo amarillo)
=>
(printout t "El robot:el carro pasa rapido ,el peaton no puede pasar" crlf)
)

(defrule detener-regla-peaton
(tipo-robot peaton)
(semaforo rojo)
=>
(printout t "El robot: el peaton puede pasar, el carro no puede pasar" crlf)
)

(defrule detener-regla-carro
(tipo-robot carro)
(semaforo rojo)
=>
(printout t "El robot:El carro no puede pasar, el peaton puede pasar" crlf)
)