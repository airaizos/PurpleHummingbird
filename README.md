# PurpleHummingbird Utilities Package

El PurpleHummingbird es una biblioteca que proporciona una serie de utilidades para facilitar el desarrollo de aplicaciones en Swift. Este paquete abarca tres áreas principales: Red, Seguridad y Extensiones de Protocolos.

## Red

El módulo de Red proporciona herramientas para manejar operaciones de red de manera eficiente y segura:

- `NetworkManager`: Abstracción de alto nivel sobre URLSession para realizar solicitudes HTTP y gestionar respuestas. Proporciona métodos para solicitudes GET, POST, PUT y DELETE, junto con manejo de errores de red.

- `JSONDecoderExtension`: Extensión de JSONDecoder para decodificar datos JSON en estructuras Swift de manera sencilla y segura, manejando automáticamente los casos de decodificación fallida.

- `NetworkError`: Enumeración de errores comunes relacionados con operaciones de red, como errores de conexión, códigos de estado HTTP inesperados, etc.

## Seguridad

El módulo de Seguridad incluye herramientas para proteger los datos y las comunicaciones de la aplicación:

- `EncryptionManager`: Ofrece métodos para cifrar y descifrar datos utilizando algoritmos de cifrado seguros. Permite proteger datos sensibles almacenados localmente.

- `KeyAgreementManager`: Implementa algoritmos de acuerdo de llaves para establecer comunicaciones seguras entre diferentes dispositivos o componentes de la aplicación.

- `DataObfuscation`: Proporciona funciones para ofuscar datos sensibles antes de almacenarlos en la aplicación, aumentando la seguridad frente a posibles ataques.

## Extensiones de Protocolos

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
