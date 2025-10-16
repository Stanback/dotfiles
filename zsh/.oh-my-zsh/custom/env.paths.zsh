# PATH modifications

# MySQL Client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Confluent Cloud CLI
export PATH=$PATH:~/bin

# pnpm
export PNPM_HOME="/Users/bri/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Android SDK
export ANDROID_HOME=/Users/bri/Library/Android/sdk

# Pixelbot OpenSSL paths
export LD_LIBRARY_PATH=$(brew --prefix openssl)/lib:"${LD_LIBRARY_PATH}"
export CPATH=$(brew --prefix openssl)/include:"${CPATH}"
export PKG_CONFIG_PATH=$(brew --prefix openssl)/lib/pkgconfig:"${PKG_CONFIG_PATH}"
