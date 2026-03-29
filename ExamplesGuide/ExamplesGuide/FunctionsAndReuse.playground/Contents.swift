// 5. Funciones y Reutilización

func convertirCelsiusAFahrenheit(celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

// Llamamos a la función con un valor específico
let temperaturaF = convertirCelsiusAFahrenheit(celsius: 25)
print("Resultado: \(temperaturaF)°F")
