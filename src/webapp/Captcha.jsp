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
<fmt:setBundle basename="org.apache.wiki.i18n.core.CoreResources"/>

<!doctype html>
<html lang="<c:out value='${prefs.Language}' default='en'/>" name="top">

<head>
  <title><wiki:Variable var="applicationname" />: <wiki:PageName /></title>
  <meta name="robots" content="noindex,nofollow" />
  <script type="text/javascript">
    function HumanCheckComplete(isHuman)
    {
       if (isHuman)
       {
          formElt = document.getElementById("mainForm");
          formElt.submit();
       }
       else
       {
          alert('<fmt:message key="captcha.js.humancheckcomplete.alert" />');
          return false;
       }
    }

    function i18nAsirra() {
       document.getElementById("asirra_InstructionsTextId").innerHTML = "<fmt:message key="captcha.asirra.please.select" />";
	   for ( var i = 0; i < 12; i++)
       {
          document.getElementById("asirra_AdoptMeDiv" + i).getElementsByTagName("a")[0].innerHTML= '<font size="-1">' + '<fmt:message key="captcha.asirra.adopt.me" />' + '</font>' ;
       }
       document.getElementById("asirra_KnobsTable").getElementsByTagName("a")[0].title="<fmt:message key="captcha.asirra.a.get.challenge" />";
       document.getElementById("asirra_KnobsTable").getElementsByTagName("a")[1].title="<fmt:message key="captcha.asirra.a.whatsthis" />";
       document.getElementById("mainForm").style.display="block"; // show form when i18n is done
    }
   </script>
</head>
<body onload="i18nAsirra()">
<div style="margin: 8px">
   <p><fmt:message key="captcha.description" /></p>

   <form action="<wiki:Link jsp='Captcha.jsp' format='url'/>" method="post" id="mainForm" style="display: none;">
      <input type="hidden" value="foo" name="text" />
      <input type="hidden" value='${reqPage}>' name='page'/>
      <script type="text/javascript" src="http://challenge.asirra.com/js/AsirraClientSide.js"></script>
      <script type="text/javascript">
         asirraState.SetEnlargedPosition( "right" );
         // asirraState.SetCellsPerRow( 6 );
      </script>
      <br />
      <input type="button" value="<fmt:message key="captcha.submit" />" onclick="javascript:Asirra_CheckIfHuman(HumanCheckComplete)" />
  </form>
</div>
</body>
</html>