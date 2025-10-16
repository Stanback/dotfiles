# Kubernetes helper functions

ktop() {
  # Colout is optional (install via: `pip install colout`)
  kubectl top pod --sort-by=memory --sum --containers -l app.kubernetes.io/name="$1" | colout '\b([0-9]+m)\s+([0-9]+Mi)\b' cyan,magenta
}

ktailall() {
  kubectl logs --tail 100 -f --max-log-requests 200 -l app.kubernetes.io/name="$1"
}

kpodsd() {
  kubectl get pods -l app.kubernetes.io/name="$1" | colout '^([A-Za-z0-9-]+)\s+([0-9/]+)\b' yellow,cyan
}
