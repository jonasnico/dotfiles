# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="apple"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# GPG
export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Jonas.Nicolaysen/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/Jonas.Nicolaysen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Jonas.Nicolaysen/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/Jonas.Nicolaysen/google-cloud-sdk/completion.zsh.inc'; fi

# pnpm
export PNPM_HOME="/Users/Jonas.Nicolaysen/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export TESTCONTAINERS_HOST_OVERRIDE=localhost
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"

export VAULT_ADDR=https://vault.adeo.no
alias vaultlogin='gcloud auth login && vault login -method=oidc -no-print'
alias vaultskekravdev='vault read postgresql/preprod-fss/creds/sokos-ske-krav-user'
alias vaultskekravprod='vault read postgresql/prod-fss/creds/sokos-ske-krav-user'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
