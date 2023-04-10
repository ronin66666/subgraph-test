仓库地址：

Graph-node : git@github.com:graphprotocol/graph-node.git

### 环境安装

To build and run this project you need to have the following installed on your system:

#### Rust (latest stable) 

[install Rust](https://www.rust-lang.org/tools/install)

How to install Rust

- Note that `rustfmt`, which is part of the default Rust installation, is a build-time requirement.

#### PostgreSQL – PostgreSQL Downloads

##### mac上安装postgreSQL

方式一：**官网下载安装**

1. 下载 PostgreSQL。您可以在 PostgreSQL 官网上下载最新的 PostgreSQL 安装包：https://www.postgresql.org/download/macosx/
2. 安装 PostgreSQL。双击下载的安装包，在弹出的安装界面中选择需要安装的组件，并按照提示完成安装。
3. 启动 PostgreSQL。在命令行终端中执行以下命令启动 PostgreSQL 服务：

```
pg_ctl -D /usr/local/var/postgres start
```

1. 验证安装。安装完成后，您可以使用 psql 命令行工具来验证 PostgreSQL 是否正确安装。在命令行终端中执行以下命令：

```
psql --version
```

如果成功输出 PostgreSQL 的版本信息，则表示 PostgreSQL 安装完成。

方式二：**homebrew**安装（推荐）

1. 安装 PostgreSQL。在命令行终端中执行以下命令来使用 Homebrew 安装 PostgreSQL：

   ```
   brew install postgresql
   ```

2. 启动 PostgreSQL。在命令行终端中执行以下命令来启动 PostgreSQL 服务：

   ```
   brew services start postgresql
   ```

3. 验证安装。安装完成后，您可以使用 psql 命令行工具来验证 PostgreSQL 是否正确安装。在命令行终端中执行以下命令：

   ```
   psql --version
   ```

4. 查看brew正在运行的服务

   ```
   brew services list
   ```

5. 停止运行服务

   ```
   brew services stop postgresql
   ```

6. 初始化

   ```
   initdb -D .postgres
   ```

7. 启动

   ```
   pg_ctl -D .postgres -l logfile start
   ```

8. 创建数据库

   ```
   createdb graph-node
   ```

#### IPFS – Installing IPFS

1. 下载 IPFS。您可以在 IPFS 的官方网站（https://docs.ipfs.tech/install/）上下载最新版本的FS。

2. 解压 IPFS 文件。将下载的 IPFS 压缩包解压到您选择的目录中。

3. 安装 IPFS。在命令行终端中进入解压后的 IPFS 目录，并执行以下命令来安装 IPFS：

   ```
   ./install.sh
   ```

4. 初始化 IPFS。在命令行终端中执行以下命令来初始化 IPFS：

   ```
   ipfs init
   ```

   这个命令将创建 IPFS 本地节点，并生成一个唯一的私钥。

5. 启动 IPFS。在命令行终端中执行以下命令来启动 IPFS：

   ```
   ipfs daemon
   ```

   这个命令将启动 IPFS 本地节点，并在终端中显示节点信息和日志。您可以使用 `Ctrl+C` 组合键停止 IPFS 节点的运行。

   只启用本地服务，不去同步其他节点

   ```
   ipfs daemon --offline
   ```

   

6. 验证 IPFS。您可以使用命令行终端中的 `ipfs` 命令行工具来验证 IPFS 是否正确安装。例如，您可以使用以下命令获取 IPFS 的版本信息：

   ```
   ipfs version
   ```

​	如果成功输出 IPFS 的版本信息，则表示 IPFS 安装完成。

总之，您可以按照上述步骤在 Mac 上安装和初始化 IPFS，并使用 `ipfs daemon` 命令启动 IPFS 本地节点。

#### Profobuf Compiler 

### 运行

执行命令

```
cargo run -p graph-node --release -- --postgres-url 'postgresql://postgres[:PASSWORD]@127.0.0.1:5432/graph-node' --ethereum-rpc hardhat:127.0.0.1:31337 --ipfs 127.0.0.1:5001
```



运行报如下错误

```
  = note: ld: warning: could not create compact unwind for _wasmtime_fiber_start: does not use RBP or RSP based frame
          Undefined symbols for architecture x86_64:
            "_SSL_get_peer_certificate", referenced from:
                openssl::ssl::SslRef::peer_certificate::haece0618223af3fe in libopenssl-9c414be64d38c7a3.rlib(openssl-9c414be64d38c7a3.openssl.e59d8e4c-cgu.0.rcgu.o)
          ld: symbol(s) not found for architecture x86_64
          clang: error: linker command failed with exit code 1 (use -v to see invocation)
          

error: could not compile `graph-node` due to previous error
```

没有安装openssl， 使用

```
brew install openssl
cargo clean
```

然后重新运行
