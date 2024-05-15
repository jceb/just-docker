#!/usr/bin/env just --justfile
# Documentation: https://just.systems/man/en/

DEST := "/usr/share"
PACKAGE := "just-dockerxx"

set shell := ['nu', '-c']

# Print this help
default:
    @just -l

# Format Justfile
format:
    @just --fmt --unstable

# Install scripts
install:
    #!/usr/bin/env -S bash -euo pipefail
    if ! type nu &>/dev/null; then
      echo "nu command not found" 1>&2
      exit 1
    fi
    if ! type docker &>/dev/null; then
      echo "docker command not found" 1>&2
      exit 1
    fi
    install -d "{{ DEST }}/{{ PACKAGE }}"
    install -m 600 -t "{{ DEST }}/{{ PACKAGE }}" env just-docker
    echo "just-docker is ready" 1>&2
    echo "Add the following line as shebang to your Justfile tasks:" 1>&2
    echo "  #!{{ DEST }}/{{ PACKAGE }}/env --image=ubuntu:24.04 bash" 1>&2

# Uninstall scripts
uninstall:
    rm -rf "{{ DEST }}/{{ PACKAGE }}"

# Example task that executes a nushell script
run-nu:
    #!/usr/share/just-docker/env --image=jceb/nushell:latest nu
    print "hello nu"

# Example task that executes a bash script
run-bash:
    #!/usr/share/just-docker/env bash
    echo "hello bash"

# Example task that executes a python script
run-python:
    #!/usr/share/just-docker/env --image=python python3
    print("hello python")

# Run all example tasks
run-examples: run-nu run-bash run-python
