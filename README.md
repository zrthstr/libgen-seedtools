# Libgen Seedtools

<img src="docs/seedtools.png" width="200">

A python utility to fetch and seed a common dataset. Designed to help individuals strengthen the Library Genesis collection, but written to be generally useful for mirroring between networks.


## Install

``` bash
pipx install libgen-seedtools
# or
pip3 install libgen-seedtools
```

## Why this was made

* The libgen librarians and maintainers don't provide enough guidance or strategy for regular people to help.
* Without a unified strategy, seeding is random and inefficient, clustering at the ends.
* It's tedious and costly to click through and import individual torrents.
* Not everyone has hundreds of terrabytes of disk and bandwidth to spare.

This tool will allow all users to act together to strengthen the network under the same strategy, whether they have 20TB of disk or 200GB of disk. Using `libgen-seedtools` will ensure you get the most bang for your buck.

It also lowers the tedious burden of organization.  Start seeding in just a few minutes.

## Features

* **filter by minimum seeders**: Prioritize the files that need seeding the most.
* **Set max disk usage**: Set a limit on disk usage

## Usage

``` bash
# generate configuration
libgen-seedtools generate-config

# fetch and deploy torrent files
libgen-seedtools fetch
```

Output will look something like this

``` text
~$ libgen-seedtools fetch
Found 5932 torrent files (130.47 TB) needing seeders
  Seeders   MEAN=1.725724881995954 MEDIAN=2.0
  DHT Peers MEAN=4.369521240728253 MEDIAN=4.0
  Size      MEAN=21.99 GB MEDIAN=9.74 GB
Searching for criteria:
  max_disk_usage: 2TB
  min_seeders:    1
  max_seeders:    3
  types:          ['fiction', 'books']
Found 173 matches totaling 2 TB
Fetching torrent files...  [####################################]  100%
Done
```

## The end goal

Provide a manifest file describing `.torrent` files. This tool will iterate the list, attempt to retreive the data from one network, then once it is successfully fetched, propogate it to the other.

It is just a command-line script, not a service, so the user must initiate each "round" of checks.  If a torrent is added to transmission today and takes 4 hours to dowload, <s>you'll have to come back 4 hours later and run another "round" to collect the newly completed data and pin it to your ipfs node</s>.

Ideally a scheduler like cron or systemd will run a round of checks at intervals

If users all attempt to seed the most-needed files first, eventually the network will be seeded bottom-up.

## Prerequisites

* A transmission torrent server
* <s>* An ipfs server</s>

If you aren't already running these, you can use the included docker-compose.  If you run these services on your own, you MUST have a shared data volume accessible from both services.

## See also
* [Read the LibGen IPFS Seeding Guide](https://freeread.org/ipfs/)

## Credit

* To [LibGen Seeding Guide](https://freeread.org/)
* To phillm.net for providing a seed tracking service. Defunct as of 11.2024. Using [zrthstr's](https://zrthstr.github.io/libgen_torrent_cardiography/index.html) as of now.
