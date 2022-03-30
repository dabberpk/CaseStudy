#! /bin/bash
#
# Copyright Ghareeb Falazi Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error
# Obtain CONTAINER_IDS and remove them
# TODO Might want to make this optional - could clear other containers

set -e

printf "\n---Copying Ethereum smart contract to working directory of ganache-cli docker images...---\n"

cp -r ../SmartContracts/Ethereum/truffle ./ganache-cli/

printf "\n---Bringing up docker images...---\n"
docker-compose build
docker-compose up -d

sleep 1
printf "\n---Sleeping 10s to allow blockchains to complete booting...---\n"

sleep 9

printf "\n---Deploying smart contract on the ganache Ethereum simulator...---\n"

docker exec ganache-with-truffle truffle migrate
docker exec ganache-with-truffle2 truffle migrate

printf "\n---Cleaning up...---\n"

rm -rf ./ganache-cli/truffle

printf "\n---DONE!---\n"
