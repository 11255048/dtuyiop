FROM ghcr.io/openlistteam/openlist:latest
EXPOSE 5244
CMD ["openlist", "server", "--data", "/data"]
