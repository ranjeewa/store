
<%@ page import="com.ranjeewa.store.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'product.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="brand" title="${message(code: 'product.brand.label', default: 'Brand')}" />
                        
                            <g:sortableColumn property="category" title="${message(code: 'product.category.label', default: 'Category')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'product.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="model" title="${message(code: 'product.model.label', default: 'Model')}" />
                        
                            <g:sortableColumn property="price" title="${message(code: 'product.price.label', default: 'Price')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productInstanceList}" status="i" var="productInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: productInstance, field: "brand")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "category")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "model")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "price")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
