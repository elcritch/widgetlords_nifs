proc widgetlords_steinhart_hart*(r_room: cdouble; r_beta: cdouble;
                                counts_range: uint16_t; counts: uint16_t): cdouble {.
    cdecl, importc: "widgetlords_steinhart_hart", header: "widgetlords.h".}
proc widgetlords_counts_to_value*(counts: uint16_t; zero_counts: uint16_t;
                                 range_counts: uint16_t; zero: cdouble;
                                 range: cdouble): cdouble {.cdecl,
    importc: "widgetlords_counts_to_value", header: "widgetlords.h".}