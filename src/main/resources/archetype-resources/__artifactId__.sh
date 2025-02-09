#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$SCRIPT_DIR/config"
PROPERTIES_FILE="$CONFIG_DIR/properties.sh"

# Check if properties file exists, if not create it
if [ ! -f "$PROPERTIES_FILE" ]; then
    mkdir -p "$CONFIG_DIR" 2>/dev/null
    echo "# Add your properties here." > "$PROPERTIES_FILE"
    echo "Warning: Check your settings in $PROPERTIES_FILE before first run."
    exit 1
fi

# Source the properties file
source "$PROPERTIES_FILE"

# Run the Java application with classpath parameter and all passed arguments
java -cp "$CONFIG_DIR:$SCRIPT_DIR/target/classes:$SCRIPT_DIR/target/dependency/*" foobar.AppMain "$@"

