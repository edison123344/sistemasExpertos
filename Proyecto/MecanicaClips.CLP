
(defrule tipo-problemas_auto
(initial-fact)
=>
(printout t "cual es el lugar que no funciona motor/electrico?" crlf)
(assert (tipo-problema (read)))
)

(defrule problemas-auto
(or (tipo-problema motor)(tipo-problema electrico))
=>
(printout t "el motor aranca(si/no)?" crlf)
(assert (motor-aranca(read)))
)

(defrule problemas-auto2
(or (tipo-problema motor)(tipo-problema electrico))
=>
(printout t "enciende luz(si/no)?" crlf)
(assert (funciona-luz(read)))
)
(defrule problemas-auto3
(or (tipo-problema motor)(tipo-problema electrico))
=>
(printout t "el motor tiene potencia(si/no)?" crlf)
(assert (funciona-potencioa(read)))
)

(defrule problemas-auto4
(or (tipo-problema motor)(tipo-problema electrico))
=>
(printout t "el motor bota humo negro (si/no)?" crlf)
(assert (funciona-filtro(read)))
)
(defrule problemas-auto5
(or (tipo-problema motor)(tipo-problema electrico))
=>
(printout t "el suich enciende (si/no)?" crlf)
(assert (funciona-suich(read)))
)
(defrule problemas-gasolina
(tipo-problema motor)
(motor-aranca no)
(funciona-luz si)
=>(printout t "Falta Gasolina" crlf)
)


(defrule problemas-bateria
(tipo-problema motor)
(motor-aranca no)
(funciona-luz no)
=>(printout t "Rebisar la bateria" crlf)
)


(defrule problemas-bujias
(tipo-problema motor)
(funciona-potencia no)
(funciona-filtro si)
=>(printout t "Rebisar la bujias" crlf)
)

(defrule problemas-filtro
(tipo-problema motor)
(funciona-potencia no)
(funciona-filtro si)
=>(printout t "Rebisar el filtro" crlf)
)

(defrule problemas-Aranque
(tipo-problema motor)
(funciona-potencia no)
(funciona-suich no)
=>(printout t "Rebisar el aranque" crlf)
)

(defrule problemas-consultar
(tipo-problema motor)
(motor-aranca no)
(funciona-luz no)
(funciona-potencia no)
(funciona-filtro no)
(funciona-suich si)
=>(printout t "consulte con un espesialista" crlf)
)