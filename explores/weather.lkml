include: "/views/weather_stations.view.lkml"
include: "/views/weather_measurements.view.lkml"

explore: weather_stations {
  description: "Eksploracja danych pogodowych, łącząca stacje i pomiary."
  join: weather_measurements {
    type: left_outer
    relationship: one_to_many
    sql_on: ${weather_stations.id} = ${weather_measurements.id} ;;
  }
}
