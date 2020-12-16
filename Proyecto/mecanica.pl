%declaracion de librerias

:-use_module(library(pce)).
:-use_module(library(pce_style_item)).

% metodo principal para iniciar la interfaz grafica, declaracion de
% botones, labels, y la pocicion en pantalla.
inicio:-
	new(Menu, dialog('Mecanica', size(1000,800))),
	new(L,label(nombre,'SOFTWARE DE CONSULTA MECANICA')),
	new(A,label(nombre,'MECANICA AUTOMOTRIZ')),
	new(@texto,label(nombre,'Resuelbe el sigiente cuestionario para ayar una solucion a tu problema')),
	new(@respl,label(nombre,'')),
	new(Salir,button('SALIR',and(message(Menu, destroy),message(Menu,free)))),
	new(@boton,button('realizar test',message(@prolog,botones))),


	send(Menu,append(L)),new(@btncarrera,button('Diagnostico?')),
	send(Menu,display,L,point(125,20)),
	send(Menu,display,A,point(80,360)),
	send(Menu,display,@boton,point(100,150)),
	send(Menu,display,@texto,point(20,100)),
	send(Menu,display,Salir,point(20,400)),
	send(Menu,display,@respl,point(20,130)),
	send(Menu,open_centered).

%solucion a las fallas de acuerdo a las reglas de diagnostico

fallas('hacer un cambio de aceite'):-aceite,!.

fallas('realizar una alineacion y balanceo'):-suspension,!.

fallas('verificar el estado actual de la bateria'):-electronico,!.

fallas('llego la hora de cambiar tus pastillas de freno '):-frenos,!.

fallas('posiblemente tu auto pasara a mejor vida'):-computadora,!.

fallas('seguro subes demaciado el volumen'):-sonido,!.


fallas('sin resultados! si los problemas persisten utilice un dispositivo
	alienigena:/').

% preguntas para resolver las fallas con su respectivo identificador de
% falla
aceite:- cambio_aceite,
	pregunta('tienes problemas de motor?'),
	pregunta('su automovil gasta mas combustible de lo debido?'),
	pregunta('su motor se escucha muy ruidoso? '),
	Pregunta('tiene problemas para arrancar el veiculo en frio?'),
	pregunta('siente que su motor tiene menos fuerza que antes? ').

suspension:- alineacion_direccion,
	pregunta('tienes problemas de la suspencion?'),
	pregunta('tiene su volante neutral y el auto gira?'),
	pregunta('ha notado que alguna llanta se desgasta mas? '),
	pregunta('su volante se mueve bastante y tiembla?').

electronico:- bateria_agotada,
	pregunta('tienes problemas electricos?'),
	pregunta('sus faros titilan o encienden con poca fuerza?'),
	pregunta('el estereo no enciende?'),
	pregunta('el auto emite un crack cuando lo enciende?'),
	pregunta('el auto no enciende de ninguna manera?'),
	pregunta('su bateria es muy vieja?').

frenos:- cambio_frenos,
	pregunta('tienes problemas con tus frenos?'),
	pregunta('cuando frenas escuchas un chillido agudo?'),
	pregunta('al frenar siente que tarda mas? ').

computadora:- check_egine,
	pregunta('la luz check egine se encendio en tu tablero?'),
	pregunta('la luz se mantiene encendida todo el tiempo?').

sonido:- cambio_bocina,
	pregunta('tienes problemas con alguna bocina?'),
	pregunta('la bocina no se escucha nada?'),
	pregunta('tu auto tiene suficiente bateria?').

%identificador de falla que dirige a las preguntas correspondientes

cambio_aceite:-pregunta('tienes problemas de motor?'),!.
alineacion_direccion:-pregunta('tienes problemas de la suspencion?'),!.
bateria_agotada:-pregunta('tienes problemas electricos?'),!.
cambio_frenos:-pregunta('tienes problemas con tus frenos?'),!.
cambio_bocina:-pregunta('tienes problemas con alguna bocina?'),!.
check_egine:-pregunta('la luz check egine se encendio en tu tablero?'),!.

% proceso del diagnostico basado en preguntas de si y no, cuando el
% usuario dice si, se pasa a la siguiente pregunta del mismo ramo, si
% dice que no se pasa a la pregunta del siguiente ramo
% (motor,frenos,etc.)

:-dynamic si/1,no/1.
preguntar(Problema):- new(Di,dialog('Diagnostico mecanico')),
     new(L2,label(texto,'Responde las siguientes preguntas')),
     new(La,label(prob,Problema)),
     new(B1,button(si,and(message(Di,return,si)))),
     new(B2,button(no,and(message(Di,return,no)))),

         send(Di,append(L2)),
	 send(Di,append(La)),
	 send(Di,append(B1)),
	 send(Di,append(B2)),

	 send(Di,default_button,si),
	 send(Di,open_centered),get(Di,confirm,Answer),
	 write(Answer),send(Di,destroy),
	 ((Answer==si)->assert(si(Problema));
	 assert(no(Problema)),fail).

% Cada Vez que se conteste una pregunta la pantalla se limpia para
% volver a preguntar

pregunta(S):-(si(S)->true; (no(S)->false; preguntar(S))).
limpiar :- retract(si(_)),fail.
limpiar :- retract(no(_)),fail.
limpiar.

% proceso de eleccion de acuerdo al diagnostico basado en las preguntas
% anteriores

botones :- lim,
	send(@boton,free),
	send(@btncarrera,free),
	fallas(Falla),
	send(@texto,selection('la solucion es ')),
	send(@respl,selection(Falla)),
	new(@boton,button('inicia procedimiento mecanico',message(@prolog,botones))),
        send(Menu,display,@boton,point(40,50)),
        send(Menu,display,@btncarrera,point(20,50)),
limpiar.
lim :- send(@respl, selection('')).
