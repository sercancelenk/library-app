<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="masthead">
	<h3 class="muted">
		<spring:message code='header.message' />
		<span class="pull-right" style="font-size:12px"><span class="text text-info">[By SercanCELENK - Version:1.0]</span></span>
	</h3>

	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<div class="container">
				<ul class="nav navbar-nav" ng-controller="LocationController">
					<li
						ng-class="{'active': activeURL == 'home', '': activeURL != 'home'}">
						<a href="<c:url value="/"/>"
						title='<spring:message code="header.home"/>'>
							<p>
								<spring:message code="header.home" />
							</p>
					</a>
					</li>
					<li
						ng-class="{'gray': activeURL == 'books', '': activeURL != 'books'}"><a
						title='<spring:message code="header.books"/>'
						href="<c:url value='/protected/books'/>"><p>
								<spring:message code="header.books" />
							</p></a></li>
				</ul>
				<ul class="nav pull-right">
					<li><a href="<c:url value='/logout' />"
						title='<spring:message code="header.logout"/>'><p
								class="displayInLine">
								<spring:message code="header.logout" />
								&nbsp;(${user.name})
							</p></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>


