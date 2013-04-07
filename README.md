terma-render
============

## 配置
首先用ng包含seo.js模块
在需要渲染的controller末尾调用
```javascript
$scope.htmlReady()
```

在本目录运行
```sh
npm install
```

## 使用
```sh
coffee app.coffee 端口 ng应用目标地址
```

如:
```sh
coffee app.coffee 3333 http://localhost:9000
```

## 测试
```sh
curl -XGET http://localhost:3333/login
```

