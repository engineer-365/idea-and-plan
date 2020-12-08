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
package org.engineer365.common.rest;

import org.junit.jupiter.api.Disabled;


import org.engineer365.common.json.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.junit.jupiter.api.parallel.Execution;
import org.junit.jupiter.api.parallel.ExecutionMode;


/**
 */
@Disabled
@Execution(ExecutionMode.SAME_THREAD) // controller test不支持并行执行
@Import(RestConfig.class)
public class RestTestBase {

    @Autowired
    protected MockMvc mockMvc;

    public ResultActions expectOk(ResultActions actions, Object expectedResponseContent) {
        try {
            var ra = actions.andExpect(status().isOk());
            if (expectedResponseContent == null) {
                return ra; // 是否改为返回HTTP 204 (No Content)
            }
            return ra.andExpect(content().string(JSON.to(expectedResponseContent)));
        } catch(Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public MockHttpServletRequestBuilder GET(String urlTemplate, Object... uriVars) {
		return MockMvcRequestBuilders
                .get(urlTemplate, uriVars)
                .contentType(MediaType.APPLICATION_JSON_VALUE);
    }

    public MockHttpServletRequestBuilder POST(Object requestContent, String urlTemplate, Object... uriVars) {
		return MockMvcRequestBuilders
                .post(urlTemplate, uriVars)
                .contentType(MediaType.APPLICATION_JSON_VALUE)
                .content(JSON.to(requestContent));
    }

    public ResultActions getThenExpectOk(Object expectedResponseContent, String urlTemplate, Object... uriVars) {
        try {
            var reqBuilder = GET(urlTemplate, uriVars);
            var actions = this.mockMvc.perform(reqBuilder);
            return expectOk(actions, expectedResponseContent);
        } catch(Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public ResultActions postThenExpectOk(Object requestContent, Object expectedResponseContent, String urlTemplate, Object... uriVars) {
        try {
            var reqBuilder = POST(requestContent, urlTemplate, uriVars);
            var actions = this.mockMvc.perform(reqBuilder);
            return expectOk(actions, expectedResponseContent);
        } catch(Exception ex) {
            throw new RuntimeException(ex);
        }
    }

}
