@echo off
chcp 65001 >nul
title 七七的粉色城堡 - 启动器
echo.
echo  🌸 正在启动七七的粉色城堡...
echo.

:: 检查是否有node，有则用node启动服务器
where node >nul 2>&1
if %errorlevel%==0 (
  echo  ✓ 检测到Node.js，启动HTTP服务器中...
  start "七七城堡" node -e "var h=require('http'),f=require('fs'),p=require('path'),r='.';var M={'.html':'text/html;charset=utf-8','.png':'image/png','.mp3':'audio/mpeg','.js':'application/javascript','.css':'text/css'};h.createServer(function(q,s){var u=decodeURIComponent(q.url.split('?')[0]);if(u=='/')u='/index.all-in-one.html';var fp=p.join(r,u);try{var c=f.readFileSync(fp);var e=p.extname(fp).toLowerCase();s.writeHead(200,{'Content-Type':M[e]||'application/octet-stream','Cache-Control':'no-cache'});if(e=='.mp3')s.setHeader('Accept-Ranges','bytes');s.end(c)}catch(ex){s.writeHead(404);s.end('Not found')}}).listen(8080,function(){console.log('http://127.0.0.1:8080')})
  timeout /t 2 /nobreak >nul
  start http://127.0.0.1:8080
  echo.
  echo  ✅ 服务器已启动！
  echo  浏览器已自动打开 http://127.0.0.1:8080
  echo  关掉此窗口即可停止服务器
  pause
) else (
  :: 没有node，用powershell尝试
  echo  ⚠ 未检测到Node.js，尝试用PowerShell启动...
  echo。
  echo  或者直接双击 index.all-in-one.html 打开（但音频可能无法播放）
  echo。
  start index.all-in-one.html
  pause
)
