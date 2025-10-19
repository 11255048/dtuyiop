# 使用 OpenList 官方容器映像
FROM ghcr.io/openlistteam/openlist:latest

# 建立資料夾
RUN mkdir -p /data

# 設定工作目錄
WORKDIR /data

# 開放 Port
EXPOSE 5244

# 啟動命令
CMD ["openlist", "server", "--data", "/data"]
