import subprocess

import sys

name = "libgen-seedtools"

def test_version():
    result = subprocess.run(
        [name, "--version"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0
    assert f"{name}, version" in result.stdout.lower()

