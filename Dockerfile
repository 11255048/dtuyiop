# 使用輕量 Alpine 作為基底
FROM alpine:3.20

# 安裝必要套件
RUN apk add --no-cache wget tar ca-certificates tzdata

# 設定時區
ENV TZ=Asia/Taipei

# 下載 OpenList 最新 Linux 版本
RUN wget -O /tmp/openlist.tar.gz https://github.com/OpenListTeam/OpenList/releases/latest/download/openlist-linux-amd64.tar.gz \
    && tar -xzf /tmp/openlist.tar.gz -C /usr/local/bin \
    && chmod +x /usr/local/bin/openlist \
    && rm /tmp/openlist.tar.gz

# 建立資料目錄
RUN mkdir -p /data
WORKDIR /data

# 開放埠
EXPOSE 5244

# 啟動 OpenList 伺服器
CMD ["openlist", "server", "--data", "/data"]
