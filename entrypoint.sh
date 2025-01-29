#!/bin/sh


init_venv () {
  python -m venv .venv
  . .venv/bin/activate

  test "${1}" = "upgrade" && pip install --upgrade pip
  pip install -r requirements.txt
}

run () {
  init_venv
  python3 run.py ${@}
}

${@}
