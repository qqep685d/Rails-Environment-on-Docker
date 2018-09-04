# Rails Environment on Docker

## Dependencies
- Docker
  - Mac: [Docker for Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac)
  - Windows: [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/)

## Installing
1. Start Docker

  - MacOS machine: start `Terminal`  
  See details: https://store.docker.com/editions/community/docker-ce-desktop-mac.

  - Windows machine: double-click `Docker QuickStart` on your desktop.  
  See details: https://docs.docker.com/toolbox/toolbox_install_windows/#step-3-verify-your-installation

1. Type command on your Terminal  

  1. `git clone https://github.com/qqep685d/Rails_Env_on_Docker.git`

  1. `cd Rails_on_Docker`

  1. `make new`

## Basic usage

  - Start-up / Destroy Application
    - Setup new application: `make new`  
    - Destroy the application: `make destroy`  


  - Docker Compose commands using Makefile
    - `make build`
    - `make up`
    - `make upd`
    - `make down`
    - `make restart`
    - `make clean`


  - Rails commands using Makefile
    - `make rc`
    - `make rr`
    - `make rt`
    - `make dbc`
    - `make dbm`
    - `make dbs`


  - Rails commands
    - `docker-compose run --rm web [rails commands]`
    - `docker-compose run --rm web rails g model ...`
    - `docker-compose run --rm web rails g controller ...`



## Useful references
- Docker + Rails + MySQL の開発環境  
  - [Docker Compose と Rails(+MySQL) で開発環境作成したときに気になったポイント](https://qiita.com/nak1114/items/1f7d48ff661555726427)


- 開発環境構築ステップ
  - [10ステップでMac OS XにRails5のDocker開発環境を構築する](https://qiita.com/hiraokashi/items/3f712c90b59845c6a77d)


- Rails on Docker でよく使うコマンド
  - [RailsアプリをDockerで開発するための手順](https://qiita.com/togana/items/30b22fc39fe6f7a188ec)


- Docker-compose コマンドを Makefileで簡略化  
  - [Makefileを使ってスマート？にDocker+Railsの開発をしようとした](https://qiita.com/ekueku33/items/121ff7b44f76ab4b2271)
  - [make は強いタスクランナーだった。Lambda Function のライフサイクルを Makefile でまわす](https://dev.classmethod.jp/server-side/serverless/lambda-deploy-with-make/)
