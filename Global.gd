extends Node

var mision_tutorial = {
		nombre_alien = "Melvin",
		imagen_alien = "melvin",
		nombre_paquete = "Pistola de rayos",
		imagen_paquete = "melvinpedido",
		mensaje="Tienes lo que hay que tener para enviar encargos. Mucho ánimo, te espera una semana movidita.",
		dificultad = 5,
		recompensa = "50",
		usado = false
	}

var dia : int = 0
var current_dinero : int = 0
var current_veces_dano : int = 0
var current_mision = mision_tutorial

var misiones_facil = [
	{
		nombre_alien = "Blirg Brap",
		imagen_alien = "blip",
		nombre_paquete = "Mono de trabajo",
		imagen_paquete = "blippedido",
		mensaje="I love stomping on... KOOPAS! Este pequeño me ayudará en mi próxima interpretación.",
		dificultad = 4,
		recompensa = "120",
		usado = false
	},
	{
		nombre_alien = "Lambdas y Digammas",
		imagen_alien = "lambas",
		nombre_paquete = "Ídolo ominoso",
		imagen_paquete = "lambaspedido",
		mensaje="Con la llegada de este omen, el ritual queda completo. El hormiguero se volverá a alzar ante los mortales.",
		dificultad = 5,
		recompensa = "100",
		usado = false
	},
	{
		nombre_alien = "Xokulon",
		imagen_alien = "xokulon",
		nombre_paquete = "Comida congelada",
		imagen_paquete = "xokulonpedido",
		mensaje="No tienes ni puta idea de enviar a domilicio. Tienes que aprender de un experto como yo. Fuera de aquí, que tengo que comer.",
		dificultad = 4,
		recompensa = "100",
		usado = false
	}
]
var misiones_normal = [
	{
		nombre_alien = "Marciano Rajoy",
		imagen_alien = "rajoy",
		nombre_paquete = "Cassata lunar",
		imagen_paquete = "rajoypedido",
		mensaje="Buenas gracias y muchas noches. *procede a succionar el helado violentamente*",
		dificultad = 3,
		recompensa = "150",
		usado = false
	},
	{
		nombre_alien = "Xokulon",
		imagen_alien = "xokulon",
		nombre_paquete = "Comida congelada",
		imagen_paquete = "xokulonpedido",
		mensaje="No tienes ni puta idea de enviar a domilicio. Tienes que aprender de un experto como yo. Fuera de aquí, que tengo que comer.",
		dificultad = 3,
		recompensa = "150",
		usado = false
	},
	{
		nombre_alien = "Blirg Brap",
		imagen_alien = "blip",
		nombre_paquete = "Mono de trabajo",
		imagen_paquete = "blippedido",
		mensaje="I love stomping on... KOOPAS! Este pequeño me ayudará en mi próxima interpretación.",
		dificultad = 3,
		recompensa = "150",
		usado = false
	}
]
var misiones_dificil = [
	{
		nombre_alien = "Congria",
		imagen_alien = "congria",
		nombre_paquete = "Ramo de violetas",
		imagen_paquete = "congriapedido",
		mensaje="¿Un ramo de flores? ¿Para mí? ¡Ay, lagarta! ¡Que ya tengo novia!",
		dificultad = 2,
		recompensa = "200",
		usado = false
	},
	{
		nombre_alien = "P.T.",
		imagen_alien = "pt",
		nombre_paquete = "Cargamento sospechoso",
		imagen_paquete = "ptpedido",
		mensaje="hostia puta un astronauta en bicicleta......",
		dificultad = 2,
		recompensa = "250",
		usado = false
	},
	{
		nombre_alien = "Melvin",
		imagen_alien = "melvin",
		nombre_paquete = "Pistola de rayos",
		imagen_paquete = "melvinpedido",
		mensaje="Bogos binted?",
		dificultad = 2,
		recompensa = "250",
		usado = false
	}
]

var misiones = [
	
]
