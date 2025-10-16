# SSH Connection Shortcuts

# Personal servers
# alias cyphergate='ssh -p 61787 bri@cyphergate.com'
alias cyphergate='mosh --ssh="ssh -p 61787" bri@cyphergate.com'
alias wormhole="mosh bri@wormhole.local"

# Web Hosting
alias vultr='ssh brian@vultr.cyphergate.com'

# Demand.io GCP instances
alias io.wireguard='gcloud compute ssh wireguard-vpn --internal-ip'
alias io.jenkins-gcp='gcloud compute ssh jenkins-main --internal-ip'
alias io.prod-elastic-gcp='gcloud compute ssh elastic-prod --internal-ip'
alias io.dev-mongo-gcp='gcloud compute ssh mongo-dev --internal-ip'
alias io.prod-mongo-gcp='gcloud compute ssh mongo-prod --internal-ip'
alias io.dev-elastic-gcp='gcloud compute ssh elastic-dev --internal-ip'
alias io.bs='gcloud compute ssh bs-analysis --internal-ip'
alias io.wormhole="ssh bri@wormhole"
alias io.blitzkong="ssh bri@blitzkong"
