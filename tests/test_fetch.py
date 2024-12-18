import subprocess

import sys

name = "libgen-seedtools"

def test_config():
    result = subprocess.run(
        [name, "generate-config"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0,  f"Got:\n{result.stderr}"
#    assert f"{name}, version" in result.stdout.lower()
#
#
    with open("config.json", "r") as file:
        print(file.read())


def test_dryrun():
    result = subprocess.run(
        [name, "fetch" ,"--dry-run"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0,  f"Got:\n{result.stderr}"
#    assert f"{name}, version" in result.stdout.lower()



def test_fetch():
    result = subprocess.run(
        [name, "fetch"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0,  f"Got:\n{result.stderr}"
#    assert f"{name}, version" in result.stdout.lower()
