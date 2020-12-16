(defrule tipo-problemas_auto
(initial-fact)
=>
(printout t "Tienes problemas con tu auto si/no?" crlf)
(assert (tipo-problema (read)))
)

(defrule problemas-auto
(tipo-problema si)
=>
(printout t "el motor aranca(si/no)?" crlf)
(assert (motor-aranca(read)))
)

(defrule problemas-auto2
(tipo-problema si)
=>
(printout t "enciende luz(si/no)?" crlf)
(assert (funciona-luz(read)))
)
(defrule problemas-auto3
(tipo-problema si)
=>
(printout t "el motor tiene potencia(si/no)?" crlf)
(assert (funciona-potencioa(read)))
)

(defrule problemas-auto4
(tipo-problema si)
=>
(printout t "el motor bota humo negro (si/no)?" crlf)
(assert (funciona-filtro(read)))
)

(defrule problemas-auto5
(tipo-problema si)
=>
(printout t "el suich enciende (si/no)?" crlf)
(assert (funciona-suich(read)))
)


(defrule problemas-gasolina
(tipo-problema si)
(motor-aranca no)
(funciona-luz si)
=>(printout t "Falta Gasolina" crlf)
)


(defrule problemas-bateria
(tipo-problema si)
(motor-aranca no)
(funciona-luz no)
=>(printout t "Rebisar la bateria" crlf)
)


(defrule problemas-bujias
(tipo-problema si)
(funciona-potencia no)
(funciona-filtro si)
=>(printout t "Rebisar la bujias" crlf)
)

(defrule problemas-filtro
(tipo-problema si)
(funciona-potencia no)
(funciona-filtro si)
=>(printout t "Rebisar el filtro" crlf)
)

(defrule problemas-Aranque
(tipo-problema si)
(funciona-potencia no)
(funciona-suich no)
=>(printout t "Rebisar el aranque" crlf)
)

(defrule problemas-consultar
(tipo-problema si)
(motor-aranca no)
(funciona-luz no)
(funciona-potencia no)
(funciona-filtro no)
(funciona-suich si)
=>(printout t "consulte con un espesialista" crlf)
)