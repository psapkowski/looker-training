view: weather_measurements {
  sql_table_name: `bigquery-public-data.ghcn_d.ghcnd_2025` ;;

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
    description: "Weather station identifier"
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.id, ${TABLE}.date) ;;
    description: "Unique identifier for each measurement (combination of station ID and date)"
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: parse_timestamp("%Y-%m-%d%H%M",concat(${TABLE}.date,case when ${TABLE}.time = '2400' then '0000' else ${TABLE}.time end)) ;;
    description: "Timestamp of the measurement"
  }

  dimension: element {
    hidden: yes
    type: string
    sql: ${TABLE}.element ;;
    description: "Type of measurement (PRCP, TMAX, TMIN)"
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
    description: "Raw measurement value"
  }

  measure: count {
    type: count
    description: "Total number of measurements"
  }

  measure: total_precipitation {
    type: sum
    sql: ${value}/10.0 ;;
    filters: [element: "PRCP"]
    description: "Total precipitation in millimeters"
  }

  measure: max_temperature {
    type: average
    sql: ${value}/10.0 ;;
    filters: [element: "TMAX"]
    description: "Maximum temperature in Celsius"
  }

  measure: min_temperature {
    type: average
    sql: ${value}/10.0 ;;
    filters: [element: "TMIN"]
    description: "Minimum temperature in Celsius"
  }
}
