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

<fmt:setLocale value="${prefs.Language}" />
<fmt:setBundle basename="org.apache.wiki.i18n.templates.default"/>

<c:set var="groupPrincipals" value="${wikiPageContext.groupPrincipals}" />

<wiki:CheckRequestContext context="!createGroup"><c:set var="createFormClose" value="-close"/></wiki:CheckRequestContext>
<wiki:Permission permission="createGroups">
  <form action="<wiki:Link format='url' jsp='NewGroup.jsp'/>"
         class="accordion${createFormClose}"
        method="post" accept-charset="<wiki:ContentEncoding />" >

    <h4><fmt:message key="newgroup.heading.create"/></h4>
    <input type="hidden" name="action"  value="save" />

    <fmt:message key='newgroup.errorprefix' var="msg"/>
    <wiki:Messages div="alert alert-danger form-col-offset-20 form-col-50" topic="group" prefix="${msg}"/>

    <div class="form-group">
      <label class="control-label form-col-20"><fmt:message key="group.name" /></label>
      <input type="text" size="30"
           class="form-control form-col-50"
            name="group" id="group"
     placeholder="<fmt:message key="grp.newgroupname"/>"   >
    </div>

    <div class="form-group">
      <label class="control-label form-col-20"><fmt:message key="group.members" /></label>
      <textarea class="form-control form-col-50" rows="5" cols="30"
                 name="members" id="members" ></textarea>
    </div>
    <div class="help-block form-col-offset-20"><fmt:message key="editgroup.memberlist"/></div>
    <%--<p class="help-block form-col-offset-20"><fmt:message key="grp.formhelp"/></p>--%>

    <input class="btn btn-success form-col-offset-20" type="submit" value="<fmt:message key='grp.savenewgroup'/>" />


  </form>
</wiki:Permission>

<wiki:CheckRequestContext context="!createGroup">
  <fmt:message key='group.errorprefix' var="msg"/>
  <wiki:Messages div="alert alert-danger" topic="group" prefix="${msg}" />
</wiki:CheckRequestContext>

<form action="<wiki:Link format='url' jsp='DeleteGroup.jsp'/>"
      class="hidden"
        name="deleteGroupForm" id="deleteGroupForm"
      method="POST" accept-charset="UTF-8">
  <input type="hidden" name="group" value="${group.name}" />
  <input type="submit" name="ok"
   data-modal="+ .modal"
        value="<fmt:message key="actions.deletegroup"/>" />
  <div class="modal"><fmt:message key='grp.deletegroup.confirm'/></div>
</form>

<h4 id="allgroups"><fmt:message key='grp.allgroups'/></h4>
<div class="table-filter-sort-condensed-striped">
  <table class="table" aria-described-by="allgroups">
    <caption class="hide">Group Details</caption>
    <thead>
      <th scope="col"><fmt:message key="group.name"/></th>
      <th scope="col"><fmt:message key="group.members"/></th>
      <th scope="col"><fmt:message key="group.created"/></th>
      <th scope="col"><fmt:message key="group.thecreator"/></th>
      <th scope="col"><fmt:message key="group.modified"/></th>
      <th scope="col"><fmt:message key="group.themodifier"/></th>
      <th scope="col"><fmt:message key="group.actions"/></th>
    </thead>
    <tbody>
    
    <c:forEach var="groupPrincipal" items="groupPrincipals">
	    <c:set var="name" value="${groupPrincipal.name}" />
	    <c:set var="group" value="${wikiPageContext.getGroupByName(name)}" />
	    <c:set var="memberPrincipals" value="${wikiPageContext.getGroupMembers(group)}" />
    <tr class="${param.group == group.name ? 'highlight' : ''}">
      <%--<td><wiki:Link jsp='Group.jsp'><wiki:Param name='group' value='${group.name}'/>${group.name}</wiki:Link></td>--%>
      <td><c:if test="${group.name =='Admin'}"><span class="icon-unlock-alt"></span> </c:if>${group.name}</td>
      <td>
        <c:forEach items="${memberPrincipals}" var="member" varStatus="iterator">
          <c:if test="${iterator.index > 0}">, </c:if>
          ${member.name}
        </c:forEach>
      </td>
      <td><fmt:formatDate value="${group.created}" pattern="${prefs.DateFormat}" timeZone="${prefs.TimeZone}" /></td>
      <td>${group.creator}</td>
      <td><fmt:formatDate value="${group.lastModified}" pattern="${prefs.DateFormat}" timeZone="${prefs.TimeZone}" /></td>
      <td>${group.modifier}</td>

      <td class="nowrap">
      <%--
        We can't use wiki:Permission, cause we are in a loop; so let's just borrow some code from PermissionTag.java
      --%>
      <c:if test='${wikiPageContext.checkPermission(name, "edit")}'>
      <%-- <wiki:Permission permission="editGroup"> --%>
        <a class="btn btn-xs btn-primary"
            href="<wiki:Link format='url' jsp='EditGroup.jsp'><wiki:Param name='group' value='${group.name}' /></wiki:Link>" >
          <fmt:message key="actions.editgroup" />
        </a>
      <%--</wiki:Permission>--%>
      </c:if>

      <c:if test='${wikiPageContext.checkPermission(name, "delete")}'>
      <%-- <wiki:Permission permission="deleteGroup"> --%>
        <button class="btn btn-xs btn-danger" type="button" onclick="document.deleteGroupForm.group.value ='${group.name}';document.deleteGroupForm.ok.click();">
          <fmt:message key="actions.deletegroup"/>
        </button>
      <%--</wiki:Permission>--%>
      </c:if>
      </td>
    </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
