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