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

<%@ attribute name="selector" type="javax.servlet.jsp.PageContext" %>
<%@ attribute name="pageContext" type="javax.servlet.jsp.PageContext" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="templateContentsesTags" tagdir="/WEB-INF/tags/templates/default/contentses" %>
<%@ taglib prefix="templateTags" tagdir="/WEB-INF/tags/templates/default" %>

<c:choose>
	<c:when test="${selector == 'ContentSelector_CommentContent'}">
		<templateContentsesTags:CommentContent/>
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_ConflictContent'}">
		<templateContentsesTags:ConflictContent/>
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_DiffContent'}">
		<templateContentsesTags:DiffContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_DisplayMessage'}">
		<templateContentsesTags:DisplayMessage/>
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_EditContent'}">
		<templateContentsesTags:EditContent/>
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_EditGroupContent'}">
		<templateContentsesTags:EditGroupContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_FindContent'}">
		<templateContentsesTags:FindContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_GroupContent'}">
		<templateContentsesTags:GroupContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_LoginContent'}">
		<templateContentsesTags:LoginContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_NewGroupContent'}">
		<templateContentsesTags:NewGroupContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_PageContent'}">
		<templateContentsesTags:PageContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_PreviewContent'}">
		<templateContentsesTags:PreviewContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_WorkflowContent'}">
		<templateContentsesTags:WorkflowContent/>
	</c:when>
	
	
	<c:when test="${selector == 'ContentSelector_InfoContent'}">
		<templateTags:InfoContent pageContext="<%=pageContext%>" />
	</c:when>
	
	<c:when test="${selector == 'ContentSelector_PreferencesContent'}">
		<templateTags:PreferencesContent pageContext="<%=pageContext%> "/>
	</c:when>
	
	<c:otherwise>
		<!-- ERROR: Unrecognized selector! -->
	</c:otherwise>
</c:choose>
