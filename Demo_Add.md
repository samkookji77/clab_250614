Clab / netlab Demo

4c, 8g, 30gb

멀티패스 설치

brew install multipass

멀티패스 실행

multipass launch 24.04 --name clab --cpus 4 --memory 8G --disk 30G

쉘접속

multipass shell clab

sudo apt update
sudo apt install -y [docker.io](http://docker.io/)
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu # 현재 사용자(ubuntu)를 docker 그룹에 추가
exit # 그룹 변경 적용을 위해 VM에서 나갔다가 다시 접속

sudo bash -c "$(curl -sL [https://get.containerlab.dev](https://get.containerlab.dev/))"

sudo usermod -aG clab_admins ubuntu && newgrp clab_admins

multipass transfer cEOSarm-lab-4.34.0F-EFT2.tar.xz clab:/home/ubuntu

multipass transfer cEOS64-lab-4.34.0F.tar clab:/home/ubuntu

docker import cEOSarm-lab-4.34.0F-EFT2.tar ceos:4.34.0f.arm

git clone https://github.com/samkookji77/clab_250614











A:srl# show interface ethernet-1/1
==================================== ==================================================
ethernet-1/1 is up, speed 25G, type None
--------------------------------------------------------------------------------------
======================================================================================
--{ running }--[  ]--
A:srl#
--{ running }--[  ]--
A:srl# enter candidate
--{ candidate shared default }--[  ]--
A:srl# interface ethernet-1/1 subinterface 0
--{ * candidate shared default }--[ interface ethernet-1/1 subinterface 0 ]--
A:srl# ipv4
--{ * candidate shared default }--[ interface ethernet-1/1 subinterface 0 ipv4 ]--
A:srl# address 100.64.0.1/31
--{ * candidate shared default }--[ interface ethernet-1/1 subinterface 0 ipv4 address
 100.64.0.1/31 ]--
A:srl#
Local commands:
  anycast-gw*       This designates the associated IPv4 address as an anycast-gateway
                    IPv4 address of the subinterface.
  primary*          One of the IPv4 prefixes assigned to the subinterface can be
                    explicitly configured as primary by setting this leaf to true.
                    This designates the associated IPv4 address as a primary IPv4
                    address of the subinterface. By default, the numerically lowest
                    value IPv4 address is selected as the primary address.

*** Not all commands are listed, press '?' again to see all options ***
--{ * candidate shared default }--[ interface ethernet-1/1 subinterface 0 ipv4 address
 100.64.0.1/31 ]--
A:srl# /
--{ * candidate shared default }--[  ]--
A:srl# interface ethernet-1/1 subinterface 0
--{ * candidate shared default }--[ interface ethernet-1/1 subinterface 0 ]--
A:srl# ipv4
--{ * candidate shared default }--[ interface ethernet-1/1 subinterface 0 ipv4 ]--
A:srl# admin-state enable
--{ * candidate shared default }--[ interface ethernet-1/1 subinterface 0 ipv4 ]--
A:srl# /
--{ * candidate shared default }--[  ]--
A:srl# network-instance default
--{ * candidate shared default }--[ network-instance default ]--
A:srl# interface ethernet-1/1.0
usage: interface <name>

List of subinterfaces used by this network-instance

Positional arguments:
  name              [string, length 1..255] Name of the subinterface bound to this
                    network-instance

Local commands:
  bridge-table
  interface-ref     Reference to a subinterface

*** Not all commands are listed, press '?' again to see all options ***
--{ * candidate shared default }--[ network-instance default ]--
A:srl# interface ethernet-1/1.0
--{ * candidate shared default }--[ network-instance default interface ethernet-1/1.0
]--
A:srl# commit now
All changes have been committed. Leaving candidate mode.
--{ + running }--[ network-instance default interface ethernet-1/1.0 ]--
A:srl# enter show
--{ + show }--[ network-instance default ]--
A:srl# show interfaces ethernet-1/1.0
======================================================================================
Net instance    : default
Interface       : ethernet-1/1.0
Type            : routed
Oper state      : up
Ip mtu          : 1500
  Prefix                             Origin     Status
  ===============================================================================
  100.64.0.1/31                      static     preferred, primary
======================================================================================
--{ + show }--[ network-instance default ]--
A:srl#
--{ + show }--[ network-instance default ]--
A:srl#
--{ + show }--[ network-instance default ]--
A:srl# ping 100.64.0.1 network-instance default
Using network instance default
PING 100.64.0.1 (100.64.0.1) 56(84) bytes of data.
64 bytes from 100.64.0.1: icmp_seq=1 ttl=64 time=0.054 ms
64 bytes from 100.64.0.1: icmp_seq=2 ttl=64 time=0.018 ms
^CCommand execution aborted : 'ping 100.64.0.1 network-instance default '
--{ + show }--[ network-instance default ]--
A:srl# ping 100.64.0.0 network-instance default
Using network instance default
PING 100.64.0.0 (100.64.0.0) 56(84) bytes of data.
64 bytes from 100.64.0.0: icmp_seq=1 ttl=64 time=55.0 ms
64 bytes from 100.64.0.0: icmp_seq=2 ttl=64 time=1.86 ms
64 bytes from 100.64.0.0: icmp_seq=3 ttl=64 time=2.17 ms
^CCommand execution aborted : 'ping 100.64.0.0 network-instance default '
--{ + show }--[ network-instance default ]--
A:srl#
