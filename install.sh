#!/usr/bin/env bash
set -e

echo "=== Minecraft mcbot OneKey Installer ==="

# 必须 root
if [ "$EUID" -ne 0 ]; then
  echo "请使用 root 用户运行"
  exit 1
fi

# 安装依赖
apt update
apt install -y curl git

# 安装 Node.js 22
if ! node -v 2>/dev/null | grep -q "v22"; then
  echo "安装 Node.js 22..."
  curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
  apt install -y nodejs
fi

# 安装 pm2
if ! command -v pm2 >/dev/null 2>&1; then
  npm install -g pm2
fi

# 安装依赖
npm install @baipiaodajun/mcbot mineflayer minecraft-protocol node-fetch

# 初始化 servers.json（如果不存在）
if [ ! -f servers.json ]; then
cat > servers.json <<EOF
[
  {
    "host": "emerald.magmanode.com",
    "port": 25565
  }
]
EOF
fi

# 启动
pm2 delete mcbot >/dev/null 2>&1 || true
pm2 start index.js --name mcbot
pm2 save

echo "=== 安装完成 ==="
echo "编辑 servers.json 添加服务器"
echo "查看状态：pm2 ls"
echo "查看日志：pm2 logs mcbot"
