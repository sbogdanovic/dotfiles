#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Customisations by @iskandar
# Various utils
brew install htop
brew install watch
brew install ncdu
brew install speedtest_cli
brew install jq
brew install pwgen
brew install thefuck
brew install youtube-dl
brew cask install tunnelblick

# Larger apps
brew cask install cheatsheet
brew cask install vlc
brew cask install xquartz
brew cask install spectacle
brew cask install spotify

# Fonts
#   https://github.com/adobe-fonts/source-code-pro
brew tap caskroom/fonts
brew cask install font-source-code-pro
#   https://sourcefoundry.org/hack/
brew cask install caskroom/fonts/font-hack

# Revision control related
brew install gist

# Python and related
# Also see python3.sh
brew install python3

# NodeJS and related
# Also see nodejs.sh
brew install node

# Java and related
brew cask install java # requires password
brew install groovy
brew install maven
brew install gradle

# PHP and related
brew install php

# https://github.com/PowerShell/PowerShell
brew cask install powershell
brew cask install dotnet

# Hashicorp, Terraform and related
brew install terraform
brew install packer
brew install vault
brew install terragrunt

# Cloud CLIs
brew install awscli
brew cask install google-cloud-sdk
brew install azure-cli

# Docker and related
## Include docker-compose and docker-completion
brew cask install docker # Will ask for credentials in a GUI popup
brew install docker-machine docker-machine-driver-hyperkit
brew install docker-compose-completion docker-machine-completion

# Kubernetes and related
brew install kubernetes-cli
brew install kubernetes-helm
brew cask install minikube
#   https://draft.sh/
brew tap Azure/draft
brew install Azure/draft/draft

# Other CLIs
# VSTS/Azure DevOps
brew install vsts-cli

# https://jenkins-x.io/getting-started/install/
brew tap jenkins-x/jx
brew install jx

# Data related
brew install redis
# brew cask install mysql-shell

# Remove outdated versions from the cellar.
brew cleanup
