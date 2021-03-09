#!/usr/bin/env sh

set -e

JAVA_OPTS="-Dwaves.data-directory=/app/wavesdir/data -Dwaves.directory=/app/wavesdir"
WAVES_LOG_LEVEL=${WAVES_LOG_LEVEL:-DEBUG}
WAVES_HEAP_SIZE=${WAVES_HEAP_SIZE:-2g}
WAVES_NETWORK=${WAVES_NETWORK:-mainnet}

[ -n "${WAVES_WALLET_PASSWORD_FILE}" ] && WAVES_WALLET_PASSWORD=${WAVES_WALLET_PASSWORD:-$(cat "${WAVES_WALLET_PASSWORD_FILE}")}
[ -n "${WAVES_WALLET_SEED_FILE}" ] && WAVES_WALLET_SEED=${WAVES_WALLET_SEED:-$(cat "${WAVES_WALLET_SEED_FILE}")}

[ -n "${WAVES_WALLET_PASSWORD}" ] && JAVA_OPTS="${JAVA_OPTS} -Dwaves.wallet.password=${WAVES_WALLET_PASSWORD}"
[ -n "${WAVES_WALLET_SEED}" ] && JAVA_OPTS="${JAVA_OPTS} -Dwaves.wallet.seed=${WAVES_WALLET_SEED}"

echo "Node is starting..."
echo "WAVES_HEAP_SIZE='${WAVES_HEAP_SIZE}'"
echo "WAVES_LOG_LEVEL='${WAVES_LOG_LEVEL}'"
echo "WAVES_VERSION='${WAVES_VERSION}'"
echo "WAVES_NETWORK='${WAVES_NETWORK}'"
echo "WAVES_WALLET_SEED='${WAVES_WALLET_SEED}'"
echo "WAVES_WALLET_SEED_FILE='${WAVES_WALLET_SEED_FILE}'"
echo "WAVES_WALLET_PASSWORD='${WAVES_WALLET_PASSWORD}'"
echo "WAVES_WALLET_PASSWORD_FILE='${WAVES_WALLET_PASSWORD_FILE}'"
echo "JAVA_OPTS='${JAVA_OPTS}'"

java -Dlogback.stdout.level=${WAVES_LOG_LEVEL} \
	-XX:+ExitOnOutOfMemoryError \
	-Xmx${WAVES_HEAP_SIZE} \
	-Dconfig.override_with_env_vars=true \
	${JAVA_OPTS} \
	-jar /app/waves.jar "/app/local.conf"
