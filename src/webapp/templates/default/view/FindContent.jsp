<%--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
--%>

<%@ taglib uri="http://jspwiki.apache.org/tags" prefix="wiki" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="templateTags" tagdir="/WEB-INF/tags/templates/default" %>

<fmt:setLocale value="${prefs.Language}" />
<fmt:setBundle basename="org.apache.wiki.i18n.templates.default"/>


<templateTags:ViewOpen wikiPageContext="${wikiPageContext}" />

<div class="page-content">

<form action="<wiki:Link format='url' jsp='Search.jsp'/>"
       class="form-frame"
          id="searchform2"
       accept-charset="<wiki:ContentEncoding/>">

    <input type="text"
           name="query" id="query2"
          class="form-group form-control"
          value="${query}"
    placeholder="<fmt:message key="find.input" />"
      autofocus="autofocus"
           size="32" />

    <div class="form-inline form-group">

    <input class="btn active" type="submit" name="ok" id="ok" value="<fmt:message key="find.submit.find"/>" />
    <input class="btn btn-default" type="submit" name="go" id="go" value="<fmt:message key="find.submit.go"/>" />
    <input type="hidden" name="start" id="start" value="0" />
    <input type="hidden" name="maxitems" id="maxitems" value="20" />

    <div class="btn-group" data-toggle="buttons">
      <label class="btn btn-default btn-xs" >
        <input type="checkbox" name="details" id="details" ${param.details == "on" ? "checked='checked'" : ""} />
        <fmt:message key="find.details" />
    </label>
    </div>

    <div class="btn-group" data-toggle="buttons">
      <label class="btn btn-default btn-xs">
        <input type="radio" name="scope" ${empty param.scope ? "checked='checked'" : ""} value=""><fmt:message key='find.scope.all' />
      </label>
      <label class="btn btn-default btn-xs">
        <input type="radio" name="scope" ${param.scope eq "author:" ? "checked='checked'" : ""} value="author:"><fmt:message key='find.scope.authors' />
      </label>
      <label class="btn btn-default btn-xs">
        <input type="radio" name="scope" ${param.scope eq "name:" ? "checked='checked'" : ""} value="name:"><fmt:message key='find.scope.pagename' />
      </label>
      <label class="btn btn-default btn-xs">
        <input type="radio" name="scope" ${param.scope eq "contents:" ? "checked='checked'" : ""} value="contents:" ><fmt:message key='find.scope.content' />
      </label>
      <label class="btn btn-default btn-xs">
        <input type="radio" name="scope" ${param.scope eq "attachment:" ? "checked='checked'" : ""} value="attachment:" ><fmt:message key='find.scope.attach' />
      </label>
    </div>

    </div>

</form>

<div><templateTags:AJAXSearch searchresults="${searchresults}" maxitems="${maxitems}" /></div>

</div>

<templateTags:ViewClose wikiPageContext="${wikiPageContext}" />
