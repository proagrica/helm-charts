# ClamAV

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.104.0](https://img.shields.io/badge/AppVersion-0.104.0-informational?style=flat-square)

[ClamAV](https://www.clamav.net/) is an open source antivirus engine for detecting trojans, viruses, malware & other malicious threats.

## Installing the Chart

Before you can install the chart you will need to add the `proagrica` repo to [Helm](https://helm.sh/).

```shell
helm repo add proagrica https://proagrica.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release proagrica/clamav
```

## Configuration

The following table lists the configurable parameters of the _clamav_ chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.repository | string | `"clamav/clamav"` | Image repository. |
| image.tag | string | `{{ .Chart.AppVersion }}` or `{{ .Chart.AppVersion }}_base` | Image tag. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| nameOverride | string | `""` | Override the name of the chart. |
| fullnameOverride | string | `""` | Override the fullname of the chart. |
| serviceAccount.create | bool | `true` | If `true`, create a new service account. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.name | string | `""` | Service account to be used. If not set and serviceAccount.create is true, a name is generated using the full name template. |
| replicas | int | `1` | Number of replicas to create if `autoscalling.enabled` is `false`. |
| updateStrategy | object | `{}` | Update strategy for the pod. |
| autoscaling.enabled | bool | `false` | If `true`, create a HPA for the deployment. |
| autoscaling.minReplicas | int | `1` | Minimum number of pod replicas. |
| autoscaling.maxReplicas | int | `3` | Maximum number of pod replicas. |
| autoscaling.targetCPUUtilizationPercentage | int | `60` | Target CPU utilisation for the pod. |
| autoscaling.targetMemoryUtilizationPercentage | int | `60` | Target memory utilisation for the pod. |
| podDisruptionBudget.enabled | bool | `false` | If `true`, create a PDB for the deployment. |
| podDisruptionBudget.minAvailable | int | `nil` | Set the PDB minimum available pods. |
| podDisruptionBudget.maxUnavailable | int | `nil` | Set the PDB maximum unavailable pods. |
| podLabels | object | `{}` | Labels to add to the pod. |
| podAnnotations | object | `{}` | Annotations to add to the pod. |
| podSecurityContext | object | see values.yaml | Security context for the pod. |
| securityContext | object | `{}` | Security context for the clamav container. |
| priorityClassName | string | `""` | Priority class name to use. |
| livenessProbe | object | see values.yaml | The liveness probe. |
| readinessProbe | object | see values.yaml | The readiness probe. |
| service.type | string | `"ClusterIP"` | Service type. |
| service.annotations | object | `{}` | Annotations to add to the service. |
| service.port | int | `3310` | Service port. |
| ingress.enabled | bool | `false` | If `true`, create an ingress object. |
| ingress.annotations | object | `{}` | Ingress annotations. |
| ingress.ingressClassName | string | `""` | Ingress class to use. |
| ingress.hosts | list | `[]` | Ingress hosts. |
| ingress.tls | list | `[]` | Ingress TLS configuration |
| persistence.enabled | bool | `false` | If `true`, create a PVC. |
| persistence.annotations | object | `{}` | Annotations to add to the PVC. |
| persistence.accessMode | string | `"ReadWriteOnce"` | Use an existing PVC to persist data. existingClaim: existing-pvc -- Persistence access mode. |
| persistence.storageClass | string | `"standard"` | PVC storage class (use `-`` for default). |
| persistence.size | string | `"1Gi"` | Size of PVC to create. |
| resources | object | `{}` | Resource requests and limits for the clamav container. |
| nodeSelector | object | `{}` | Node labels for pod assignment. |
| tolerations | list | `[]` | Tolerations for pod assignment. |
| affinity | object | `{}` | Affinity for pod assignment. |
| env | string | `nil` | Environment variables for the clamav container. |
| databaseDirectory | string | `"/data/clamav"` | The clamav database directory |
| config | string | see values.yaml | The `clamd` configuration. |
| freshclam.enabled | bool | `true` | If `true`, create a freshclam container. |
| freshclam.securityContext | object | `{}` | Security context for the freshclam container. |
| freshclam.resources | object | `{}` | Resource requests and limits for the freshclam container. |
| freshclam.config | string | see values.yaml | The `freshclam` configuration. |

## Freshclam

The tool `freshclam` is used to download and update ClamAV’s official virus signature databases.

By default it is turned on (`freshclam.enabled` = `true`), this will use the image which doesn't include the signature databases (`clamav/clamav:0.104.0_base`), will create an init container to do initial download, and secondary container to keep them up to date.

If freshclam is disabled (`freshclam.enabled` = `false`), this will use the image with signature databases included (`clamav/clamav:0.104.0`) and no up dates will be made. This isn't recommended in production and provided for testing purposes.

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
