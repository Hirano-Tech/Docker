FROM ubuntu:latest

RUN apt-get update
  # パッケージ情報を更新する。

RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  # Docker Engine と Docker Compose をインストールするために必要なパッケージを取得する。

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg 
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
      # Docker の公式 GPG 鍵を取得する。

RUN apt-get update && apt-get install -y docker docker-compose containerd
  # パッケージ情報を再度 更新し、Docker Engine と Docker Compose をインストールする。

RUN usermod -aG docker $(whoami)
  # 現在 ログインしているユーザーで Docker コマンドを実行できるようにする。
