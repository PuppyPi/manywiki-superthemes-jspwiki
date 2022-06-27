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

<%@ attribute name="searchresults" type="java.util.List" %>
<%@ attribute name="maxitems" type="int" %>

<%@ taglib uri="http://jspwiki.apache.org/tags" prefix="wiki" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setLocale value="${prefs.Language}" />
<fmt:setBundle basename="org.apache.wiki.i18n.templates.default"/>

<wiki:SearchResults>

  <h4 id="find-heading-results"><fmt:message key="find.heading.results"><fmt:param><c:out value="${param.query}"/></fmt:param></fmt:message></h4>

  <p>
  <fmt:message key="find.externalsearch"/>
    &nbsp;<a class="external"
        href="http://www.google.com/search?q=<c:out value='${param.query}'/>"
        title="Google Search '<c:out value='${param.query}'/>'"
       target="_blank">Google</a>
    |
    <a class="external"
        href="http://en.wikipedia.org/wiki/Special:Search?search=<c:out value='${param.query}'/>"
        title="Wikipedia Search '<c:out value='${param.query}'/>'"
       target="_blank">Wikipedia</a>
  </p>

  <wiki:SetPagination start="${param.start}" total="${searchresults.size}" pagesize="20" maxlinks="9"
                     fmtkey="info.pagination"
                    onclick="$('start').value=%s; SearchBox.runfullsearch();" />

    <div class="graphBars">
    <div class="zebra-table">
    <table class="wikitable  table-striped" aria-describedby="find-heading-results">

      <tr>
         <th scope="col"><fmt:message key="find.results.page"/></th>
         <th scope="col"><fmt:message key="find.results.score"/></th>
      </tr>

      <wiki:SearchResultIterator id="searchref" start="${param.start}" maxItems="${maxitems}">
      <tr>
        <td><wiki:LinkTo><wiki:PageName/></wiki:LinkTo></td>
        <td><span class="gBar">${searchref.score}</span></td>
      </tr>

	  <c:if test="${param.details == 'on'}">
		<c:set var="contexts" value="${searchref.contexts}" />
		
		<c:if test="${(contexts != null) && (contexts.size > 0)}">
			  <tr class="odd" >
				<td class="fragment" colspan="2">
			
			<c:set var="first" value="${true}"/>
			<c:forEach var="c" items="contexts">
				<c:if test="${first}">
					<span class='fragment_ellipsis'> ... </span>
				</c:if>
				<c:set var="first" value="${false}"/>
					${c}
			</c:forEach>
				 </td>
			   </tr>
		</c:if>
	  </c:if><%-- details --%>
      </wiki:SearchResultIterator>

      </table>

      <wiki:IfNoSearchResults>
        <p class="warning"><fmt:message key="find.noresults"/></p>
      </wiki:IfNoSearchResults>


    </div>
    </div>
    ${pagination}  <%-- todo: is this a hidden variable from <wiki:SetPagination> ?? --%>

   </wiki:SearchResults>
