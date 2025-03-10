#!/usr/bin/env sh
# ...existing code...
DIRNAME=$(dirname "$0")
APP_HOME="$DIRNAME"
APP_BASE_NAME=$(basename "$0")
GRADLE_WRAPPER_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

# Use JAVA_HOME if set, otherwise fall back to java in PATH
if [ -n "$JAVA_HOME" ]; then
    JAVA_EXE="$JAVA_HOME/bin/java"
else
    JAVA_EXE=java
fi

# Ensure java is available
if ! command -v "$JAVA_EXE" >/dev/null 2>&1; then
    echo "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH." >&2
    exit 1
fi

# Execute Gradle
exec "$JAVA_EXE" ${DEFAULT_JVM_OPTS:=""} ${JAVA_OPTS:=""} ${GRADLE_OPTS:=""} \
  -Dorg.gradle.appname="$APP_BASE_NAME" \
  -classpath "$GRADLE_WRAPPER_JAR" \
  org.gradle.wrapper.GradleWrapperMain "$@"
# ...existing code...
