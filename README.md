# China Set: Stations README

This repo contains the source code and graphics of CNS China Set: Stations.\
CNS China Set: Stations is the renovated version of [CNSPS China Set: Platforms and Stations](https://www.github.com/openttd-china-set/china-set-platforms-and-stations)

CNS China Set: Stations is licensed under GNU GPL version 2

## Building

You should have a `bash` environment, on Windows this should come with `git`.

The following subjects are required to build the program:

- go
- gorender
- make
- nml 0.7.5 or higher

You can use `install_dependencies.sh` to quickly download and setup `gorender`

Use the `make` or `make all` command to build the grf; additionally, you could use `make all copy` to copy the grf file to your game directory. Ideally it should be `~/.local/share/openttd/newgrf`; the path may vary depending on your game version and platform.
For Windows users, we suggest using `wsl` to build the grf. Please note that `gorender` may be slow when using wsl.