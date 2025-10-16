# Cloud Provider Configurations

# GCloud
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export CLOUDSDK_PYTHON_SITEPACKAGES=1

# GCloud cluster shortcuts
alias gdev='gcloud container clusters get-credentials dev-cluster-1 --zone us-central1-c --project demand-io-base --internal-ip'
alias gprod='gcloud container clusters get-credentials prod-cluster-1 --region us-central1-c --project demand-io-base --internal-ip'
alias gsvc='gcloud container clusters get-credentials services-cluster-1 --region us-central1-c --project demand-io-base --internal-ip'

# GCloud logging shortcuts
alias myslow='gcloud logging read "resource.type=cloudsql_database AND logName=projects/demand-io-base/logs/cloudsql.googleapis.com%2Fmysql-slow.log" --limit=300 --format="table(textPayload)"'
alias myerr='gcloud logging read "resource.type=cloudsql_database AND logName=projects/demand-io-base/logs/cloudsql.googleapis.com%2Fmysql.err" --limit=100 --format="table(textPayload)"'

# GCloud SDK paths (if installed via download)
if [ -f '/Users/bri/Downloads/google-cloud-sdk/path.zsh.inc' ]; then
  . '/Users/bri/Downloads/google-cloud-sdk/path.zsh.inc'
fi

if [ -f '/Users/bri/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/Users/bri/Downloads/google-cloud-sdk/completion.zsh.inc'
fi

# Redis connection shortcuts (dev/prod)
alias scredisdev="redis-cli -h 10.32.0.51"
alias scredisprod="redis-cli -h 10.113.102.99"
alias merchantapiredisdev="redis-cli -h 10.32.0.27"
alias merchantapiredisprod="redis-cli -h 10.32.0.35"
alias promotionapiredisdev="redis-cli -h 10.143.164.75"
alias promotionapiredisprod="redis-cli -h 10.1.145.51"
alias pixelbotredisdev="redis-cli -h 10.172.35.115"
alias pixelbotredisprod="redis-cli -h 10.32.0.59"
