# Minecraft Bot Keep Alive（mcbot）

基于 @baipiaodajun/mcbot + pm2 的 Minecraft 保活 Bot  
支持 **多个服务器同时挂机**

---

## 支持环境
- Debian / Ubuntu
- Node.js 22
- Java 服务器（推荐 Paper 1.21.1）

---

## 一键安装

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/install.sh)
配置服务器
编辑 servers.json：

json
复制代码
[
  {
    "host": "emerald.magmanode.com",
    "port": 34356
  }
]
支持多个服务器，直接继续添加即可。

查看运行状态
bash
复制代码
pm2 ls
pm2 logs mcbot
停止 / 卸载
bash
复制代码
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/uninstall.sh)
