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
          },
          {
            "date": 1769990399,
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
            }
          ],
          "weekly": [
            {
              "date": 1765756800,
              "value": 160242590,
              "avg_value": 0,
              "sleep_time_in_hours": 44.51,
              "sleep_time_formatted": "44:31",
              "avg_sleep_time_in_hours": 6.36,
              "avg_sleep_time_formatted": "06:22",
              "sleep_needed_in_hours": 52.69,
              "sleep_needed_formatted": "52:41",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 39822320,
                  "time_in_hours": 11.06,
                  "time_formatted": "11:04",
                  "average_time_in_hours": 1.58,
                  "average_time_formatted": "01:35",
                  "percentage": 22.649
                },
                "light": {
                  "time_in_milli": 91221130,
                  "time_in_hours": 25.34,
                  "time_formatted": "25:20",
                  "average_time_in_hours": 3.62,
                  "average_time_formatted": "03:37",
                  "percentage": 51.883
                },
                "deep": {
                  "time_in_milli": 29199140,
                  "time_in_hours": 8.11,
                  "time_formatted": "08:07",
                  "average_time_in_hours": 1.16,
                  "average_time_formatted": "01:10",
                  "percentage": 16.607
                },
                "awake": {
                  "time_in_milli": 15366410,
                  "time_in_hours": 4.27,
                  "time_formatted": "04:16",
                  "average_time_in_hours": 0.61,
                  "average_time_formatted": "00:37",
                  "percentage": 8.74
                }
              },
              "sleep_performance_percentage": 71.14,
              "sleep_efficiency_percentage": 92.82,
              "avg_start_time": 73839,
              "avg_start_time_formatted": "20:30",
              "avg_end_time": 12666,
              "avg_end_time_formatted": "03:31",
              "is_current_date": false
            },
            {
              "date": 1766361600,
              "value": 104757759,
              "avg_value": 0,
              "sleep_time_in_hours": 29.1,
              "sleep_time_formatted": "29:06",
              "avg_sleep_time_in_hours": 4.85,
              "avg_sleep_time_formatted": "04:51",
              "sleep_needed_in_hours": 45.16,
              "sleep_needed_formatted": "45:10",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 19448010,
                  "time_in_hours": 5.4,
                  "time_formatted": "05:24",
                  "average_time_in_hours": 0.9,
                  "average_time_formatted": "00:54",
                  "percentage": 16.614
                },
                "light": {
                  "time_in_milli": 60369739,
                  "time_in_hours": 16.77,
                  "time_formatted": "16:46",
                  "average_time_in_hours": 2.79,
                  "average_time_formatted": "02:47",
                  "percentage": 51.572
                },
                "deep": {
                  "time_in_milli": 24940010,
                  "time_in_hours": 6.93,
                  "time_formatted": "06:56",
                  "average_time_in_hours": 1.15,
                  "average_time_formatted": "01:09",
                  "percentage": 21.305
                },
                "awake": {
                  "time_in_milli": 12131500,
                  "time_in_hours": 3.37,
                  "time_formatted": "03:22",
                  "average_time_in_hours": 0.56,
                  "average_time_formatted": "00:34",
                  "percentage": 10.364
                }
              },
              "sleep_performance_percentage": 57.5,
              "sleep_efficiency_percentage": 88.69,
              "avg_start_time": 76240,
              "avg_start_time_formatted": "21:10",
              "avg_end_time": 9339,
              "avg_end_time_formatted": "02:35",
              "is_current_date": false
            },
            {
              "date": 1766966400,
              "value": 104318740,
              "avg_value": 0,
              "sleep_time_in_hours": 28.98,
              "sleep_time_formatted": "28:59",
              "avg_sleep_time_in_hours": 4.14,
              "avg_sleep_time_formatted": "04:08",
              "sleep_needed_in_hours": 52.69,
              "sleep_needed_formatted": "52:41",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 13924480,
                  "time_in_hours": 3.87,
                  "time_formatted": "03:52",
                  "average_time_in_hours": 0.55,
                  "average_time_formatted": "00:33",
                  "percentage": 11.923
                },
                "light": {
                  "time_in_milli": 65032370,
                  "time_in_hours": 18.06,
                  "time_formatted": "18:04",
                  "average_time_in_hours": 2.58,
                  "average_time_formatted": "02:35",
                  "percentage": 55.687
                },
                "deep": {
                  "time_in_milli": 25361890,
                  "time_in_hours": 7.04,
                  "time_formatted": "07:02",
                  "average_time_in_hours": 1.01,
                  "average_time_formatted": "01:01",
                  "percentage": 21.717
                },
                "awake": {
                  "time_in_milli": 12429440,
                  "time_in_hours": 3.45,
                  "time_formatted": "03:27",
                  "average_time_in_hours": 0.49,
                  "average_time_formatted": "00:29",
                  "percentage": 10.643
                }
              },
              "sleep_performance_percentage": 42.43,
              "sleep_efficiency_percentage": 86.32,
              "avg_start_time": 75153,
              "avg_start_time_formatted": "20:52",
              "avg_end_time": 6893,
              "avg_end_time_formatted": "01:54",
              "is_current_date": false
            },
            {
              "date": 1767571200,
              "value": 120577660,
              "avg_value": 0,
              "sleep_time_in_hours": 33.49,
              "sleep_time_formatted": "33:29",
              "avg_sleep_time_in_hours": 5.58,
              "avg_sleep_time_formatted": "05:35",
              "sleep_needed_in_hours": 45.16,
              "sleep_needed_formatted": "45:10",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 26291140,
                  "time_in_hours": 7.3,
                  "time_formatted": "07:18",
                  "average_time_in_hours": 1.22,
                  "average_time_formatted": "01:13",
                  "percentage": 20.024
                },
                "light": {
                  "time_in_milli": 71091210,
                  "time_in_hours": 19.75,
                  "time_formatted": "19:45",
                  "average_time_in_hours": 3.29,
                  "average_time_formatted": "03:17",
                  "percentage": 54.145
                },
                "deep": {
                  "time_in_milli": 23195310,
                  "time_in_hours": 6.44,
                  "time_formatted": "06:26",
                  "average_time_in_hours": 1.07,
                  "average_time_formatted": "01:04",
                  "percentage": 17.666
                },
                "awake": {
                  "time_in_milli": 10719280,
                  "time_in_hours": 2.98,
                  "time_formatted": "02:59",
                  "average_time_in_hours": 0.5,
                  "average_time_formatted": "00:30",
                  "percentage": 8.164
                }
              },
              "sleep_performance_percentage": 63.5,
              "sleep_efficiency_percentage": 91.47,
              "avg_start_time": 64604,
              "avg_start_time_formatted": "17:56",
              "avg_end_time": 86212,
              "avg_end_time_formatted": "23:56",
              "is_current_date": false
            },
            {
              "date": 1768176000,
              "value": 118213640,
              "avg_value": 0,
              "sleep_time_in_hours": 32.84,
              "sleep_time_formatted": "32:50",
              "avg_sleep_time_in_hours": 5.47,
              "avg_sleep_time_formatted": "05:28",
              "sleep_needed_in_hours": 45.16,
              "sleep_needed_formatted": "45:10",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 24607200,
                  "time_in_hours": 6.84,
                  "time_formatted": "06:50",
                  "average_time_in_hours": 1.14,
                  "average_time_formatted": "01:08",
                  "percentage": 18.491
                },
                "light": {
                  "time_in_milli": 71187780,
                  "time_in_hours": 19.77,
                  "time_formatted": "19:46",
                  "average_time_in_hours": 3.3,
                  "average_time_formatted": "03:18",
                  "percentage": 53.495
                },
                "deep": {
                  "time_in_milli": 22418660,
                  "time_in_hours": 6.23,
                  "time_formatted": "06:14",
                  "average_time_in_hours": 1.04,
                  "average_time_formatted": "01:02",
                  "percentage": 16.847
                },
                "awake": {
                  "time_in_milli": 14859560,
                  "time_in_hours": 4.13,
                  "time_formatted": "04:08",
                  "average_time_in_hours": 0.69,
                  "average_time_formatted": "00:41",
                  "percentage": 11.166
                }
              },
              "sleep_performance_percentage": 57.33,
              "sleep_efficiency_percentage": 89.49,
              "avg_start_time": 74155,
              "avg_start_time_formatted": "20:35",
              "avg_end_time": 9957,
              "avg_end_time_formatted": "02:45",
              "is_current_date": false
            },
            {
              "date": 1768780800,
              "value": 100060680,
              "avg_value": 0,
              "sleep_time_in_hours": 27.79,
              "sleep_time_formatted": "27:47",
              "avg_sleep_time_in_hours": 5.56,
              "avg_sleep_time_formatted": "05:34",
              "sleep_needed_in_hours": 37.63,
              "sleep_needed_formatted": "37:38",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 25304110,
                  "time_in_hours": 7.03,
                  "time_formatted": "07:02",
                  "average_time_in_hours": 1.41,
                  "average_time_formatted": "01:25",
                  "percentage": 23.812
                },
                "light": {
                  "time_in_milli": 53740980,
                  "time_in_hours": 14.93,
                  "time_formatted": "14:56",
                  "average_time_in_hours": 2.99,
                  "average_time_formatted": "02:59",
                  "percentage": 50.572
                },
                "deep": {
                  "time_in_milli": 21015590,
                  "time_in_hours": 5.84,
                  "time_formatted": "05:50",
                  "average_time_in_hours": 1.17,
                  "average_time_formatted": "01:10",
                  "percentage": 19.776
                },
                "awake": {
                  "time_in_milli": 6206200,
                  "time_in_hours": 1.72,
                  "time_formatted": "01:43",
                  "average_time_in_hours": 0.34,
                  "average_time_formatted": "00:20",
                  "percentage": 5.84
                }
              },
              "sleep_performance_percentage": 59.2,
              "sleep_efficiency_percentage": 93.6,
              "avg_start_time": 81545,
              "avg_start_time_formatted": "22:39",
              "avg_end_time": 16368,
              "avg_end_time_formatted": "04:32",
              "is_current_date": false
            },
            {
              "date": 1769385600,
              "value": 103047690,
              "avg_value": 0,
              "sleep_time_in_hours": 28.62,
              "sleep_time_formatted": "28:37",
              "avg_sleep_time_in_hours": 5.72,
              "avg_sleep_time_formatted": "05:43",
              "sleep_needed_in_hours": 37.63,
              "sleep_needed_formatted": "37:38",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 18430500,
                  "time_in_hours": 5.12,
                  "time_formatted": "05:07",
                  "average_time_in_hours": 1.02,
                  "average_time_formatted": "01:01",
                  "percentage": 15.687
                },
                "light": {
                  "time_in_milli": 64925710,
                  "time_in_hours": 18.03,
                  "time_formatted": "18:02",
                  "average_time_in_hours": 3.61,
                  "average_time_formatted": "03:37",
                  "percentage": 55.26
                },
                "deep": {
                  "time_in_milli": 19691480,
                  "time_in_hours": 5.47,
                  "time_formatted": "05:28",
                  "average_time_in_hours": 1.09,
                  "average_time_formatted": "01:05",
                  "percentage": 16.76
                },
                "awake": {
                  "time_in_milli": 14387110,
                  "time_in_hours": 4,
                  "time_formatted": "04:00",
                  "average_time_in_hours": 0.8,
                  "average_time_formatted": "00:48",
                  "percentage": 12.245
                }
              },
              "sleep_performance_percentage": 58.8,
              "sleep_efficiency_percentage": 88.49,
              "avg_start_time": 71451,
              "avg_start_time_formatted": "19:50",
              "avg_end_time": 8815,
              "avg_end_time_formatted": "02:26",
              "is_current_date": true
            }
          ],
          "monthly": [
            {
              "date": 1751328000,
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
              "date": 1754006400,
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
              "date": 1756684800,
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
              "date": 1759276800,
              "value": 390957146,
              "avg_value": 0,
              "sleep_time_in_hours": 108.6,
              "sleep_time_formatted": "108:36",
              "avg_sleep_time_in_hours": 6.03,
              "avg_sleep_time_formatted": "06:02",
              "sleep_needed_in_hours": 135.51,
              "sleep_needed_formatted": "135:31",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 77848410,
                  "time_in_hours": 21.62,
                  "time_formatted": "21:37",
                  "average_time_in_hours": 1.2,
                  "average_time_formatted": "01:12",
                  "percentage": 18.419
                },
                "light": {
                  "time_in_milli": 243358446,
                  "time_in_hours": 67.6,
                  "time_formatted": "67:36",
                  "average_time_in_hours": 3.76,
                  "average_time_formatted": "03:46",
                  "percentage": 57.577
                },
                "deep": {
                  "time_in_milli": 69750290,
                  "time_in_hours": 19.38,
                  "time_formatted": "19:23",
                  "average_time_in_hours": 1.08,
                  "average_time_formatted": "01:05",
                  "percentage": 16.503
                },
                "awake": {
                  "time_in_milli": 31456989,
                  "time_in_hours": 8.74,
                  "time_formatted": "08:44",
                  "average_time_in_hours": 0.49,
                  "average_time_formatted": "00:29",
                  "percentage": 7.443
                }
              },
              "sleep_performance_percentage": 72.67,
              "sleep_efficiency_percentage": 93.2,
              "avg_start_time": 74066,
              "avg_start_time_formatted": "20:34",
              "avg_end_time": 11307,
              "avg_end_time_formatted": "03:08",
              "is_current_date": false
            },
            {
              "date": 1761955200,
              "value": 376302353,
              "avg_value": 0,
              "sleep_time_in_hours": 104.53,
              "sleep_time_formatted": "104:32",
              "avg_sleep_time_in_hours": 6.53,
              "avg_sleep_time_formatted": "06:32",
              "sleep_needed_in_hours": 120.44,
              "sleep_needed_formatted": "120:26",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 76676340,
                  "time_in_hours": 21.3,
                  "time_formatted": "21:18",
                  "average_time_in_hours": 1.33,
                  "average_time_formatted": "01:20",
                  "percentage": 18.716
                },
                "light": {
                  "time_in_milli": 231266533,
                  "time_in_hours": 64.24,
                  "time_formatted": "64:14",
                  "average_time_in_hours": 4.02,
                  "average_time_formatted": "04:01",
                  "percentage": 56.451
                },
                "deep": {
                  "time_in_milli": 68359480,
                  "time_in_hours": 18.99,
                  "time_formatted": "18:59",
                  "average_time_in_hours": 1.19,
                  "average_time_formatted": "01:11",
                  "percentage": 16.686
                },
                "awake": {
                  "time_in_milli": 33104110,
                  "time_in_hours": 9.2,
                  "time_formatted": "09:12",
                  "average_time_in_hours": 0.57,
                  "average_time_formatted": "00:34",
                  "percentage": 8.081
                }
              },
              "sleep_performance_percentage": 65.25,
              "sleep_efficiency_percentage": 92.12,
              "avg_start_time": 73751,
              "avg_start_time_formatted": "20:29",
              "avg_end_time": 13442,
              "avg_end_time_formatted": "03:44",
              "is_current_date": false
            },
            {
              "date": 1764547200,
              "value": 599055106,
              "avg_value": 0,
              "sleep_time_in_hours": 166.4,
              "sleep_time_formatted": "166:24",
              "avg_sleep_time_in_hours": 5.74,
              "avg_sleep_time_formatted": "05:44",
              "sleep_needed_in_hours": 218.28,
              "sleep_needed_formatted": "218:17",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 129997580,
                  "time_in_hours": 36.11,
                  "time_formatted": "36:07",
                  "average_time_in_hours": 1.25,
                  "average_time_formatted": "01:15",
                  "percentage": 19.845
                },
                "light": {
                  "time_in_milli": 345504896,
                  "time_in_hours": 95.97,
                  "time_formatted": "95:58",
                  "average_time_in_hours": 3.31,
                  "average_time_formatted": "03:19",
                  "percentage": 52.743
                },
                "deep": {
                  "time_in_milli": 123552630,
                  "time_in_hours": 34.32,
                  "time_formatted": "34:19",
                  "average_time_in_hours": 1.18,
                  "average_time_formatted": "01:11",
                  "percentage": 18.861
                },
                "awake": {
                  "time_in_milli": 55556210,
                  "time_in_hours": 15.43,
                  "time_formatted": "15:26",
                  "average_time_in_hours": 0.53,
                  "average_time_formatted": "00:32",
                  "percentage": 8.481
                }
              },
              "sleep_performance_percentage": 64.34,
              "sleep_efficiency_percentage": 91.45,
              "avg_start_time": 73896,
              "avg_start_time_formatted": "20:31",
              "avg_end_time": 10754,
              "avg_end_time_formatted": "02:59",
              "is_current_date": false
            },
            {
              "date": 1767225600,
              "value": 515521370,
              "avg_value": 0,
              "sleep_time_in_hours": 143.2,
              "sleep_time_formatted": "143:12",
              "avg_sleep_time_in_hours": 5.3,
              "avg_sleep_time_formatted": "05:18",
              "sleep_needed_in_hours": 203.21,
              "sleep_needed_formatted": "203:13",
              "avg_sleep_needed_in_hours": 7.53,
              "avg_sleep_needed_formatted": "07:32",
              "periods": {
                "rem": {
                  "time_in_milli": 102976280,
                  "time_in_hours": 28.6,
                  "time_formatted": "28:36",
                  "average_time_in_hours": 1.06,
                  "average_time_formatted": "01:04",
                  "percentage": 18.091
                },
                "light": {
                  "time_in_milli": 308727450,
                  "time_in_hours": 85.76,
                  "time_formatted": "85:46",
                  "average_time_in_hours": 3.18,
                  "average_time_formatted": "03:11",
                  "percentage": 54.238
                },
                "deep": {
                  "time_in_milli": 103817640,
                  "time_in_hours": 28.84,
                  "time_formatted": "28:50",
                  "average_time_in_hours": 1.07,
                  "average_time_formatted": "01:04",
                  "percentage": 18.239
                },
                "awake": {
                  "time_in_milli": 53599480,
                  "time_in_hours": 14.89,
                  "time_formatted": "14:53",
                  "average_time_in_hours": 0.55,
                  "average_time_formatted": "00:33",
                  "percentage": 9.416
                }
              },
              "sleep_performance_percentage": 56.7,
              "sleep_efficiency_percentage": 90.12,
              "avg_start_time": 73673,
              "avg_start_time_formatted": "20:27",
              "avg_end_time": 8422,
              "avg_end_time_formatted": "02:20",
              "is_current_date": true
            }
          ]
        }
      }
    }
    """
}
