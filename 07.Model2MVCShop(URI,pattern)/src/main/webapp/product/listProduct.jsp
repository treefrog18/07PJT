<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetList(currentPage){
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();	
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/product/listProduct" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
					<c:if test = "${menu.equals('manage')}">
					��ǰ����
					</c:if>
					<c:if test = "${menu.equals('search')}">
					��ǰ ��� ��ȸ
					</c:if>
					
					<%--EL/JSTL�������� �ּ� ó�� 
					<%if(menu.equals("manage")) {%>
						��ǰ ����
						<%}else if(menu.equals("search")) {%>
							��ǰ ��� ��ȸ
						<%} %>
						--%>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
			<%-- EL/JSTL ������� �ּ�ó��
			<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
			 --%>
			<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
			<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
			<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>	
			<option value="3"  ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>���ݳ�����</option>
			<option value="4"  ${ ! empty search.searchCondition && search.searchCondition==4 ? "selected" : "" }>���ݳ�����</option>
			</select>
			<input 	type="text" name="searchKeyword" 
			value="${! empty search.searchKeyword ? search.searchKeyword : "" }"  
			class="ct_input_g" style="width:200px; height:20px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		<%--
		��ü  <%= resultPage.getTotalCount() %> �Ǽ�,	���� <%= resultPage.getCurrentPage() %> ������
		 --%>
		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${i}</td>
			<td></td>
		<td align="left">
			<c:if test= "${menu.equals('manage')}">
			<a href="/product/updateProduct?prodNo=${product.prodNo}&menu=manage">${product.prodName}</a>
			</c:if>
			<c:if test= "${menu.equals('search')}">
			<a href="/product/getProduct?prodNo=${product.prodNo}&menu=search">${product.prodName}</a>
			</c:if>
			<%--�������߰����� --%>
			</td>
		<td></td>
		<td align="left">${product.price}</td>
		<td></td>
		<td align="left">${product.regDate}</td>
		<td></td>
		<td align="left">
		<c:if test="${product.proTranCode.equals('0')}">
		�Ǹ���&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:if test="${menu.equals('manage') and product.proTranCode.equals('1') }">
		���ſϷ�&nbsp;&nbsp;&nbsp;<a href="/purchase/updateTranCode?prodNo=${product.prodNo}&tranCode=${product.proTranCode}">����ϱ�</a>
		</c:if>
		
		<c:if test="${menu.equals('manage') and product.proTranCode.equals('2') }">
		�����&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:if test="${menu.equals('manage') and product.proTranCode.equals('3') }">
		��ۿϷ�&nbsp;&nbsp;&nbsp;
		</c:if>

		<c:if test="${menu.equals('search') and product.proTranCode.equals('1') }">
		������&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:if test="${menu.equals('search') and product.proTranCode.equals('2') }">
		������&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:if test="${menu.equals('search') and product.proTranCode.equals('3') }">
		������&nbsp;&nbsp;&nbsp;
		</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1">
	</tr>
	</c:forEach>
	
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>

		    <jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>

</div>
</body>
</html>