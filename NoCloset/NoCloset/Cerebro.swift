// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cerebro = try? newJSONDecoder().decode(Cerebro.self, from: jsonData)

import Foundation

// MARK: - Cerebro
struct Cerebro: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let url: String
    let id: Int
    let file: String
    let collection: String
    let collectionID, fileSize: Int
    let cognitiveParadigmCogatlas, cognitiveParadigmCogatlasID, cognitiveContrastCogatlas, cognitiveContrastCogatlasID: String?
    let mapType: MapType
    let analysisLevel: AnalysisLevel?
    let name, resultDescription, addDate, modifyDate: String
    let isValid: Bool
    let surfaceLeftFile, surfaceRightFile: String?
    let dataOrigin: DataOrigin
    let targetTemplateImage: TargetTemplateImage
    let subjectSpecies: SubjectSpecies
    let figure: Figure?
    let handedness, age, gender, race: JSONNull?
    let ethnicity, bmi, fatPercentage, waistHipRatio: JSONNull?
    let meanPDSScore, tannerStage, daysSinceMenstruation, hoursSinceLastMeal: JSONNull?
    let bisBasScore, spsrqScore, bis11Score: JSONNull?
    let thumbnail: String
    let reducedRepresentation: String
    let isThresholded: Bool
    let percBadVoxels: Double
    let notMni: Bool
    let brainCoverage, percVoxelsOutside: Double
    let numberOfSubjects: Int?
    let modality: Modality
    let statisticParameters, smoothnessFwhm: Int?
    let contrastDefinition: String
    let contrastDefinitionCogatlas: ContrastDefinitionCogatlas?
    let cognitiveParadigmDescriptionURL: JSONNull?
    let imageType: ImageType

    enum CodingKeys: String, CodingKey {
        case url, id, file, collection
        case collectionID = "collection_id"
        case fileSize = "file_size"
        case cognitiveParadigmCogatlas = "cognitive_paradigm_cogatlas"
        case cognitiveParadigmCogatlasID = "cognitive_paradigm_cogatlas_id"
        case cognitiveContrastCogatlas = "cognitive_contrast_cogatlas"
        case cognitiveContrastCogatlasID = "cognitive_contrast_cogatlas_id"
        case mapType = "map_type"
        case analysisLevel = "analysis_level"
        case name
        case resultDescription = "description"
        case addDate = "add_date"
        case modifyDate = "modify_date"
        case isValid = "is_valid"
        case surfaceLeftFile = "surface_left_file"
        case surfaceRightFile = "surface_right_file"
        case dataOrigin = "data_origin"
        case targetTemplateImage = "target_template_image"
        case subjectSpecies = "subject_species"
        case figure, handedness, age, gender, race, ethnicity
        case bmi = "BMI"
        case fatPercentage = "fat_percentage"
        case waistHipRatio = "waist_hip_ratio"
        case meanPDSScore = "mean_PDS_score"
        case tannerStage = "tanner_stage"
        case daysSinceMenstruation = "days_since_menstruation"
        case hoursSinceLastMeal = "hours_since_last_meal"
        case bisBasScore = "bis_bas_score"
        case spsrqScore = "spsrq_score"
        case bis11Score = "bis11_score"
        case thumbnail
        case reducedRepresentation = "reduced_representation"
        case isThresholded = "is_thresholded"
        case percBadVoxels = "perc_bad_voxels"
        case notMni = "not_mni"
        case brainCoverage = "brain_coverage"
        case percVoxelsOutside = "perc_voxels_outside"
        case numberOfSubjects = "number_of_subjects"
        case modality
        case statisticParameters = "statistic_parameters"
        case smoothnessFwhm = "smoothness_fwhm"
        case contrastDefinition = "contrast_definition"
        case contrastDefinitionCogatlas = "contrast_definition_cogatlas"
        case cognitiveParadigmDescriptionURL = "cognitive_paradigm_description_url"
        case imageType = "image_type"
    }
}

enum AnalysisLevel: String, Codable {
    case group = "group"
}

enum ContrastDefinitionCogatlas: String, Codable {
    case auditionPassiveListening = "audition, passive listening"
    case empty = ""
}

enum DataOrigin: String, Codable {
    case volume = "volume"
}

enum Figure: String, Codable {
    case empty = ""
    case the3A = "3A"
    case the3B = "3B"
    case the4A = "4A"
    case the4B = "4B"
}

enum ImageType: String, Codable {
    case statisticMap = "statistic_map"
}

enum MapType: String, Codable {
    case anatomical = "anatomical"
    case other = "other"
    case pMapGivenNullHypothesis = "P map (given null hypothesis)"
    case parcellation = "parcellation"
    case tMap = "T map"
    case zMap = "Z map"
}

enum Modality: String, Codable {
    case empty = ""
    case fMRIBOLD = "fMRI-BOLD"
    case structuralMRI = "Structural MRI"
}

enum SubjectSpecies: String, Codable {
    case homoSapiens = "homo sapiens"
}

enum TargetTemplateImage: String, Codable {
    case genericMNI = "GenericMNI"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

