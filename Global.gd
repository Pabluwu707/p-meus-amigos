extends Node


var dia : int = 1
var current_dinero : int = 0
var current_max_vida : int = 5
var current_recompensa : int = 0


var misiones_facil = [
	{
		nombre_alien = "Melvin",
		imagen_alien = "",
		nombre_paquete = "Pistola de rayos",
		imagen_paquete = "",
		mensaje="Me encantan los mensajes por defecto.",
		dificultad = 5,
		recompensa = "50",
		usado = true
	},
	{
		nombre_alien = "Blirg Brap",
		imagen_alien = "",
		nombre_paquete = "Mono de trabajo",
		imagen_paquete = "",
		mensaje="I love stomping... KOOPAS",
		dificultad = 4,
		recompensa = "150",
		usado = true
	},
	{
		nombre_alien = "Lambdas y Digammas",
		imagen_alien = "",
		nombre_paquete = "Ídolo ominoso",
		imagen_paquete = "",
		mensaje="Me encantan los mensajes por defecto.",
		dificultad = 5,
		recompensa = "100",
		usado = false
	}
]
var misiones_normal = [
	{
		nombre_alien = "Marciano Rajoy",
		imagen_alien = "",
		nombre_paquete = "Cassata lunar",
		imagen_paquete = "",
		mensaje="Me encantan los mensajes por defecto.",
		dificultad = 3,
		recompensa = "150",
		usado = true
	},
	{
		nombre_alien = "Xokulon",
		imagen_alien = "",
		nombre_paquete = "Comida congelada",
		mensaje="No tienes ni puta idea de enviar a domilicio. ",
		imagen_paquete = "",
		dificultad = 3,
		recompensa = "150",
		usado = false
	}
]
var misiones_dificil = [
	{
		nombre_alien = "Congria",
		imagen_alien = "",
		nombre_paquete = "Ramo de violetas",
		imagen_paquete = "",
		mensaje="Me encantan los mensajes por defecto.",
		dificultad = 2,
		recompensa = "200",
		usado = false
	},
	{
		nombre_alien = "P.T.",
		imagen_alien = "",
		nombre_paquete = "Cargamento totalmente legal",
		imagen_paquete = "",
		mensaje="Me encantan los mensajes por defecto.",
		dificultad = 2,
		recompensa = "250",
		usado = false
	}
]

var misiones = [
	
]
