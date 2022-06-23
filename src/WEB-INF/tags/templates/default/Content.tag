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

<%--
The "ContentSelector"s here must match up with org.apache.wiki.api.core.ContextEnum !!
--%>

<%@ attribute name="selector" type="java.lang.String" %>
<%@ attribute name="editorSelector" type="java.lang.String" %>
<%@ attribute name="pageContext" type="javax.servlet.jsp.PageContext" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="templateContentsTags" tagdir="/WEB-INF/tags/templates/default/contentses" %>
<%@ taglib prefix="templateTags" tagdir="/WEB-INF/tags/templates/default" %>

<c:choose>
	<c:when test="${selector == 'ContentSelector_CommentContent'}">
		<templateContentsTags:CommentContent editorSelector="${editorSelector}" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_ConflictContent'}">
		<templateContentsTags:ConflictContent/>
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_DiffContent'}">
		<templateContentsTags:DiffContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_DisplayMessage'}">
		<templateContentsTags:DisplayMessage/>
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_EditContent'}">
		<templateContentsTags:EditContent editorSelector="${editorSelector}" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_EditGroupContent'}">
		<templateContentsTags:EditGroupContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_FindContent'}">
		<templateContentsTags:FindContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_GroupContent'}">
		<templateContentsTags:GroupContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_LoginContent'}">
		<templateContentsTags:LoginContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_NewGroupContent'}">
		<templateContentsTags:NewGroupContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_PageContent'}">
		<templateContentsTags:PageContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_PreviewContent'}">
		<templateContentsTags:PreviewContent editorSelector="${editorSelector}" pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_WorkflowContent'}">
		<templateContentsTags:WorkflowContent/>
	</c:when>
	
	
	<c:when test="${selector == 'ContentSelector_InfoContent'}">
		<templateTags:InfoContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_PreferencesContent'}">
		<templateTags:PreferencesContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:otherwise>
		<!-- ERROR: Unrecognized content selector! -->
	</c:otherwise>
</c:choose>
