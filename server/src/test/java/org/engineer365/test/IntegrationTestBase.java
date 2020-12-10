/*
 * MIT License
 *
 * Copyright (c) 2020 engineer365.org
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
package org.engineer365.test;

import static org.hamcrest.Matchers.lessThanOrEqualTo;

import java.lang.reflect.Type;
import java.net.URI;
import java.util.concurrent.TimeUnit;

import org.engineer365.common.json.JacksonHelper;
import org.springframework.http.MediaType;
import org.testcontainers.containers.DockerComposeContainer;

import com.fasterxml.jackson.databind.ObjectMapper;

import io.restassured.RestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.builder.ResponseSpecBuilder;
import io.restassured.config.ObjectMapperConfig;
import io.restassured.config.RestAssuredConfig;
import io.restassured.filter.log.ErrorLoggingFilter;
import io.restassured.filter.log.RequestLoggingFilter;
import io.restassured.filter.log.ResponseLoggingFilter;
import io.restassured.mapper.factory.Jackson2ObjectMapperFactory;
import io.restassured.parsing.Parser;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import io.restassured.specification.ResponseSpecification;

/**
 * 集成测试的基类。
 *
 * 1）基于对API接口规范的约定封装了一些浅层次的对RestAssured的使用方法。后续会改为使用Open Feign。
 * 2) 连接testcontainers启动的待测试容器
 * 3）初始化数据：MySQL, ...
 */
@lombok.Getter
@lombok.Setter
public abstract class IntegrationTestBase {

  static {
    RestAssured.config = RestAssuredConfig.config()
      .objectMapperConfig(
        ObjectMapperConfig.objectMapperConfig().jackson2ObjectMapperFactory(new Jackson2ObjectMapperFactory() {
          public ObjectMapper create(Type cls, String charset) {
            return JacksonHelper.buildMapper();
          }
        }));
    RestAssured.defaultParser = Parser.JSON;
  }

  final String basePath;

  protected IntegrationTestBase(String basePath) {
    this.basePath = basePath;
  }

  public TestContainersFactory containersFactory() {
    return TestContainersFactory.DEFAULT;
  }

  protected abstract DockerComposeContainer<?> containers();

  public String getServerHost() {
    return containers().getServiceHost("server", containersFactory().getServerPort());
  }

  public int getServerPort() {
    return containers().getServicePort("server", containersFactory().getServerPort());
  }

  public int getServerManagementPort() {
    return containers().getServicePort("server", containersFactory().getServerManagePort());
  }

  public RequestSpecification requestSpecification() {
    RequestSpecBuilder builder = new RequestSpecBuilder();

    builder.setAccept(MediaType.APPLICATION_JSON_VALUE);
    builder.setContentType(MediaType.APPLICATION_JSON_VALUE);

    builder.setBaseUri(URI.create("http://" + getServerHost()));
    builder.setPort(getServerPort());
    builder.setBasePath(getBasePath());

    builder.addFilter(new RequestLoggingFilter());
    builder.addFilter(new ResponseLoggingFilter());
    builder.addFilter(new ErrorLoggingFilter());

    return builder.build();
  }

  public ResponseSpecification responseSpecification() {
    ResponseSpecBuilder builder = new ResponseSpecBuilder();

    builder.expectStatusCode(200);
    builder.expectResponseTime(lessThanOrEqualTo(6L), TimeUnit.SECONDS);

    return builder.build();
  }

  @SuppressWarnings("unused")
  public Response assertResponse(Response response) {
    ValidatableResponse va = response.then().spec(responseSpecification());
    return response;
  }

  public RequestSpecification when() {
    return RestAssured.given().spec(requestSpecification()).when();
  }

}
