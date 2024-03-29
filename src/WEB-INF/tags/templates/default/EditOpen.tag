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

<%@ attribute name="wikiPageContext" type="org.apache.wiki.api.core.Context" %>
<%@ taglib uri="http://jspwiki.apache.org/tags" prefix="wiki" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="templateTags" tagdir="/WEB-INF/tags/templates/default" %>

<fmt:setLocale value="${prefs.Language}" />
<fmt:setBundle basename="org.apache.wiki.i18n.templates.default"/>

<!doctype html>
<html lang="${prefs.Language}" name="top">
	<head>
		<title>
			<wiki:CheckRequestContext context="edit">
				<fmt:message key="edit.title.edit">
					<fmt:param>
						<wiki:Variable var="ApplicationName" />
					</fmt:param>
					<fmt:param>
						<wiki:PageName />
					</fmt:param>
				</fmt:message>
			</wiki:CheckRequestContext>
			<wiki:CheckRequestContext context="comment">
				<fmt:message key="comment.title.comment">
					<fmt:param>
						<wiki:Variable var="ApplicationName" />
					</fmt:param>
					<fmt:param>
						<wiki:PageName />
					</fmt:param>
				</fmt:message>
			</wiki:CheckRequestContext>
		</title>
		<meta name="robots" content="noindex,follow" />
		<templateTags:commonheader wikiPageContext="${wikiPageContext}" />
	</head>
	
	<body class="context-<wiki:Variable var='requestcontext' />">
		<div class="container${prefs.Layout=='fixed' ? ' ' : '-fluid ' } ${prefs.Orientation}">
			<templateTags:Header wikiPageContext="${wikiPageContext}" />
			<div class="content" data-toggle="li#menu,.sidebar>.close">
				<div class="page">
