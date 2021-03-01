## 🐳 Docker

### 💿 MySQL の Docker Container を作成する。

1. [Docker Hub](https://hub.docker.com) から [Docker Image（MySQL）](https://hub.docker.com/_/mysql) をダウンロードする。

    - `$ docker pull mysql:"バージョンを指定するタグ名"` を実行して、Docker Image をダウンロードする。

2. `$ docker run --name "コンテナ名" -v "ローカル環境に MySQL のデータを同期しておくための絶対パス":/var/lib/mysql -e MYSQL_ROOT_PASSWORD="Root ユーザに設定するパスワード" -d mysql:"バージョンを指定するタグ名" --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci` を実行して、MySQL のコンテナを起動する。

    - `--name` オプションで、コンテナに任意の名称を付ける。
    - `-v` オプションで、コンテナを削除してもデータを失わないようにするために、ローカル環境にデータを同期しておく。
    - `-e` オプションは、環境変数を指定する。
    - `-d` オプションは、コンテナをバックグラウンドで起動する。
    - `mysql:"バージョンを指定するタグ名"` オプションは、使用する Docker イメージ
    - `--character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci` は、デフォルトの文字コードを指定する。

3. `$ docker exec -it "コンテナ名" bash` を実行すると、指定したコンテナに接続し、シェルを起動する。
4. `$ mysql -u root -p` を実行して、MySQL に接続する。
