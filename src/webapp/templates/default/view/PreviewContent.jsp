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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="templateTags" tagdir="/WEB-INF/tags/templates/default" %>

<fmt:setLocale value="${prefs.Language}" />
<fmt:setBundle basename="org.apache.wiki.i18n.templates.default"/>

<templateTags:ViewOpen wikiPageContext="${wikiPageContext}" />

<%-- Inserts page content for preview. --%>
<div class="page-content preview-content">

  <div class="information">
    <templateTags:Editor selector="${editorSelector}" wikiPageContext="${wikiPageContext}" />
    <p class="help-block"><fmt:message key="preview.info"/></p>
  </div>

  <div class="preview-body">
    <wiki:Translate>${wikiMarkup}</wiki:Translate>
  </div>

  <div class="information">
    <fmt:message key="preview.info"/>
  </div>

</div>

<templateTags:ViewClose wikiPageContext="${wikiPageContext}" />
