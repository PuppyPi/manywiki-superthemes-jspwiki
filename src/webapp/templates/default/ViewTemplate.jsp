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
<%@ page import="org.apache.wiki.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.*" %>
<%@ page import="org.apache.wiki.api.Release" %>
<%@ page import="org.apache.wiki.api.core.*" %>
<%@ page import="org.apache.wiki.attachment.*" %>
<%@ page import="org.apache.wiki.pages.PageManager" %>
<%@ page import="org.apache.wiki.preferences.Preferences" %>
<%@ page import="org.apache.wiki.ui.*" %>
<%@ page import="org.apache.wiki.util.*" %>
<fmt:setLocale value="${prefs.Language}" />
<fmt:setBundle basename="org.apache.wiki.i18n.templates.default"/>
<!doctype html>
<html lang="<c:out value='${prefs.Language}' default='en'/>" name="top">
  <head>

  <title>
    <fmt:message key="view.title.view">
      <fmt:param><wiki:Variable var="ApplicationName" /></fmt:param>
      <fmt:param><wiki:PageName /></fmt:param>
    </fmt:message>
  </title>
  <templateTags:commonheader pageContext="<%=pageContext%>"/>
  <wiki:CheckVersion mode="notlatest">
    <meta name="robots" content="noindex,nofollow" />
  </wiki:CheckVersion>
  <wiki:CheckRequestContext context="diff|info">
    <meta name="robots" content="noindex,nofollow" />
  </wiki:CheckRequestContext>
  <wiki:CheckRequestContext context="!view">
    <meta name="robots" content="noindex,follow" />
  </wiki:CheckRequestContext>
</head>

<body class="context-<wiki:Variable var='requestcontext' default='' />">

<div class="container${prefs.Layout=='fixed' ? ' ' : '-fluid ' } ${prefs.Orientation} fixed-header">

  <templateTags:Header pageContext="<%=pageContext%>" />

  <c:set var="sidebarState"><wiki:Variable var="sidebar" default="${prefs.Sidebar}" /></c:set>
  <c:set var="sidebarCookie" value="Sidebar" />
  <wiki:CheckRequestContext context='login|prefs|createGroup|viewGroup|conflict'>
    <c:set var="sidebarState" value="" />
    <c:set var="sidebarCookie" value="" />
  </wiki:CheckRequestContext>

  <div class="content ${sidebarState}" data-toggle="li#menu"
                                       data-toggle-pref="${sidebarCookie}" >
    <div class="page" role="main">
      <wiki:Content/>
      <templateTags:PageInfo/>
    </div>
    <templateTags:Sidebar pageContext="<%=pageContext%>" />
  </div>
  <templateTags:Footer/>

</div>

</body>
</html>