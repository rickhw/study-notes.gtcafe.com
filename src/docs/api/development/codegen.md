
# OpenAPI Generator for Java Springboot

## 前置條件



### 環境與工具

- macOS 13.4.1 (c) s
- sdkman v5.18.2
    - java: `sdk install java 11.0.19-amzn` 
    - springboot: `sdk install springboot`
- openapi-generator: `brew install openapi-generator`

### 依賴版本

- Java version 11
- Springboot version: 2.7.7
- OpenAPI generator: 6.6.0


## 建立初始專案


```bash
spring init -d=web --build=maven
```





http://localhost:8080/swagger-ui/index.html



---

## 參考資料

- [OpenAPI Generator](https://openapi-generator.tech/docs/configuration/)
    - [Maven Plugin](https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator-maven-plugin)
- https://www.baeldung.com/java-openapi-generator-server
- [OpenAPI Generator Demo for Spring Boo](https://www.youtube.com/watch?v=GJOwJrqIV-8), [Demo Code](https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator-maven-plugin)