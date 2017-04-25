FROM busybox:latest
COPY etc/hadoop /etc/hadoop
VOLUME ["/etc/hadoop"]


