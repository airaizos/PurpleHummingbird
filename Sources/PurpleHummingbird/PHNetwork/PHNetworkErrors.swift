//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 22/8/23.
//

import Foundation


enum PHNetworkError: Error {
    case badResponse
    case badJson(Error)
    case badImage
    case savingToCoreData
    case loadingFromCoreData
    case savingToDocuments
    case loadingFromDocuments
    case noResults
    
    var message:String {
        switch self {
        case .badResponse: return "Sin respuesta del servidor"
        case .badJson(let error): return "JSON error \(error.localizedDescription)"
        case .badImage: return "Imagen no reconocida"
        case .savingToCoreData: return "No se ha podido guardar en CoreData"
        case .loadingFromCoreData: return "No se ha podido obtener la información de CoreData"
        case .savingToDocuments: return "No se ha podido guardar en Documents"
        case .loadingFromDocuments: return "No se ha podido abrir el archivo"
        case .noResults: return "La consulta no proporciona ningún dato"
        }
    }
    var title:String {
        switch self {
        case .badResponse: return "Error de Conexión"
        case .badJson(_): return "Error de Datos"
        case .badImage: return "Error de Imagen"
        case .savingToCoreData,.loadingFromCoreData, .savingToDocuments,.loadingFromDocuments : return "Error de Persistencia"
        case .noResults: return "Sin resultados"
        }
    }
}
