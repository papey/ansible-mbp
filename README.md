# Ansible MBP

A repo containing everything to bootstrap all the stuff on a macOS machine

Inspired by [https://blog.filador.fr/je-configure-macos-avec-ansible/](https://blog.filador.fr/je-configure-macos-avec-ansible/), kudos ROMAIN BOULANGER

# Usage

## Prerequisites

### Xcode

```sh
xcode-select --install
```

### Base

In order to get the basic tools for this setup run

```sh
./bootstrap.sh
```

### SSH key

```sh
ssh-keygen -t ecdsa -b 521 -C "mail.example.com"
```

### GPG Key

```sh
gpg --gen-key
```

## Run

```sh
ansible-playbook -i host site.yml --ask-become-pass
```
