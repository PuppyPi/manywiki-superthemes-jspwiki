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

<wiki:UserCheck status="notAuthenticated">
  <templateTags:PreferencesTab wikiPageContext="${wikiPageContext}" />
</wiki:UserCheck>

<wiki:UserCheck status="authenticated">
<div class="tabs">

  <h3 id="section-prefs">
    <fmt:message key="prefs.tab.prefs" />
  </h3>
  <templateTags:PreferencesTab wikiPageContext="${wikiPageContext}" />

  <wiki:Permission permission="editProfile">
  <wiki:UserProfile property="exists">
    <c:set var="profileTab" value="${param.tab == 'profile' ? 'data-activePane' : ''}"/>
    <h3 ${profileTab} id="section-profile"><fmt:message key="prefs.tab.profile"/></h3>
    <templateTags:ProfileTab wikiPageContext="${wikiPageContext}" />
  </wiki:UserProfile>
  </wiki:Permission>

  <wiki:Permission permission="createGroups"><%-- use WikiPermission --%>
    <c:set var="groupTab" value="${param.tab == 'groups' ? 'data-activePane' : ''}"/>
    <wiki:CheckRequestContext context='viewGroup|editGroup|createGroup'>
       <c:set var="groupTab">data-activePane</c:set>
    </wiki:CheckRequestContext>
    <h3 ${groupTab} id="section-groups"><fmt:message key="group.tab" /></h3>
    <templateTags:GroupTab wikiPageContext="${wikiPageContext}" />
  </wiki:Permission>

</div>
</wiki:UserCheck>

</div>

<templateTags:ViewClose wikiPageContext="${wikiPageContext}" />
