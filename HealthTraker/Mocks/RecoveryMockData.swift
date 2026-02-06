//
//  RecoveryMockData.swift
//  HealthTraker
//
//  Created by User on 05/02/26.
//

import Foundation

// MARK: - Sleep Mock Data
final class RecoveryMockData {
    
    static let shared = RecoveryMockData()
    
    private init() {}
    
    /// Получить замапленные данные для UI
    var data: RecoveryDataDM {
        guard let response = decodedResponse else {
            fatalError("Failed to decode RecoveryMockData JSON")
        }
        return RecoveryMapper.map(response: response)
    }
    
    /// Данные для дневного графика (7 элементов)
    var dailyGraphData: [RecoveryDayDM] {
        return data.graph.daily
    }
    
    /// Данные для недельного графика (7 элементов)
    var weeklyGraphData: [RecoveryDayDM] {
        return data.graph.weekly
    }
    
    /// Данные для месячного графика (7 элементов)
    var monthlyGraphData: [RecoveryDayDM] {
        return data.graph.monthly
    }
    
    /// Все дни (21 элемент)
    var allDays: [RecoveryDayDM] {
        return data.days
    }
    
    private var decodedResponse: RecoveryResponseDTO? {
        guard let data = jsonString.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(RecoveryResponseDTO.self, from: data)
    }
    
    private let jsonString = """
    {
        "data": {
            "days": [
                {
                    "date": 1768262399,
                    "value": 45,
                    "avg_value": 45,
                    "recovery_percentage": 45,
                    "resting_heart_rate": 57,
                    "hrv_rmssd_milli": 51.05,
                    "spo2_percentage": 91.5,
                    "skin_temp_celsius": 33.12,
                    "sleep_performance_percentage": 74,
                    "sleep_consistency_percentage": 46,
                    "sleep_efficiency_percentage": 88.57,
                    "is_current_date": false
                },
                {
                    "date": 1768348799,
                    "value": 14,
                    "avg_value": 14,
                    "recovery_percentage": 14,
                    "resting_heart_rate": 75,
                    "hrv_rmssd_milli": 22.47,
                    "spo2_percentage": 92,
                    "skin_temp_celsius": 34.12,
                    "sleep_performance_percentage": 28,
                    "sleep_consistency_percentage": 33,
                    "sleep_efficiency_percentage": 87.44,
                    "is_current_date": false
                },
                {
                    "date": 1768435199,
                    "value": 24,
                    "avg_value": 24,
                    "recovery_percentage": 24,
                    "resting_heart_rate": 66,
                    "hrv_rmssd_milli": 30.89,
                    "spo2_percentage": 92.6,
                    "skin_temp_celsius": 33.91,
                    "sleep_performance_percentage": 66,
                    "sleep_consistency_percentage": 60,
                    "sleep_efficiency_percentage": 87.69,
                    "is_current_date": false
                },
                {
                    "date": 1768521599,
                    "value": 40,
                    "avg_value": 40,
                    "recovery_percentage": 40,
                    "resting_heart_rate": 59,
                    "hrv_rmssd_milli": 45.3,
                    "spo2_percentage": 94.75,
                    "skin_temp_celsius": 33.78,
                    "sleep_performance_percentage": 65,
                    "sleep_consistency_percentage": 68,
                    "sleep_efficiency_percentage": 92.71,
                    "is_current_date": false
                },
                {
                    "date": 1768607999,
                    "value": 44,
                    "avg_value": 44,
                    "recovery_percentage": 44,
                    "resting_heart_rate": 60,
                    "hrv_rmssd_milli": 43.23,
                    "spo2_percentage": 93.83,
                    "skin_temp_celsius": 33.91,
                    "sleep_performance_percentage": 81,
                    "sleep_consistency_percentage": 77,
                    "sleep_efficiency_percentage": 87.38,
                    "is_current_date": false
                },
                {
                    "date": 1768694399,
                    "value": 17,
                    "avg_value": 17,
                    "recovery_percentage": 17,
                    "resting_heart_rate": 63,
                    "hrv_rmssd_milli": 51.37,
                    "spo2_percentage": 92,
                    "skin_temp_celsius": 32.27,
                    "sleep_performance_percentage": 30,
                    "sleep_consistency_percentage": 61,
                    "sleep_efficiency_percentage": 93.17,
                    "is_current_date": false
                },
                {
                    "date": 1768780799,
                    "value": 0,
                    "avg_value": 0,
                    "recovery_percentage": 0,
                    "resting_heart_rate": 0,
                    "hrv_rmssd_milli": 0,
                    "spo2_percentage": 0,
                    "skin_temp_celsius": 0,
                    "sleep_performance_percentage": 0,
                    "sleep_consistency_percentage": 0,
                    "sleep_efficiency_percentage": 0,
                    "is_current_date": false
                },
                {
                    "date": 1768867199,
                    "value": 5,
                    "avg_value": 5,
                    "recovery_percentage": 5,
                    "resting_heart_rate": 84,
                    "hrv_rmssd_milli": 19.07,
                    "spo2_percentage": 94.2,
                    "skin_temp_celsius": 33.46,
                    "sleep_performance_percentage": 9,
                    "sleep_consistency_percentage": 38,
                    "sleep_efficiency_percentage": 80.19,
                    "is_current_date": false
                },
                {
                    "date": 1768953599,
                    "value": 40,
                    "avg_value": 40,
                    "recovery_percentage": 40,
                    "resting_heart_rate": 68,
                    "hrv_rmssd_milli": 45.6,
                    "spo2_percentage": 93.72,
                    "skin_temp_celsius": 33.02,
                    "sleep_performance_percentage": 72,
                    "sleep_consistency_percentage": 32,
                    "sleep_efficiency_percentage": 98.47,
                    "is_current_date": false
                },
                {
                    "date": 1769039999,
                    "value": 42,
                    "avg_value": 42,
                    "recovery_percentage": 42,
                    "resting_heart_rate": 65,
                    "hrv_rmssd_milli": 45.26,
                    "spo2_percentage": 94.33,
                    "skin_temp_celsius": 33.33,
                    "sleep_performance_percentage": 77,
                    "sleep_consistency_percentage": 40,
                    "sleep_efficiency_percentage": 96.36,
                    "is_current_date": false
                },
                {
                    "date": 1769126399,
                    "value": 0,
                    "avg_value": 0,
                    "recovery_percentage": 0,
                    "resting_heart_rate": 0,
                    "hrv_rmssd_milli": 0,
                    "spo2_percentage": 0,
                    "skin_temp_celsius": 0,
                    "sleep_performance_percentage": 0,
                    "sleep_consistency_percentage": 0,
                    "sleep_efficiency_percentage": 0,
                    "is_current_date": false
                },
                {
                    "date": 1769212799,
                    "value": 0,
                    "avg_value": 0,
                    "recovery_percentage": 0,
                    "resting_heart_rate": 0,
                    "hrv_rmssd_milli": 0,
                    "spo2_percentage": 0,
                    "skin_temp_celsius": 0,
                    "sleep_performance_percentage": 0,
                    "sleep_consistency_percentage": 0,
                    "sleep_efficiency_percentage": 0,
                    "is_current_date": false
                },
                {
                    "date": 1769299199,
                    "value": 23,
                    "avg_value": 23,
                    "recovery_percentage": 23,
                    "resting_heart_rate": 76,
                    "hrv_rmssd_milli": 29.73,
                    "spo2_percentage": 92.71,
                    "skin_temp_celsius": 33.63,
                    "sleep_performance_percentage": 69,
                    "sleep_consistency_percentage": 0,
                    "sleep_efficiency_percentage": 93.31,
                    "is_current_date": false
                },
                {
                    "date": 1769385599,
                    "value": 13,
                    "avg_value": 13,
                    "recovery_percentage": 13,
                    "resting_heart_rate": 75,
                    "hrv_rmssd_milli": 18.14,
                    "spo2_percentage": 95.5,
                    "skin_temp_celsius": 34.3,
                    "sleep_performance_percentage": 69,
                    "sleep_consistency_percentage": 0,
                    "sleep_efficiency_percentage": 99.69,
                    "is_current_date": false
                },
                {
                    "date": 1769471999,
                    "value": 30,
                    "avg_value": 30,
                    "recovery_percentage": 30,
                    "resting_heart_rate": 66,
                    "hrv_rmssd_milli": 33.43,
                    "spo2_percentage": 95.28,
                    "skin_temp_celsius": 33.26,
                    "sleep_performance_percentage": 78,
                    "sleep_consistency_percentage": 56,
                    "sleep_efficiency_percentage": 90.35,
                    "is_current_date": false
                },
                {
                    "date": 1769558399,
                    "value": 15,
                    "avg_value": 15,
                    "recovery_percentage": 15,
                    "resting_heart_rate": 73,
                    "hrv_rmssd_milli": 22.2,
                    "spo2_percentage": 91.1,
                    "skin_temp_celsius": 34.58,
                    "sleep_performance_percentage": 46,
                    "sleep_consistency_percentage": 68,
                    "sleep_efficiency_percentage": 71.42,
                    "is_current_date": false
                },
                {
                    "date": 1769644799,
                    "value": 17,
                    "avg_value": 17,
                    "recovery_percentage": 17,
                    "resting_heart_rate": 67,
                    "hrv_rmssd_milli": 32.88,
                    "spo2_percentage": 94.67,
                    "skin_temp_celsius": 34.02,
                    "sleep_performance_percentage": 41,
                    "sleep_consistency_percentage": 48,
                    "sleep_efficiency_percentage": 96.82,
                    "is_current_date": false
                },
                {
                    "date": 1769731199,
                    "value": 49,
                    "avg_value": 49,
                    "recovery_percentage": 49,
                    "resting_heart_rate": 59,
                    "hrv_rmssd_milli": 49.45,
                    "spo2_percentage": 94.35,
                    "skin_temp_celsius": 33.45,
                    "sleep_performance_percentage": 78,
                    "sleep_consistency_percentage": 34,
                    "sleep_efficiency_percentage": 93.23,
                    "is_current_date": false
                },
                {
                    "date": 1770290760,
                    "value": 42,
                    "avg_value": 42,
                    "recovery_percentage": 42,
                    "resting_heart_rate": 59,
                    "hrv_rmssd_milli": 46.79,
                    "spo2_percentage": 90.9,
                    "skin_temp_celsius": 33.52,
                    "sleep_performance_percentage": 51,
                    "sleep_consistency_percentage": 42,
                    "sleep_efficiency_percentage": 90.63,
                    "is_current_date": true
                },
                {
                    "date": 1770377160,
                    "value": 0,
                    "avg_value": 0,
                    "recovery_percentage": 0,
                    "resting_heart_rate": 0,
                    "hrv_rmssd_milli": 0,
                    "spo2_percentage": 0,
                    "skin_temp_celsius": 0,
                    "sleep_performance_percentage": 0,
                    "sleep_consistency_percentage": 0,
                    "sleep_efficiency_percentage": 0,
                    "is_current_date": false
                },
                {
                    "date": 1770463560,
                    "value": 0,
                    "avg_value": 0,
                    "recovery_percentage": 0,
                    "resting_heart_rate": 0,
                    "hrv_rmssd_milli": 0,
                    "spo2_percentage": 0,
                    "skin_temp_celsius": 0,
                    "sleep_performance_percentage": 0,
                    "sleep_consistency_percentage": 0,
                    "sleep_efficiency_percentage": 0,
                    "is_current_date": false
                }
            ],
            "graph": {
                "daily": [
                    {
                        "date": 1769299199,
                        "value": 23,
                        "avg_value": 23,
                        "recovery_percentage": 23,
                        "resting_heart_rate": 76,
                        "hrv_rmssd_milli": 29.73,
                        "spo2_percentage": 92.71,
                        "skin_temp_celsius": 33.63,
                        "sleep_performance_percentage": 69,
                        "sleep_consistency_percentage": 0,
                        "sleep_efficiency_percentage": 93.31,
                        "is_current_date": false
                    },
                    {
                        "date": 1769385599,
                        "value": 13,
                        "avg_value": 13,
                        "recovery_percentage": 13,
                        "resting_heart_rate": 75,
                        "hrv_rmssd_milli": 18.14,
                        "spo2_percentage": 95.5,
                        "skin_temp_celsius": 34.3,
                        "sleep_performance_percentage": 69,
                        "sleep_consistency_percentage": 0,
                        "sleep_efficiency_percentage": 99.69,
                        "is_current_date": false
                    },
                    {
                        "date": 1769471999,
                        "value": 30,
                        "avg_value": 30,
                        "recovery_percentage": 30,
                        "resting_heart_rate": 66,
                        "hrv_rmssd_milli": 33.43,
                        "spo2_percentage": 95.28,
                        "skin_temp_celsius": 33.26,
                        "sleep_performance_percentage": 78,
                        "sleep_consistency_percentage": 56,
                        "sleep_efficiency_percentage": 90.35,
                        "is_current_date": false
                    },
                    {
                        "date": 1769558399,
                        "value": 15,
                        "avg_value": 15,
                        "recovery_percentage": 15,
                        "resting_heart_rate": 73,
                        "hrv_rmssd_milli": 22.2,
                        "spo2_percentage": 91.1,
                        "skin_temp_celsius": 34.58,
                        "sleep_performance_percentage": 46,
                        "sleep_consistency_percentage": 68,
                        "sleep_efficiency_percentage": 71.42,
                        "is_current_date": false
                    },
                    {
                        "date": 1769644799,
                        "value": 17,
                        "avg_value": 17,
                        "recovery_percentage": 17,
                        "resting_heart_rate": 67,
                        "hrv_rmssd_milli": 32.88,
                        "spo2_percentage": 94.67,
                        "skin_temp_celsius": 34.02,
                        "sleep_performance_percentage": 41,
                        "sleep_consistency_percentage": 48,
                        "sleep_efficiency_percentage": 96.82,
                        "is_current_date": false
                    },
                    {
                        "date": 1769731199,
                        "value": 49,
                        "avg_value": 49,
                        "recovery_percentage": 49,
                        "resting_heart_rate": 59,
                        "hrv_rmssd_milli": 49.45,
                        "spo2_percentage": 94.35,
                        "skin_temp_celsius": 33.45,
                        "sleep_performance_percentage": 78,
                        "sleep_consistency_percentage": 34,
                        "sleep_efficiency_percentage": 93.23,
                        "is_current_date": false
                    },
                    {
                        "date": 1769817599,
                        "value": 42,
                        "avg_value": 42,
                        "recovery_percentage": 42,
                        "resting_heart_rate": 59,
                        "hrv_rmssd_milli": 46.79,
                        "spo2_percentage": 90.9,
                        "skin_temp_celsius": 33.52,
                        "sleep_performance_percentage": 51,
                        "sleep_consistency_percentage": 42,
                        "sleep_efficiency_percentage": 90.63,
                        "is_current_date": true
                    }
                ],
                "weekly": [
                    {
                        "date": 1765756800,
                        "value": 25,
                        "avg_value": 25,
                        "recovery_percentage": 25,
                        "resting_heart_rate": 61.14,
                        "hrv_rmssd_milli": 46.12,
                        "spo2_percentage": 90.95,
                        "skin_temp_celsius": 33.8,
                        "sleep_performance_percentage": 71.14,
                        "sleep_consistency_percentage": 65.57,
                        "sleep_efficiency_percentage": 92.82,
                        "is_current_date": false
                    },
                    {
                        "date": 1766361600,
                        "value": 28.17,
                        "avg_value": 28.17,
                        "recovery_percentage": 28.17,
                        "resting_heart_rate": 61.67,
                        "hrv_rmssd_milli": 49.66,
                        "spo2_percentage": 92.99,
                        "skin_temp_celsius": 33.68,
                        "sleep_performance_percentage": 57.5,
                        "sleep_consistency_percentage": 57.67,
                        "sleep_efficiency_percentage": 88.69,
                        "is_current_date": false
                    },
                    {
                        "date": 1766966400,
                        "value": 52.17,
                        "avg_value": 52.17,
                        "recovery_percentage": 52.17,
                        "resting_heart_rate": 63.83,
                        "hrv_rmssd_milli": 62.96,
                        "spo2_percentage": 93.14,
                        "skin_temp_celsius": 34.02,
                        "sleep_performance_percentage": 48.67,
                        "sleep_consistency_percentage": 44.17,
                        "sleep_efficiency_percentage": 89.47,
                        "is_current_date": false
                    },
                    {
                        "date": 1767571200,
                        "value": 46.83,
                        "avg_value": 46.83,
                        "recovery_percentage": 46.83,
                        "resting_heart_rate": 61.17,
                        "hrv_rmssd_milli": 56.98,
                        "spo2_percentage": 94.22,
                        "skin_temp_celsius": 33.04,
                        "sleep_performance_percentage": 63.5,
                        "sleep_consistency_percentage": 45.83,
                        "sleep_efficiency_percentage": 91.47,
                        "is_current_date": false
                    },
                    {
                        "date": 1768176000,
                        "value": 30.67,
                        "avg_value": 30.67,
                        "recovery_percentage": 30.67,
                        "resting_heart_rate": 63.33,
                        "hrv_rmssd_milli": 40.72,
                        "spo2_percentage": 92.78,
                        "skin_temp_celsius": 33.52,
                        "sleep_performance_percentage": 57.33,
                        "sleep_consistency_percentage": 57.5,
                        "sleep_efficiency_percentage": 89.49,
                        "is_current_date": false
                    },
                    {
                        "date": 1768780800,
                        "value": 24.6,
                        "avg_value": 24.6,
                        "recovery_percentage": 24.6,
                        "resting_heart_rate": 73.6,
                        "hrv_rmssd_milli": 31.56,
                        "spo2_percentage": 94.09,
                        "skin_temp_celsius": 33.55,
                        "sleep_performance_percentage": 59.2,
                        "sleep_consistency_percentage": 22,
                        "sleep_efficiency_percentage": 93.6,
                        "is_current_date": false
                    },
                    {
                        "date": 1769385600,
                        "value": 30.6,
                        "avg_value": 30.6,
                        "recovery_percentage": 30.6,
                        "resting_heart_rate": 64.8,
                        "hrv_rmssd_milli": 36.95,
                        "spo2_percentage": 93.26,
                        "skin_temp_celsius": 33.77,
                        "sleep_performance_percentage": 58.8,
                        "sleep_consistency_percentage": 49.6,
                        "sleep_efficiency_percentage": 88.49,
                        "is_current_date": true
                    }
                ],
                "monthly": [
                    {
                        "date": 1751328000,
                        "value": 0,
                        "avg_value": 0,
                        "recovery_percentage": 0,
                        "resting_heart_rate": 0,
                        "hrv_rmssd_milli": 0,
                        "spo2_percentage": 0,
                        "skin_temp_celsius": 0,
                        "sleep_performance_percentage": 0,
                        "sleep_consistency_percentage": 0,
                        "sleep_efficiency_percentage": 0,
                        "is_current_date": false
                    },
                    {
                        "date": 1754006400,
                        "value": 0,
                        "avg_value": 0,
                        "recovery_percentage": 0,
                        "resting_heart_rate": 0,
                        "hrv_rmssd_milli": 0,
                        "spo2_percentage": 0,
                        "skin_temp_celsius": 0,
                        "sleep_performance_percentage": 0,
                        "sleep_consistency_percentage": 0,
                        "sleep_efficiency_percentage": 0,
                        "is_current_date": false
                    },
                    {
                        "date": 1756684800,
                        "value": 0,
                        "avg_value": 0,
                        "recovery_percentage": 0,
                        "resting_heart_rate": 0,
                        "hrv_rmssd_milli": 0,
                        "spo2_percentage": 0,
                        "skin_temp_celsius": 0,
                        "sleep_performance_percentage": 0,
                        "sleep_consistency_percentage": 0,
                        "sleep_efficiency_percentage": 0,
                        "is_current_date": false
                    },
                    {
                        "date": 1759276800,
                        "value": 32.11,
                        "avg_value": 32.11,
                        "recovery_percentage": 32.11,
                        "resting_heart_rate": 62.94,
                        "hrv_rmssd_milli": 194.89,
                        "spo2_percentage": 94.82,
                        "skin_temp_celsius": 33.69,
                        "sleep_performance_percentage": 72.67,
                        "sleep_consistency_percentage": 61.06,
                        "sleep_efficiency_percentage": 93.2,
                        "is_current_date": false
                    },
                    {
                        "date": 1761955200,
                        "value": 43.06,
                        "avg_value": 43.06,
                        "recovery_percentage": 43.06,
                        "resting_heart_rate": 64.44,
                        "hrv_rmssd_milli": 108.65,
                        "spo2_percentage": 93.76,
                        "skin_temp_celsius": 33.7,
                        "sleep_performance_percentage": 65.25,
                        "sleep_consistency_percentage": 54.31,
                        "sleep_efficiency_percentage": 92.12,
                        "is_current_date": false
                    },
                    {
                        "date": 1764547200,
                        "value": 26.48,
                        "avg_value": 26.48,
                        "recovery_percentage": 26.48,
                        "resting_heart_rate": 62.48,
                        "hrv_rmssd_milli": 47.53,
                        "spo2_percentage": 92.7,
                        "skin_temp_celsius": 33.89,
                        "sleep_performance_percentage": 64.34,
                        "sleep_consistency_percentage": 60.52,
                        "sleep_efficiency_percentage": 91.45,
                        "is_current_date": false
                    },
                    {
                        "date": 1767225600,
                        "value": 35.12,
                        "avg_value": 35.12,
                        "recovery_percentage": 35.12,
                        "resting_heart_rate": 65.35,
                        "hrv_rmssd_milli": 45.35,
                        "spo2_percentage": 93.63,
                        "skin_temp_celsius": 33.52,
                        "sleep_performance_percentage": 58.69,
                        "sleep_consistency_percentage": 47.08,
                        "sleep_efficiency_percentage": 90.99,
                        "is_current_date": true
                    }
                ]
            }
        }
    }
    """
}









