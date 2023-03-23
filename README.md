# rtx-poetry

[Poetry](https://github.com/python-poetry/poetry) plugin for rtx version
manager

## Build History

[![Build history](https://buildstats.info/github/chart/rtx-plugins/rtx-poetry?branch=main)](https://github.com/rtx-plugins/rtx-poetry/actions)

## Installation

```bash
rtx plugin add poetry
```

## Usage

Check [rtx](https://github.com/jdxcode/rtx) readme for instructions on how to
install & manage versions.

### Overriding installer

`RTX_POETRY_INSTALL_URL` is an optional variable you can specific to point to
the hosted installer of your choosing, e.g. `get-poetry.py` or the new `install-poetry.py`
(compatible with [1.1.7+](https://github.com/python-poetry/poetry/releases/tag/1.1.7) and
[default in 1.2](https://python-poetry.org/blog/announcing-poetry-1.2.0a1/#deprecation-of-the-get-poetrypy-script)).

For example, to force `install-poetry.py` on 1.1.9:

```
RTX_POETRY_INSTALL_URL=https://install.python-poetry.org rtx install poetry 1.1.9
```

Doing so is not recommended and may result in poetry installations which
disregard the `rtx-python` plugin. See [issue #10](https://github.com/rtx-plugins/rtx-poetry/issues/10).

## License

Licensed under the
[MIT license](https://github.com/rtx-plugins/rtx-poetry/blob/main/LICENSE).
