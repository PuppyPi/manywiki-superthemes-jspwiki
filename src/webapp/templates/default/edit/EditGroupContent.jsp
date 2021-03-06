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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="templateTags" tagdir="/WEB-INF/tags/templates/default" %>

<fmt:setLocale value="${prefs.Language}" />
<fmt:setBundle basename="org.apache.wiki.i18n.templates.default"/>

<templateTags:EditOpen wikiPageContext="${wikiPageContext}" />

<c:set var="name" value="${name}" />
<c:set var="members" value="${membersAsString}" />

<div class="page-content">

  <form action="<wiki:Link format='url' jsp='EditGroup.jsp' />"
            id="editGroup"
        method="POST" accept-charset="UTF-8">

    <input type="hidden" name="group" value="${name}" />

    <div class="form-group">
      <button class="btn btn-success" type="submit" name="action" value="save">
        <fmt:message key="editgroup.submit.save"/>
      </button>
      <a class="btn btn-danger pull-right" href="<wiki:Link format='url' jsp='Group.jsp'><wiki:Param name='group' value='${name}'/></wiki:Link>" >
        <fmt:message key='editgroup.cancel.submit'/>
      </a>
    </div>

    <wiki:Messages div="error help-block" topic="group" prefix="<fmt:message key='editgroup.saveerror'/>" />

    <div class="help-block">
      <fmt:message key="editgroup.instructions"><fmt:param>${name}</fmt:param></fmt:message>
    </div>

    <div class="form-group">
      <label for="members"><fmt:message key="group.members"/></label><br />
      <textarea class="form-control form-col-50" rows=8 autofocus="autofocus" name="members" id="members" >${members}</textarea>
    </div>
    <div class="help-block"><fmt:message key="editgroup.memberlist"/></div>

  </form>

</div>

<templateTags:EditClose wikiPageContext="${wikiPageContext}" />
