include: "/views/weather_stations.view"
include: "/views/weather_measurements.view"

explore: weather_measurements {
  description: "Explore weather measurements data combined with weather stations information. Allows analysis of temperature and precipitation data across different locations and time periods."

  join: weather_stations {
    type: left_outer
    relationship: many_to_one
    sql_on: ${weather_measurements.id} = ${weather_stations.id} ;;
  }
}
