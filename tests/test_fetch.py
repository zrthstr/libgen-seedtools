import subprocess
import sys

name = "libgen-seedtools"


def test_config():
    result = subprocess.run(
        [name, "generate-config", "-t", "http://172.17.0.1:9091"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, f"Got:\n{result.stderr}"
    with open("config.json", "r") as file:
        print(file.read())


def test_dryrun():
    result = subprocess.run(
        [name, "fetch", "--dry-run"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, f"Got:\n{result.stderr}"
