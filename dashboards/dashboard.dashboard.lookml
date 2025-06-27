---
- dashboard: weatherdashboard
  title: weatherDashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Cu8nJZ80jyeXgVgcyEMPAM
  elements:
  - title: weatherDashboard
    name: weatherDashboard
    model: datumo-training
    explore: weather_measurements
    type: looker_google_map
    fields: [weather_stations.state, weather_measurements.created_month, weather_stations.name,
      weather_stations.location, weather_measurements.max_temperature]
    filters: {}
    limit: 5
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      weather_measurements.total_precipitation:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    hide_totals: false
    hide_row_totals: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      State: weather_stations.state
    row: 0
    col: 0
    width: 24
    height: 12
  - title: Untitled
    name: Untitled
    model: datumo-training
    explore: weather_measurements
    type: looker_line
    fields: [weather_stations.name, weather_measurements.created_month, weather_measurements.max_temperature,
      weather_measurements.min_temperature]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      State: weather_stations.state
    row: 12
    col: 0
    width: 8
    height: 6
  - title: Untitled
    name: Untitled (2)
    model: datumo-training
    explore: weather_measurements
    type: looker_grid
    fields: [weather_stations.name, weather_measurements.total_precipitation]
    filters:
      weather_measurements.total_precipitation: NOT NULL
    limit: 5
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      State: weather_stations.state
    row: 12
    col: 8
    width: 8
    height: 6
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: NY
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: datumo-training
    explore: weather_measurements
    listens_to_filters: []
    field: weather_stations.state
