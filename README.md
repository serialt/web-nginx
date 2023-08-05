# web-nginx

在k8s里面用nginx运行web(静态文件)


1、生成`basic auth`认证文件
```shell
# 输入以下命令，回车输入两次密码
htpasswd -c ./auth.conf username
```

2、生成服务镜像
``` shell
docker build -t serialt/web-nginx:v1 .
docker push serialt/web-nginx:v1
```

3、安装chart release
```shell
helm repo add bitnami https://charts.bitnami.com/bitnami

helm install web-nginx bitnami/nginx -n data -f web-nginx-values.yaml

kubectl apply -f web-nginx-vs.yaml -n istio-system
```