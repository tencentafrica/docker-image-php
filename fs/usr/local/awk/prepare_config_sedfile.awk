{
    name = substr($0, 1, index($0, "=") - 1);
    value = substr($0, index($0, "=") + 1);

    if (name == "MEMORY_LIMIT") {
        if (match(value, /[G|M]$/) < 1) {
            value = value "M";
        }
    }

    if (name == "PM_STATUS_HOSTS_ALLOWED" || name == "PM_STATUS_HOSTS_DENIED") {
        if (name == "PM_STATUS_HOSTS_ALLOWED") prefix = "allow"; else prefix = "deny";

        output = ""
        for (i = 1; i <= split(value, value_array, " "); i++) {
            output = output prefix " " gensub(/([\/&])/, "\\\\" "\\1", "g", value_array[i]) ";\\\n    "
        }
        value = output
    } else {
        value = gensub(/([\/&])/, "\\\\" "\\1", "g", value);
    }

    print "s/{{ " name " }}/" value "/g";
}
