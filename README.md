# just-docker

An experiment to use [just](https://just.systems) tasks as docker runner. See
idea discussion
[Support for executing commands in a Docker Container](https://github.com/casey/just/discussions/2028).

## Installation

- Clone this repository
- Install the wrapper script: `sudo just install`
- Specify image as shebang:
  - Ubuntu bash: `#!/usr/share/just-docker/env bash`
  - Nixos nushell: `#!/usr/share/just-docker/env --image=jceb/nushell:latest nu`
  - Debian Python: `#!/usr/share/just-docker/env --image=python python3`
  - Your interpreter:
    `#!/usr/share/just-docker/env --image=OUR_IMAGE OUR_INTERPERTER`
