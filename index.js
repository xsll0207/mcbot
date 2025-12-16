const fs = require('fs');
const crypto = require('crypto');

// 随机用户名
function randomUsername() {
  return 'Bot_' + crypto.randomBytes(3).toString('hex');
}

// 读取服务器列表
const servers = JSON.parse(fs.readFileSync('./servers.json', 'utf8'));

servers.forEach((srv, i) => {
  process.env.HOST = srv.host;
  process.env.PORT = String(srv.port || 25565);

  // 用户名
  process.env.USERNAME = srv.username || randomUsername();

  // 版本：自动识别（不写 VERSION）
  if (srv.version) {
    process.env.VERSION = srv.version;
  } else {
    delete process.env.VERSION;
  }

  console.log(`启动 Bot #${i + 1}`, {
    host: process.env.HOST,
    port: process.env.PORT,
    username: process.env.USERNAME,
    version: process.env.VERSION || 'auto'
  });

  require('@baipiaodajun/mcbot');
});
