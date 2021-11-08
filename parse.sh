jq  --raw-output '.[] | (.aliases[0] + "," + .emoji)'|grep -v ',$'|awk 'gsub(",", sprintf("%*s", 25 - length($0), ""))'
