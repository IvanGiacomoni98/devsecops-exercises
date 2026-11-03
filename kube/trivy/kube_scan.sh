#! /bin/bash
# SCAN cluster for vulnerabilities
# $1 is cluster ip

TRIVY_IMAGE=${TRIVY_IMAGE:-aquasec/trivy@sha256:2416d1f74045b57274df1a340eee6b510cacd73c66a6ccb8da092b117eb7d222} # 0.76.0
TRIVY_DB=${TRIVY_DB:-ghcr.io/aquasecurity/trivy-db,public.ecr.aws/aquasecurity/trivy-db}
TRIVY_JAVA_DB=${TRIVY_JAVA_DB:-ghcr.io/aquasecurity/trivy-java-db,public.ecr.aws/aquasecurity/trivy-java-db}
CLUSTER_IP=$1

KUBE_CONFIG_FILE="$HOME"/.kube/config-dso-user
KUBE_CONFIG_HOST=k8scp-dso

if [ -z "$CLUSTER_IP" ]; then
    echo 'Missing mandatory cluster ip argument' >&2
    exit 1
fi

namespaces=kube-system
#namespaces=dso-apps
resources=pods
#resources=deployment,pods
report_type=summary
#report_type=all
scanners=vuln,misconfig,secret
severity=HIGH,CRITICAL

mkdir -p "$HOME"/Library/Caches

# start scanning k8s cluster @ provided ip
docker run --rm \
    -it \
    -v "$KUBE_CONFIG_FILE":/root/.kube/config:z \
    -v "$HOME"/Library/Caches:/root/.cache/:z \
    -e TRIVY_DB_REPOSITORY="$TRIVY_DB" \
    -e TRIVY_JAVA_DB_REPOSITORY="$TRIVY_JAVA_DB" \
    --add-host "$KUBE_CONFIG_HOST":"$CLUSTER_IP" \
    "$TRIVY_IMAGE" k8s \
    --severity $severity \
    --include-namespaces $namespaces \
    --include-kinds $resources \
    --scanners $scanners \
    --report $report_type
