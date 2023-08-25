//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 22/8/23.
//

import Foundation


enum PHNetworkError: Error,Equatable,Comparable {
    static func < (lhs: PHNetworkError, rhs: PHNetworkError) -> Bool {
        lhs.localizedDescription > rhs.localizedDescription
    }
    
    static func == (lhs: PHNetworkError, rhs: PHNetworkError) -> Bool {
        lhs.localizedDescription == rhs.localizedDescription
    }
    
    case general
    case noResponse
    case badData
    case status(Int)
    case badJson(Error)
    case badImage
    case savingToCoreData
    case loadingFromCoreData
    case savingToDocuments
    case loadingFromDocuments
    case loadingFromBundle
    case noResults
    
    var message:String {
        switch self {
        case .general: return "Error"
        case .noResponse: return "Sin respuesta"
        case .badData: return "Error de Data"
        case .status(let status): return "Error de http status \(status)"
        case .badJson(let error): return "JSON error \(error.localizedDescription)"
        case .badImage: return "Imagen no reconocida"
     
        case .loadingFromCoreData: return "No se ha podido obtener la información de CoreData"
        case .loadingFromBundle: return "No se ha podido cargar desde el Bundle"
        case .savingToCoreData: return "No se ha podido guardar en CoreData"
        case .savingToDocuments: return "No se ha podido guardar en Documents"
        case .loadingFromDocuments: return "No se ha podido abrir el archivo"
        case .noResults: return "La consulta no proporciona ningún dato"
        }
    }
    var title:String {
        switch self {
        case .general: return "Error desconocido"
        case .status, .noResponse: return "Error de Conexión"
        case .badData,.badJson(_): return "Error de Datos"
        case .badImage: return "Error de Imagen"
        case .savingToCoreData,.loadingFromCoreData, .savingToDocuments,.loadingFromDocuments, .loadingFromBundle : return "Error de Persistencia"
        case .noResults: return "Sin resultados"
        }
    }
}
