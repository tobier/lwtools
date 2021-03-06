# lwtools
Cross-development tools for Motorola 6809 and Hitachi 6309. http://www.lwtools.ca/

## Supported tags

* ``latest`` has the latest released version of LWTOOLS, currently 4.17

## What is LWTOOLS?

LWTOOLS is a set of cross-development tools for the Motorola 6809 and Hitachi 6309 microprocessors. It supports assembling to raw binaries, CoCo LOADM binaries, and a proprietary object file format for later linking. It also supports macros and file inclusion among other things.

LWTOOLS was born in 2006 when William Astle decided that none of the crossassemblers available at the time supported all the features he wanted to use. After over two years of intermittent development, and three separate releases of LWASM and one separate release of LWLINK, LWTOOLS had it's initial release on January 29, 2009.

## How to use this image

### Usage

The image plays very well with Visual Studio Code and the [6x09 Assembly](https://marketplace.visualstudio.com/items?itemName=blairleduc.6x09-assembly) extension. Below is an example ``tasks.json`` for assembling a file using the docker image.

```
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "lwasm",
            "type": "shell",
            "windows": {
              "command": "docker run --rm -v ${PWD}:/usr/src/app -w /usr/src/app tobier/lwtools:latest lwasm --6809 --raw -o ${fileBasenameNoExtension}.bin --list=${fileBasenameNoExtension}.lst ${relativeFile}"
            },
            "group": {
              "kind": "build",
              "isDefault": true
            },
            "problemMatcher": [
              "$lwasm"
            ],
            "presentation": {
              "reveal": "always"
            }
          }
    ]
}
```

## License

View [license](http://www.lwtools.ca/hg/index.cgi/raw-file/tip/COPYING) information for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
