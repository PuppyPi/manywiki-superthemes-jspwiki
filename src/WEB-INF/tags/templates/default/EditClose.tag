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


					<templateTags:PageInfo/>
				</div>
				<templateTags:Sidebar wikiPageContext="${wikiPageContext}" />
			</div>
			<templateTags:Footer wikiPageContext="${wikiPageContext}" />
		</div>
	</body>
</html>
