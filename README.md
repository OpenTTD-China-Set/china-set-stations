# China Set: Stations README

This repo contains the source code and graphics of CNS China Set: Stations.\
CNS China Set: Stations is the renovated version of [CNSPS China Set: Platforms and Stations](https://www.github.com/openttd-china-set/china-set-platforms-and-stations)

CNS China Set: Stations is licensed under GNU GPL version 2

## Building

You should have a `bash` environment, which should come with `git` if you are using Windows. **Please do not use Windows Powershell or Command Prompt to build the grf.**

The following subjects are required to build the grf:

- gcc
- go
- make
- python 3.10 or higher,
- gorender
- nml 0.7.5 + [PR #306](https://github.com/openttd/nml/pull/306) + [PR #320](https://github.com/openttd/nml/pull/320)

You can use `install_dependencies.sh` to quickly download and setup `gorender` and `nml`. Please note that you should use `nml/nmlc`.

Use the `make` or `make all` command to build the grf; additionally, you could use `make all copy` to copy the grf file to your game directory. Ideally it should be `~/.local/share/openttd/newgrf`; the path may vary depending on your game version and platform.

## Contributors:

- @WenSimEHRP
- @ahyangyi
