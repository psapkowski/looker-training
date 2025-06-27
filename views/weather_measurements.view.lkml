view: weather_measurements {
  sql_table_name: bigquery-public-data.ghcn_d.ghcnd_2025 ;;

  dimension: id {
    sql: ${TABLE}.id ;;
    type: string
    primary_key: yes
    hidden: yes
    description: "Unikalny identyfikator pomiaru."
  }

  dimension: primary_key {
    sql: CONCAT(${TABLE}.id, ${TABLE}.created_date) ;;
    type: string
    primary_key: yes
    hidden: yes
    description: "Kombinacja id i created_date jako klucz główny."
  }

  dimension_group: created {
    type: time
    sql: PARSE_TIMESTAMP("%Y-%m-%d%H%M", CONCAT(${TABLE}.date, CASE WHEN ${TABLE}.time = '2400' THEN '0000' ELSE ${TABLE}.time END)) ;;
    description: "Data i czas utworzenia pomiaru."
    group_label: "created"
    timeframes: ["raw", "week", "month"]
  }

  dimension: element {
    sql: ${TABLE}.element ;;
    type: string
    hidden: yes
    description: "Typ elementu pomiaru (np. TMAX, TMIN, PRCP)."
  }

  dimension: value {
    sql: ${TABLE}.value ;;
    type: number
    hidden: yes
    description: "Wartość pomiaru."
  }

  measure: count {
    type: count
    description: "Liczba pomiarów."
  }

  measure: total_precipitation {
    type: sum
    sql: ${value} / 10 ;;
    description: "Suma opadów (przeliczona na odpowiednią jednostkę)."
    filters: {
      field: element
      value: "PRCP"
    }
  }

  measure: max_temperature {
    type: max
    sql: ${value} / 10 ;;
    description: "Maksymalna temperatura (przeliczona)."
    filters: {
      field: element
      value: "TMAX"
    }
  }

  measure: min_temperature {
    type: min
    sql: ${value} / 10 ;;
    description: "Minimalna temperatura (przeliczona)."
    filters: {
      field: element
      value: "TMIN"
    }
  }
}
