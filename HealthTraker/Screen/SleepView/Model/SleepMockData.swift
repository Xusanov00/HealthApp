//
//  SleepMockData.swift
//  HealthTraker
//
//  Created by User on 04/02/26.
//

import Foundation

// MARK: - Sleep Mock Data
final class SleepMockData {
    
    static let shared = SleepMockData()
    
    private init() {}
    
    /// Получить замапленные данные для UI
    var data: SleepDataDM {
        guard let response = decodedResponse else {
            fatalError("Failed to decode SleepMockData JSON")
        }
        return SleepMapper.map(response: response)
    }
    
    /// Данные для дневного графика (7 элементов)
    var dailyGraphData: [SleepDayDM] {
        return data.graph.daily
    }
    
    /// Данные для недельного графика (7 элементов)
    var weeklyGraphData: [SleepDayDM] {
        return data.graph.weekly
    }
    
    /// Данные для месячного графика (7 элементов)
    var monthlyGraphData: [SleepDayDM] {
        return data.graph.monthly
    }
    
    /// Все дни (21 элемент)
    var allDays: [SleepDayDM] {
        return data.days
    }
    
    private var decodedResponse: SleepResponseDTO? {
        guard let data = jsonString.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(SleepResponseDTO.self, from: data)
    }
    
    private let jsonString = """
    {
      "data": {
        "days": [
          {
            "date": 1768262399,
            "value": 24418140,
            "avg_value": 0,
            "sleep_time_in_hours": 6.78,
            "sleep_time_formatted": "06:47",
            "avg_sleep_time_in_hours": 6.78,
            "avg_sleep_time_formatted": "06:47",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 4620190,
                "time_in_hours": 1.28,
                "time_formatted": "01:17",
                "average_time_in_hours": 1.28,
                "average_time_formatted": "01:17",
                "percentage": 16.759
              },
              "light": {
                "time_in_milli": 16467740,
                "time_in_hours": 4.57,
                "time_formatted": "04:34",
                "average_time_in_hours": 4.57,
                "average_time_formatted": "04:34",
                "percentage": 59.734
              },
              "deep": {
                "time_in_milli": 3330210,
                "time_in_hours": 0.93,
                "time_formatted": "00:56",
                "average_time_in_hours": 0.93,
                "average_time_formatted": "00:56",
                "percentage": 12.08
              },
              "awake": {
                "time_in_milli": 3150160,
                "time_in_hours": 0.88,
                "time_formatted": "00:53",
                "average_time_in_hours": 0.88,
                "average_time_formatted": "00:53",
                "percentage": 11.427
              }
            },
            "sleep_performance_percentage": 74,
            "sleep_efficiency_percentage": 88.57,
            "avg_start_time": 67833,
            "avg_start_time_formatted": "18:50",
            "avg_end_time": 9002,
            "avg_end_time_formatted": "02:30",
            "is_current_date": false
          },
          {
            "date": 1768348799,
            "value": 16925570,
            "avg_value": 0,
            "sleep_time_in_hours": 4.7,
            "sleep_time_formatted": "04:42",
            "avg_sleep_time_in_hours": 4.7,
            "avg_sleep_time_formatted": "04:42",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 4742210,
                "time_in_hours": 1.32,
                "time_formatted": "01:19",
                "average_time_in_hours": 1.32,
                "average_time_formatted": "01:19",
                "percentage": 24.359
              },
              "light": {
                "time_in_milli": 8702260,
                "time_in_hours": 2.42,
                "time_formatted": "02:25",
                "average_time_in_hours": 2.42,
                "average_time_formatted": "02:25",
                "percentage": 44.701
              },
              "deep": {
                "time_in_milli": 3481100,
                "time_in_hours": 0.97,
                "time_formatted": "00:58",
                "average_time_in_hours": 0.97,
                "average_time_formatted": "00:58",
                "percentage": 17.881
              },
              "awake": {
                "time_in_milli": 2542120,
                "time_in_hours": 0.71,
                "time_formatted": "00:43",
                "average_time_in_hours": 0.71,
                "average_time_formatted": "00:43",
                "percentage": 13.058
              }
            },
            "sleep_performance_percentage": 28,
            "sleep_efficiency_percentage": 87.44,
            "avg_start_time": 80449,
            "avg_start_time_formatted": "22:20",
            "avg_end_time": 13516,
            "avg_end_time_formatted": "03:45",
            "is_current_date": false
          },
          {
            "date": 1768435199,
            "value": 20944850,
            "avg_value": 0,
            "sleep_time_in_hours": 5.82,
            "sleep_time_formatted": "05:49",
            "avg_sleep_time_in_hours": 5.82,
            "avg_sleep_time_formatted": "05:49",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 2160160,
                "time_in_hours": 0.6,
                "time_formatted": "00:36",
                "average_time_in_hours": 0.6,
                "average_time_formatted": "00:36",
                "percentage": 9.015
              },
              "light": {
                "time_in_milli": 14673530,
                "time_in_hours": 4.08,
                "time_formatted": "04:05",
                "average_time_in_hours": 4.08,
                "average_time_formatted": "04:05",
                "percentage": 61.239
              },
              "deep": {
                "time_in_milli": 4111160,
                "time_in_hours": 1.14,
                "time_formatted": "01:08",
                "average_time_in_hours": 1.14,
                "average_time_formatted": "01:08",
                "percentage": 17.158
              },
              "awake": {
                "time_in_milli": 3016100,
                "time_in_hours": 0.84,
                "time_formatted": "00:50",
                "average_time_in_hours": 0.84,
                "average_time_formatted": "00:50",
                "percentage": 12.588
              }
            },
            "sleep_performance_percentage": 66,
            "sleep_efficiency_percentage": 87.69,
            "avg_start_time": 70576,
            "avg_start_time_formatted": "19:36",
            "avg_end_time": 8137,
            "avg_end_time_formatted": "02:15",
            "is_current_date": false
          },
          {
            "date": 1768521599,
            "value": 19090910,
            "avg_value": 0,
            "sleep_time_in_hours": 5.3,
            "sleep_time_formatted": "05:18",
            "avg_sleep_time_in_hours": 5.3,
            "avg_sleep_time_formatted": "05:18",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 4980350,
                "time_in_hours": 1.38,
                "time_formatted": "01:23",
                "average_time_in_hours": 1.38,
                "average_time_formatted": "01:23",
                "percentage": 24.187
              },
              "light": {
                "time_in_milli": 10268460,
                "time_in_hours": 2.85,
                "time_formatted": "02:51",
                "average_time_in_hours": 2.85,
                "average_time_formatted": "02:51",
                "percentage": 49.869
              },
              "deep": {
                "time_in_milli": 3842100,
                "time_in_hours": 1.07,
                "time_formatted": "01:04",
                "average_time_in_hours": 1.07,
                "average_time_formatted": "01:04",
                "percentage": 18.659
              },
              "awake": {
                "time_in_milli": 1500070,
                "time_in_hours": 0.42,
                "time_formatted": "00:25",
                "average_time_in_hours": 0.42,
                "average_time_formatted": "00:25",
                "percentage": 7.285
              }
            },
            "sleep_performance_percentage": 65,
            "sleep_efficiency_percentage": 92.71,
            "avg_start_time": 77063,
            "avg_start_time_formatted": "21:24",
            "avg_end_time": 11254,
            "avg_end_time_formatted": "03:07",
            "is_current_date": false
          },
          {
            "date": 1768607999,
            "value": 27415130,
            "avg_value": 0,
            "sleep_time_in_hours": 7.62,
            "sleep_time_formatted": "07:37",
            "avg_sleep_time_in_hours": 7.62,
            "avg_sleep_time_formatted": "07:37",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 6722290,
                "time_in_hours": 1.87,
                "time_formatted": "01:52",
                "average_time_in_hours": 1.87,
                "average_time_formatted": "01:52",
                "percentage": 21.425
              },
              "light": {
                "time_in_milli": 16040740,
                "time_in_hours": 4.46,
                "time_formatted": "04:28",
                "average_time_in_hours": 4.46,
                "average_time_formatted": "04:28",
                "percentage": 51.125
              },
              "deep": {
                "time_in_milli": 4652100,
                "time_in_hours": 1.29,
                "time_formatted": "01:17",
                "average_time_in_hours": 1.29,
                "average_time_formatted": "01:17",
                "percentage": 14.827
              },
              "awake": {
                "time_in_milli": 3960120,
                "time_in_hours": 1.1,
                "time_formatted": "01:06",
                "average_time_in_hours": 1.1,
                "average_time_formatted": "01:06",
                "percentage": 12.622
              }
            },
            "sleep_performance_percentage": 81,
            "sleep_efficiency_percentage": 87.38,
            "avg_start_time": 68578,
            "avg_start_time_formatted": "19:02",
            "avg_end_time": 13553,
            "avg_end_time_formatted": "03:45",
            "is_current_date": false
          },
          {
            "date": 1768694399,
            "value": 9419040,
            "avg_value": 0,
            "sleep_time_in_hours": 2.62,
            "sleep_time_formatted": "02:37",
            "avg_sleep_time_in_hours": 2.62,
            "avg_sleep_time_formatted": "02:37",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 1382000,
                "time_in_hours": 0.38,
                "time_formatted": "00:23",
                "average_time_in_hours": 0.38,
                "average_time_formatted": "00:23",
                "percentage": 13.67
              },
              "light": {
                "time_in_milli": 5035050,
                "time_in_hours": 1.4,
                "time_formatted": "01:24",
                "average_time_in_hours": 1.4,
                "average_time_formatted": "01:24",
                "percentage": 49.803
              },
              "deep": {
                "time_in_milli": 3001990,
                "time_in_hours": 0.83,
                "time_formatted": "00:50",
                "average_time_in_hours": 0.83,
                "average_time_formatted": "00:50",
                "percentage": 29.693
              },
              "awake": {
                "time_in_milli": 690990,
                "time_in_hours": 0.19,
                "time_formatted": "00:11",
                "average_time_in_hours": 0.19,
                "average_time_formatted": "00:11",
                "percentage": 6.835
              }
            },
            "sleep_performance_percentage": 30,
            "sleep_efficiency_percentage": 93.17,
            "avg_start_time": 80476,
            "avg_start_time_formatted": "22:21",
            "avg_end_time": 4186,
            "avg_end_time_formatted": "01:09",
            "is_current_date": false
          },
          {
            "date": 1768780799,
            "value": 0,
            "avg_value": 0,
            "sleep_time_in_hours": 0,
            "sleep_time_formatted": "00:00",
            "avg_sleep_time_in_hours": 0,
            "avg_sleep_time_formatted": "00:00",
            "sleep_needed_in_hours": 0,
            "sleep_needed_formatted": "00:00",
            "avg_sleep_needed_in_hours": 0,
            "avg_sleep_needed_formatted": "00:00",
            "periods": {
              "rem": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "light": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "deep": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "awake": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              }
            },
            "sleep_performance_percentage": 0,
            "sleep_efficiency_percentage": 0,
            "avg_start_time": 0,
            "avg_start_time_formatted": "00:00",
            "avg_end_time": 0,
            "avg_end_time_formatted": "00:00",
            "is_current_date": false
          },
          {
            "date": 1768867199,
            "value": 12758310,
            "avg_value": 0,
            "sleep_time_in_hours": 3.54,
            "sleep_time_formatted": "03:32",
            "avg_sleep_time_in_hours": 3.54,
            "avg_sleep_time_formatted": "03:32",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 3871110,
                "time_in_hours": 1.08,
                "time_formatted": "01:05",
                "average_time_in_hours": 1.08,
                "average_time_formatted": "01:05",
                "percentage": 24.161
              },
              "light": {
                "time_in_milli": 5375150,
                "time_in_hours": 1.49,
                "time_formatted": "01:29",
                "average_time_in_hours": 1.49,
                "average_time_formatted": "01:29",
                "percentage": 33.548
              },
              "deep": {
                "time_in_milli": 3512050,
                "time_in_hours": 0.98,
                "time_formatted": "00:59",
                "average_time_in_hours": 0.98,
                "average_time_formatted": "00:59",
                "percentage": 21.92
              },
              "awake": {
                "time_in_milli": 3264090,
                "time_in_hours": 0.91,
                "time_formatted": "00:55",
                "average_time_in_hours": 0.91,
                "average_time_formatted": "00:55",
                "percentage": 20.372
              }
            },
            "sleep_performance_percentage": 9,
            "sleep_efficiency_percentage": 80.19,
            "avg_start_time": 2784,
            "avg_start_time_formatted": "00:46",
            "avg_end_time": 18806,
            "avg_end_time_formatted": "05:13",
            "is_current_date": false
          },
          {
            "date": 1768953599,
            "value": 19358780,
            "avg_value": 0,
            "sleep_time_in_hours": 5.38,
            "sleep_time_formatted": "05:23",
            "avg_sleep_time_in_hours": 5.38,
            "avg_sleep_time_formatted": "05:23",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 4293270,
                "time_in_hours": 1.19,
                "time_formatted": "01:11",
                "average_time_in_hours": 1.19,
                "average_time_formatted": "01:11",
                "percentage": 21.839
              },
              "light": {
                "time_in_milli": 10922400,
                "time_in_hours": 3.03,
                "time_formatted": "03:02",
                "average_time_in_hours": 3.03,
                "average_time_formatted": "03:02",
                "percentage": 55.56
              },
              "deep": {
                "time_in_milli": 4143110,
                "time_in_hours": 1.15,
                "time_formatted": "01:09",
                "average_time_in_hours": 1.15,
                "average_time_formatted": "01:09",
                "percentage": 21.075
              },
              "awake": {
                "time_in_milli": 300000,
                "time_in_hours": 0.08,
                "time_formatted": "00:05",
                "average_time_in_hours": 0.08,
                "average_time_formatted": "00:05",
                "percentage": 1.526
              }
            },
            "sleep_performance_percentage": 72,
            "sleep_efficiency_percentage": 98.47,
            "avg_start_time": 79235,
            "avg_start_time_formatted": "22:00",
            "avg_end_time": 12494,
            "avg_end_time_formatted": "03:28",
            "is_current_date": false
          },
          {
            "date": 1769039999,
            "value": 27053000,
            "avg_value": 0,
            "sleep_time_in_hours": 7.51,
            "sleep_time_formatted": "07:31",
            "avg_sleep_time_in_hours": 7.51,
            "avg_sleep_time_formatted": "07:31",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 6636250,
                "time_in_hours": 1.84,
                "time_formatted": "01:50",
                "average_time_in_hours": 1.84,
                "average_time_formatted": "01:50",
                "percentage": 23.638
              },
              "light": {
                "time_in_milli": 16331660,
                "time_in_hours": 4.54,
                "time_formatted": "04:32",
                "average_time_in_hours": 4.54,
                "average_time_formatted": "04:32",
                "percentage": 58.174
              },
              "deep": {
                "time_in_milli": 4085090,
                "time_in_hours": 1.13,
                "time_formatted": "01:08",
                "average_time_in_hours": 1.13,
                "average_time_formatted": "01:08",
                "percentage": 14.551
              },
              "awake": {
                "time_in_milli": 1021050,
                "time_in_hours": 0.28,
                "time_formatted": "00:17",
                "average_time_in_hours": 0.28,
                "average_time_formatted": "00:17",
                "percentage": 3.637
              }
            },
            "sleep_performance_percentage": 77,
            "sleep_efficiency_percentage": 96.36,
            "avg_start_time": 72326,
            "avg_start_time_formatted": "20:05",
            "avg_end_time": 14000,
            "avg_end_time_formatted": "03:53",
            "is_current_date": false
          },
          {
            "date": 1769126399,
            "value": 0,
            "avg_value": 0,
            "sleep_time_in_hours": 0,
            "sleep_time_formatted": "00:00",
            "avg_sleep_time_in_hours": 0,
            "avg_sleep_time_formatted": "00:00",
            "sleep_needed_in_hours": 0,
            "sleep_needed_formatted": "00:00",
            "avg_sleep_needed_in_hours": 0,
            "avg_sleep_needed_formatted": "00:00",
            "periods": {
              "rem": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "light": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "deep": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "awake": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              }
            },
            "sleep_performance_percentage": 0,
            "sleep_efficiency_percentage": 0,
            "avg_start_time": 0,
            "avg_start_time_formatted": "00:00",
            "avg_end_time": 0,
            "avg_end_time_formatted": "00:00",
            "is_current_date": false
          },
          {
            "date": 1769212799,
            "value": 0,
            "avg_value": 0,
            "sleep_time_in_hours": 0,
            "sleep_time_formatted": "00:00",
            "avg_sleep_time_in_hours": 0,
            "avg_sleep_time_formatted": "00:00",
            "sleep_needed_in_hours": 0,
            "sleep_needed_formatted": "00:00",
            "avg_sleep_needed_in_hours": 0,
            "avg_sleep_needed_formatted": "00:00",
            "periods": {
              "rem": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "light": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "deep": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "awake": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              }
            },
            "sleep_performance_percentage": 0,
            "sleep_efficiency_percentage": 0,
            "avg_start_time": 0,
            "avg_start_time_formatted": "00:00",
            "avg_end_time": 0,
            "avg_end_time_formatted": "00:00",
            "is_current_date": false
          },
          {
            "date": 1769299199,
            "value": 21779840,
            "avg_value": 0,
            "sleep_time_in_hours": 6.05,
            "sleep_time_formatted": "06:03",
            "avg_sleep_time_in_hours": 6.05,
            "avg_sleep_time_formatted": "06:03",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 4623210,
                "time_in_hours": 1.28,
                "time_formatted": "01:17",
                "average_time_in_hours": 1.28,
                "average_time_formatted": "01:17",
                "percentage": 19.807
              },
              "light": {
                "time_in_milli": 12802440,
                "time_in_hours": 3.56,
                "time_formatted": "03:34",
                "average_time_in_hours": 3.56,
                "average_time_formatted": "03:34",
                "percentage": 54.85
              },
              "deep": {
                "time_in_milli": 4354190,
                "time_in_hours": 1.21,
                "time_formatted": "01:13",
                "average_time_in_hours": 1.21,
                "average_time_formatted": "01:13",
                "percentage": 18.655
              },
              "awake": {
                "time_in_milli": 1561060,
                "time_in_hours": 0.43,
                "time_formatted": "00:26",
                "average_time_in_hours": 0.43,
                "average_time_formatted": "00:26",
                "percentage": 6.688
              }
            },
            "sleep_performance_percentage": 69,
            "sleep_efficiency_percentage": 93.31,
            "avg_start_time": 79879,
            "avg_start_time_formatted": "22:11",
            "avg_end_time": 16820,
            "avg_end_time_formatted": "04:40",
            "is_current_date": false
          },
          {
            "date": 1769385599,
            "value": 19110750,
            "avg_value": 0,
            "sleep_time_in_hours": 5.31,
            "sleep_time_formatted": "05:19",
            "avg_sleep_time_in_hours": 5.31,
            "avg_sleep_time_formatted": "05:19",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 5880270,
                "time_in_hours": 1.63,
                "time_formatted": "01:38",
                "average_time_in_hours": 1.63,
                "average_time_formatted": "01:38",
                "percentage": 30.673
              },
              "light": {
                "time_in_milli": 8309330,
                "time_in_hours": 2.31,
                "time_formatted": "02:19",
                "average_time_in_hours": 2.31,
                "average_time_formatted": "02:19",
                "percentage": 43.344
              },
              "deep": {
                "time_in_milli": 4921150,
                "time_in_hours": 1.37,
                "time_formatted": "01:22",
                "average_time_in_hours": 1.37,
                "average_time_formatted": "01:22",
                "percentage": 25.67
              },
              "awake": {
                "time_in_milli": 60000,
                "time_in_hours": 0.02,
                "time_formatted": "00:01",
                "average_time_in_hours": 0.02,
                "average_time_formatted": "00:01",
                "percentage": 0.313
              }
            },
            "sleep_performance_percentage": 69,
            "sleep_efficiency_percentage": 99.69,
            "avg_start_time": 534,
            "avg_start_time_formatted": "00:08",
            "avg_end_time": 19704,
            "avg_end_time_formatted": "05:28",
            "is_current_date": false
          },
          {
            "date": 1769471999,
            "value": 29515050,
            "avg_value": 0,
            "sleep_time_in_hours": 8.2,
            "sleep_time_formatted": "08:12",
            "avg_sleep_time_in_hours": 8.2,
            "avg_sleep_time_formatted": "08:12",
            "sleep_needed_in_hours": 7.53,
            "sleep_needed_formatted": "07:32",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 5702150,
                "time_in_hours": 1.58,
                "time_formatted": "01:35",
                "average_time_in_hours": 1.58,
                "average_time_formatted": "01:35",
                "percentage": 17.455
              },
              "light": {
                "time_in_milli": 18140760,
                "time_in_hours": 5.04,
                "time_formatted": "05:02",
                "average_time_in_hours": 5.04,
                "average_time_formatted": "05:02",
                "percentage": 55.531
              },
              "deep": {
                "time_in_milli": 5672140,
                "time_in_hours": 1.58,
                "time_formatted": "01:35",
                "average_time_in_hours": 1.58,
                "average_time_formatted": "01:35",
                "percentage": 17.363
              },
              "awake": {
                "time_in_milli": 3153040,
                "time_in_hours": 0.88,
                "time_formatted": "00:53",
                "average_time_in_hours": 0.88,
                "average_time_formatted": "00:53",
                "percentage": 9.652
              }
            },
            "sleep_performance_percentage": 78,
            "sleep_efficiency_percentage": 90.35,
            "avg_start_time": 72926,
            "avg_start_time_formatted": "20:15",
            "avg_end_time": 19194,
            "avg_end_time_formatted": "05:19",
            "is_current_date": false
          },
          {
            "date": 1769558399,
            "value": 31272960,
            "avg_value": 0,
            "sleep_time_in_hours": 8.69,
            "sleep_time_formatted": "08:41",
            "avg_sleep_time_in_hours": 4.34,
            "avg_sleep_time_formatted": "04:20",
            "sleep_needed_in_hours": 15.05,
            "sleep_needed_formatted": "15:03",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 6185200,
                "time_in_hours": 1.72,
                "time_formatted": "01:43",
                "average_time_in_hours": 0.86,
                "average_time_formatted": "00:52",
                "percentage": 15.825
              },
              "light": {
                "time_in_milli": 17280670,
                "time_in_hours": 4.8,
                "time_formatted": "04:48",
                "average_time_in_hours": 2.4,
                "average_time_formatted": "02:24",
                "percentage": 44.213
              },
              "deep": {
                "time_in_milli": 7807090,
                "time_in_hours": 2.17,
                "time_formatted": "02:10",
                "average_time_in_hours": 1.08,
                "average_time_formatted": "01:05",
                "percentage": 19.975
              },
              "awake": {
                "time_in_milli": 7812070,
                "time_in_hours": 2.17,
                "time_formatted": "02:10",
                "average_time_in_hours": 1.09,
                "average_time_formatted": "01:05",
                "percentage": 19.987
              }
            },
            "sleep_performance_percentage": 43.5,
            "sleep_efficiency_percentage": 84.12,
            "avg_start_time": 72955,
            "avg_start_time_formatted": "20:15",
            "avg_end_time": 6097,
            "avg_end_time_formatted": "01:41",
            "is_current_date": false
          },
          {
            "date": 1769644799,
            "value": 0,
            "avg_value": 0,
            "sleep_time_in_hours": 0,
            "sleep_time_formatted": "00:00",
            "avg_sleep_time_in_hours": 0,
            "avg_sleep_time_formatted": "00:00",
            "sleep_needed_in_hours": 0,
            "sleep_needed_formatted": "00:00",
            "avg_sleep_needed_in_hours": 0,
            "avg_sleep_needed_formatted": "00:00",
            "periods": {
              "rem": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "light": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "deep": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "awake": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              }
            },
            "sleep_performance_percentage": 0,
            "sleep_efficiency_percentage": 0,
            "avg_start_time": 0,
            "avg_start_time_formatted": "00:00",
            "avg_end_time": 0,
            "avg_end_time_formatted": "00:00",
            "is_current_date": false
          },
          {
            "date": 1769731199,
            "value": 42259680,
            "avg_value": 0,
            "sleep_time_in_hours": 11.74,
            "sleep_time_formatted": "11:44",
            "avg_sleep_time_in_hours": 5.87,
            "avg_sleep_time_formatted": "05:52",
            "sleep_needed_in_hours": 15.05,
            "sleep_needed_formatted": "15:03",
            "avg_sleep_needed_in_hours": 7.53,
            "avg_sleep_needed_formatted": "07:32",
            "periods": {
              "rem": {
                "time_in_milli": 6543150,
                "time_in_hours": 1.82,
                "time_formatted": "01:49",
                "average_time_in_hours": 0.91,
                "average_time_formatted": "00:55",
                "percentage": 14.306
              },
              "light": {
                "time_in_milli": 29504280,
                "time_in_hours": 8.2,
                "time_formatted": "08:12",
                "average_time_in_hours": 4.1,
                "average_time_formatted": "04:06",
                "percentage": 64.508
              },
              "deep": {
                "time_in_milli": 6212250,
                "time_in_hours": 1.73,
                "time_formatted": "01:44",
                "average_time_in_hours": 0.86,
                "average_time_formatted": "00:52",
                "percentage": 13.582
              },
              "awake": {
                "time_in_milli": 3422000,
                "time_in_hours": 0.95,
                "time_formatted": "00:57",
                "average_time_in_hours": 0.48,
                "average_time_formatted": "00:29",
                "percentage": 7.482
              }
            },
            "sleep_performance_percentage": 64.5,
            "sleep_efficiency_percentage": 91.93,
            "avg_start_time": 69245,
            "avg_start_time_formatted": "19:14",
            "avg_end_time": 5714,
            "avg_end_time_formatted": "01:35",
            "is_current_date": false
          },
          {
            "date": 1769817599,
            "value": 0,
            "avg_value": 0,
            "sleep_time_in_hours": 0,
            "sleep_time_formatted": "00:00",
            "avg_sleep_time_in_hours": 0,
            "avg_sleep_time_formatted": "00:00",
            "sleep_needed_in_hours": 0,
            "sleep_needed_formatted": "00:00",
            "avg_sleep_needed_in_hours": 0,
            "avg_sleep_needed_formatted": "00:00",
            "periods": {
              "rem": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "light": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "deep": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "awake": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              }
            },
            "sleep_performance_percentage": 0,
            "sleep_efficiency_percentage": 0,
            "avg_start_time": 0,
            "avg_start_time_formatted": "00:00",
            "avg_end_time": 0,
            "avg_end_time_formatted": "00:00",
            "is_current_date": true
          },
          {
            "date": 1769903999,
            "value": 0,
            "avg_value": 0,
            "sleep_time_in_hours": 0,
            "sleep_time_formatted": "00:00",
            "avg_sleep_time_in_hours": 0,
            "avg_sleep_time_formatted": "00:00",
            "sleep_needed_in_hours": 0,
            "sleep_needed_formatted": "00:00",
            "avg_sleep_needed_in_hours": 0,
            "avg_sleep_needed_formatted": "00:00",
            "periods": {
              "rem": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "light": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "deep": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              },
              "awake": {
                "time_in_milli": 0,
                "time_in_hours": 0,
                "time_formatted": "00:00",
                "average_time_in_hours": 0,
                "average_time_formatted": "00:00",
                "percentage": 0
              }
            },
            "sleep_performance_percentage": 0,
            "sleep_efficiency_percentage": 0,
            "avg_start_time": 0,
            "avg_start_time_formatted": "00:00",
            "avg_end_time": 0,
            "avg_end_time_formatted": "00:00",
            "is_current_date": false
          }
        ],
        "graph": {
          "daily": [
            {
              "date": 1769299199,
              "value": 21779840,
              "avg_value": 0,
              "sleep_time_in_hours": 6.05,
              "sleep_time_formatted": "06:03",
              "avg_sleep_time_in_hours": 6.05,
              "avg_sleep_time_formatted": "06:03",
              "sleep_needed_in_hours": 7.53,
              "sleep_needed_formatted": "07:32",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": { "time_in_milli": 4623210, "time_in_hours": 1.28, "time_formatted": "01:17", "average_time_in_hours": 1.28, "average_time_formatted": "01:17", "percentage": 19.807 },
                "light": { "time_in_milli": 12802440, "time_in_hours": 3.56, "time_formatted": "03:34", "average_time_in_hours": 3.56, "average_time_formatted": "03:34", "percentage": 54.85 },
                "deep": { "time_in_milli": 4354190, "time_in_hours": 1.21, "time_formatted": "01:13", "average_time_in_hours": 1.21, "average_time_formatted": "01:13", "percentage": 18.655 },
                "awake": { "time_in_milli": 1561060, "time_in_hours": 0.43, "time_formatted": "00:26", "average_time_in_hours": 0.43, "average_time_formatted": "00:26", "percentage": 6.688 }
              },
              "sleep_performance_percentage": 69,
              "sleep_efficiency_percentage": 93.31,
              "avg_start_time": 79879,
              "avg_start_time_formatted": "22:11",
              "avg_end_time": 16820,
              "avg_end_time_formatted": "04:40",
              "is_current_date": false
            },
            {
              "date": 1769385599,
              "value": 19110750,
              "avg_value": 0,
              "sleep_time_in_hours": 5.31,
              "sleep_time_formatted": "05:19",
              "avg_sleep_time_in_hours": 5.31,
              "avg_sleep_time_formatted": "05:19",
              "sleep_needed_in_hours": 7.53,
              "sleep_needed_formatted": "07:32",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": { "time_in_milli": 5880270, "time_in_hours": 1.63, "time_formatted": "01:38", "average_time_in_hours": 1.63, "average_time_formatted": "01:38", "percentage": 30.673 },
                "light": { "time_in_milli": 8309330, "time_in_hours": 2.31, "time_formatted": "02:19", "average_time_in_hours": 2.31, "average_time_formatted": "02:19", "percentage": 43.344 },
                "deep": { "time_in_milli": 4921150, "time_in_hours": 1.37, "time_formatted": "01:22", "average_time_in_hours": 1.37, "average_time_formatted": "01:22", "percentage": 25.67 },
                "awake": { "time_in_milli": 60000, "time_in_hours": 0.02, "time_formatted": "00:01", "average_time_in_hours": 0.02, "average_time_formatted": "00:01", "percentage": 0.313 }
              },
              "sleep_performance_percentage": 69,
              "sleep_efficiency_percentage": 99.69,
              "avg_start_time": 534,
              "avg_start_time_formatted": "00:08",
              "avg_end_time": 19704,
              "avg_end_time_formatted": "05:28",
              "is_current_date": false
            },
            {
              "date": 1769471999,
              "value": 29515050,
              "avg_value": 0,
              "sleep_time_in_hours": 8.2,
              "sleep_time_formatted": "08:12",
              "avg_sleep_time_in_hours": 8.2,
              "avg_sleep_time_formatted": "08:12",
              "sleep_needed_in_hours": 7.53,
              "sleep_needed_formatted": "07:32",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": { "time_in_milli": 5702150, "time_in_hours": 1.58, "time_formatted": "01:35", "average_time_in_hours": 1.58, "average_time_formatted": "01:35", "percentage": 17.455 },
                "light": { "time_in_milli": 18140760, "time_in_hours": 5.04, "time_formatted": "05:02", "average_time_in_hours": 5.04, "average_time_formatted": "05:02", "percentage": 55.531 },
                "deep": { "time_in_milli": 5672140, "time_in_hours": 1.58, "time_formatted": "01:35", "average_time_in_hours": 1.58, "average_time_formatted": "01:35", "percentage": 17.363 },
                "awake": { "time_in_milli": 3153040, "time_in_hours": 0.88, "time_formatted": "00:53", "average_time_in_hours": 0.88, "average_time_formatted": "00:53", "percentage": 9.652 }
              },
              "sleep_performance_percentage": 78,
              "sleep_efficiency_percentage": 90.35,
              "avg_start_time": 72926,
              "avg_start_time_formatted": "20:15",
              "avg_end_time": 19194,
              "avg_end_time_formatted": "05:19",
              "is_current_date": false
            },
            {
              "date": 1769558399,
              "value": 31272960,
              "avg_value": 0,
              "sleep_time_in_hours": 8.69,
              "sleep_time_formatted": "08:41",
              "avg_sleep_time_in_hours": 4.34,
              "avg_sleep_time_formatted": "04:20",
              "sleep_needed_in_hours": 15.05,
              "sleep_needed_formatted": "15:03",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": { "time_in_milli": 6185200, "time_in_hours": 1.72, "time_formatted": "01:43", "average_time_in_hours": 0.86, "average_time_formatted": "00:52", "percentage": 15.825 },
                "light": { "time_in_milli": 17280670, "time_in_hours": 4.8, "time_formatted": "04:48", "average_time_in_hours": 2.4, "average_time_formatted": "02:24", "percentage": 44.213 },
                "deep": { "time_in_milli": 7807090, "time_in_hours": 2.17, "time_formatted": "02:10", "average_time_in_hours": 1.08, "average_time_formatted": "01:05", "percentage": 19.975 },
                "awake": { "time_in_milli": 7812070, "time_in_hours": 2.17, "time_formatted": "02:10", "average_time_in_hours": 1.09, "average_time_formatted": "01:05", "percentage": 19.987 }
              },
              "sleep_performance_percentage": 43.5,
              "sleep_efficiency_percentage": 84.12,
              "avg_start_time": 72955,
              "avg_start_time_formatted": "20:15",
              "avg_end_time": 6097,
              "avg_end_time_formatted": "01:41",
              "is_current_date": false
            },
            {
              "date": 1769644799,
              "value": 0,
              "avg_value": 0,
              "sleep_time_in_hours": 0,
              "sleep_time_formatted": "00:00",
              "avg_sleep_time_in_hours": 0,
              "avg_sleep_time_formatted": "00:00",
              "sleep_needed_in_hours": 0,
              "sleep_needed_formatted": "00:00",
              "avg_sleep_needed_in_hours": 0,
              "avg_sleep_needed_formatted": "00:00",
              "periods": {
                "rem": { "time_in_milli": 0, "time_in_hours": 0, "time_formatted": "00:00", "average_time_in_hours": 0, "average_time_formatted": "00:00", "percentage": 0 },
                "light": { "time_in_milli": 0, "time_in_hours": 0, "time_formatted": "00:00", "average_time_in_hours": 0, "average_time_formatted": "00:00", "percentage": 0 },
                "deep": { "time_in_milli": 0, "time_in_hours": 0, "time_formatted": "00:00", "average_time_in_hours": 0, "average_time_formatted": "00:00", "percentage": 0 },
                "awake": { "time_in_milli": 0, "time_in_hours": 0, "time_formatted": "00:00", "average_time_in_hours": 0, "average_time_formatted": "00:00", "percentage": 0 }
              },
              "sleep_performance_percentage": 0,
              "sleep_efficiency_percentage": 0,
              "avg_start_time": 0,
              "avg_start_time_formatted": "00:00",
              "avg_end_time": 0,
              "avg_end_time_formatted": "00:00",
              "is_current_date": false
            },
            {
              "date": 1769731199,
              "value": 42259680,
              "avg_value": 0,
              "sleep_time_in_hours": 11.74,
              "sleep_time_formatted": "11:44",
              "avg_sleep_time_in_hours": 5.87,
              "avg_sleep_time_formatted": "05:52",
              "sleep_needed_in_hours": 15.05,
              "sleep_needed_formatted": "15:03",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": { "time_in_milli": 6543150, "time_in_hours": 1.82, "time_formatted": "01:49", "average_time_in_hours": 0.91, "average_time_formatted": "00:55", "percentage": 14.306 },
                "light": { "time_in_milli": 29504280, "time_in_hours": 8.2, "time_formatted": "08:12", "average_time_in_hours": 4.1, "average_time_formatted": "04:06", "percentage": 64.508 },
                "deep": { "time_in_milli": 6212250, "time_in_hours": 1.73, "time_formatted": "01:44", "average_time_in_hours": 0.86, "average_time_formatted": "00:52", "percentage": 13.582 },
                "awake": { "time_in_milli": 3422000, "time_in_hours": 0.95, "time_formatted": "00:57", "average_time_in_hours": 0.48, "average_time_formatted": "00:29", "percentage": 7.482 }
              },
              "sleep_performance_percentage": 64.5,
              "sleep_efficiency_percentage": 91.93,
              "avg_start_time": 69245,
              "avg_start_time_formatted": "19:14",
              "avg_end_time": 5714,
              "avg_end_time_formatted": "01:35",
              "is_current_date": false
            },
            {
              "date": 1769817599,
              "value": 0,
              "avg_value": 0,
              "sleep_time_in_hours": 0,
              "sleep_time_formatted": "00:00",
              "avg_sleep_time_in_hours": 0,
              "avg_sleep_time_formatted": "00:00",
              "sleep_needed_in_hours": 0,
              "sleep_needed_formatted": "00:00",
              "avg_sleep_needed_in_hours": 0,
              "avg_sleep_needed_formatted": "00:00",
              "periods": {
                "rem": { "time_in_milli": 0, "time_in_hours": 0, "time_formatted": "00:00", "average_time_in_hours": 0, "average_time_formatted": "00:00", "percentage": 0 },
                "light": { "time_in_milli": 0, "time_in_hours": 0, "time_formatted": "00:00", "average_time_in_hours": 0, "average_time_formatted": "00:00", "percentage": 0 },
                "deep": { "time_in_milli": 0, "time_in_hours": 0, "time_formatted": "00:00", "average_time_in_hours": 0, "average_time_formatted": "00:00", "percentage": 0 },
                "awake": { "time_in_milli": 0, "time_in_hours": 0, "time_formatted": "00:00", "average_time_in_hours": 0, "average_time_formatted": "00:00", "percentage": 0 }
              },
              "sleep_performance_percentage": 0,
              "sleep_efficiency_percentage": 0,
              "avg_start_time": 0,
              "avg_start_time_formatted": "00:00",
              "avg_end_time": 0,
              "avg_end_time_formatted": "00:00",
              "is_current_date": true
            }
          ],
          "weekly": [],
          "monthly": []
        }
      }
    }
    """
}
