# PurpleHummingbird

PurpleHummingbird es una biblioteca que proporciona una serie de métodos y extensiones para facilitar el desarrollo de aplicaciones en Swift. Abarca peticiones de red, extensiones de tipos de datos.

## Red

El módulo de Red proporciona herramientas para manejar operaciones de red de manera eficiente y segura:

- `NetworkManager`: Abstracción de alto nivel sobre URLSession para realizar solicitudes HTTP y gestionar respuestas. Proporciona métodos para solicitudes GET, POST, PUT y DELETE, junto con manejo de errores de red.

- `JSONDecoderExtension`: Extensión de JSONDecoder para decodificar datos JSON en estructuras Swift de manera sencilla y segura, manejando automáticamente los casos de decodificación fallida.

- `NetworkError`: Enumeración de errores comunes relacionados con operaciones de red, como errores de conexión, códigos de estado HTTP inesperados, etc.


## Extensiones

El módulo de Extensiones de Protocolos amplía las capacidades de tipos comunes de Swift:

- `StringExtensions`: Ofrece métodos útiles para manipular y validar cadenas, como verificar si una cadena es un correo electrónico válido o si contiene solo caracteres numéricos.

- `DateExtensions`: Extensión de Date para formatear y manipular fechas de manera conveniente.

- `NSManagedObjectExtensions`: Proporciona utilidades para simplificar el manejo de objetos administrados en Core Data, como la conversión entre objetos administrados y estructuras Swift.

- `NSPredicateExtensions`: Extensión para construir predicados de manera más legible y sencilla.

- `ImageExtensions`: Incluye funciones para cargar, redimensionar y manipular imágenes de manera eficiente.

## Uso

Para integrar este paquete en tu proyecto Swift, puedes agregarlo como una dependencia en tu archivo `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/airaizos/PurpleHummingbird.git", from: "1.0.0")
]
