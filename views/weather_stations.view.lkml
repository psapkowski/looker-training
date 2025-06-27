view: weather_stations {
  sql_table_name: `bigquery-public-data.ghcn_d.ghcnd_stations` ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
    description: "Unique identifier for each weather station"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "Name of the weather station"
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
    description: "Geographical coordinates of the weather station"
  }

  dimension: elevation {
    type: number
    sql: ${TABLE}.elevation ;;
    description: "Elevation above sea level in meters"
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    description: "State or region where the weather station is located"
  }

  measure: count {
    type: count
    description: "Total number of weather stations"
  }
}
