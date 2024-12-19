import subprocess
import sys
import time
import json
import transmissionrpc

name = "libgen-seedtools"
config_path = "/app/config.json"

#@pytest.fixture(scope='module')


def edit_config():
    with open(config_path, "r") as file:
        config = json.load(file)

    # Modify the specific URL
    config["torrent"]["connection_settings"]["url"] = "http://172.17.0.1:9091"

    # Save the updated configuration
    with open(config_path, "w") as file:
        json.dump(config, file, indent=2)

    return True


def test_config():
    # basic test for now
    # should verrify fully in future

    with open(config_path, "r") as file:
        config = json.load(file)

    assert config["version"] == 2.0
    

def test_transmission_rpc():

    # Connect to Transmission
    client = transmissionrpc.Client('172.17.0.1', port=9091, user='username', password='password')

    # Test Transmission connection
    assert client.get_session() is not None
    assert client.rpc_version > 16

def test_fetch():

    assert edit_config() == True

    result = subprocess.run(
        [name, "fetch", "--auto-verify"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0,  f"Got:\n{result.stderr}"
#    assert f"{name}, version" in result.stdout.lower()
