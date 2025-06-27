  view: weather_stations {
    sql_table_name: bigquery-public-data.ghcn_d.ghcnd_stations ;;

    dimension: id {
      primary_key: yes
      hidden: yes
      sql: ${TABLE}.id ;;
      type: string
      description: "Unikalny identyfikator stacji."
    }

    dimension: name {
      sql: ${TABLE}.name ;;
      type: string
      description: "Nazwa stacji pogodowej."
    }

    dimension: location {
      sql: CONCAT(${TABLE}.latitude, ', ', ${TABLE}.longitude) ;;
      type: string
      description: "Lokalizacja stacji w formacie 'lat, lon'."
    }

    dimension: elevation {
      sql: ${TABLE}.elevation ;;
      type: number
      description: "Wysokość nad poziomem morza."
    }

    dimension: state {
      sql: ${TABLE}.state ;;
      type: string
      description: "Stan, w którym znajduje się stacja."
    }

    measure: count {
      type: count
      description: "Liczba rekordów stacji."
    }
  }
