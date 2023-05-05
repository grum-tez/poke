#!/bin/sh
sudo apt-get update && export DEBIAN_FRONTEND=noninteractive \
&& sudo apt-get install -y software-properties-common gnupg \
&& sudo add-apt-repository -y 'deb http://ppa.launchpad.net/serokell/tezos/ubuntu bionic main' \
&& sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 37B8819B7D0D183812DCA9A8CE5A4D8933AE7CBB \
&& sudo apt-get update -y \
&& sudo apt-get install -y tezos-client \
&& curl -LO https://taqueria.io/get/linux/taq \
&& chmod +x taq \
&& sudo mv taq /usr/local/bin/ \
&& taq init training \
&& cd training \
&& taq install @taqueria/plugin-ligo@next \
&& echo "{}" esy.json \
&& TAQ_LIGO_IMAGE=ligolang/ligo:0.64.2 taq ligo --command "install @ligo/fa" \
&& taq create contract nft.jsligo