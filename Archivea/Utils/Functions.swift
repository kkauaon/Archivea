import Foundation

func preservationToString(preservation: Int) -> String {
    switch preservation{
    case 1:
        return "Péssimo"
    case 2:
        return "Ruim"
    case 3:
        return "Regular"
    case 4:
        return "Bom"
    case 5:
        return "Excelente"
    default:
        return "Não disponível"
    }
}
