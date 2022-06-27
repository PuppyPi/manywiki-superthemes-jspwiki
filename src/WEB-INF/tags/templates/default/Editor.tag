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
<%@ attribute name="wikiPageContext" type="org.apache.wiki.api.core.Context" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="templateEditorsTags" tagdir="/WEB-INF/tags/templates/default/editors" %>

<c:choose>
	<c:when test="${selector == 'EditorSelector_CKeditor'}">
		<templateEditorsTags:CKeditor wikiPageContext="${wikiPageContext}" />
	</c:when>
	
	<c:when test="${selector == 'EditorSelector_plain'}">
		<templateEditorsTags:plain wikiPageContext="${wikiPageContext}" />
	</c:when>
	
	<c:when test="${selector == 'EditorSelector_preview'}">
		<templateEditorsTags:preview wikiPageContext="${wikiPageContext}" />
	</c:when>
	
	<c:when test="${selector == 'EditorSelector_TinyMCE'}">
		<templateEditorsTags:TinyMCE wikiPageContext="${wikiPageContext}" />
	</c:when>
	
	<c:when test="${selector == 'EditorSelector_wysiwyg'}">
		<templateEditorsTags:wysiwyg wikiPageContext="${wikiPageContext}" />
	</c:when>
	
	
	<c:otherwise>
		<!-- ERROR: Unrecognized editor selector! -->
	</c:otherwise>
</c:choose>
