import subprocess
import sys
import time
import json
import transmissionrpc

name = "libgen-seedtools"
config_path = "/app/config.json"
config_schema_version = 1.1
transmission_rpc_min_version = 16


def edit_config():
    with open(config_path, "r") as file:
        config = json.load(file)
    config["torrent"]["connection_settings"]["url"] = "http://172.17.0.1:9091"
    with open(config_path, "w") as file:
        json.dump(config, file, indent=2)
    return True


def test_config():
    with open(config_path, "r") as file:
        config = json.load(file)
    assert config["version"] == config_schema_version


def test_transmission_rpc():
    client = transmissionrpc.Client(
        "172.17.0.1", port=9091, user="username", password="password"
    )
    assert client.get_session() is not None
    assert client.rpc_version > transmission_rpc_min_version


def test_fetch():
    assert edit_config() == True
    result = subprocess.run(
        [name, "fetch", "--auto-verify"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, f"Got:\n{result.stderr}"
