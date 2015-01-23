<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="row-fluid" ng-controller="BooksController">
	<h4>
		<p class="text pull-left">
			<span class="text text-info"><spring:message
					code='books.header' /></span>
		</p>
		<p class="text pull-right">

			<span class="text text-info"><spring:message
					code="message.total.records.found" />:&nbsp;{{page.totalBooks}}</span>

		</p>
	</h4>

	<br />


	<div>

		<div id="loadingModal" class="modal hide fade in centering"
			role="dialog" aria-labelledby="deleteBooksModalLabel"
			aria-hidden="true">
			<div id="divLoadingIcon" class="text-center">
				<div class="icon-align-center loading"></div>
			</div>
		</div>

		<div
			ng-class="{'alert badge-inverse': displayMessageToUser == true, 'none': displayMessageToUser == false}">

			<h4 class="displayInLine">

				<p class="messageToUser displayInLine">
					<i class="icon-info-sign"></i>&nbsp;{{page.actionMessage}}
				</p>

			</h4>

		</div>



		<div
			ng-class="{'alert alert-block alert-error': state == 'error', 'none': state != 'error'}">

			<h4>
				<i class="icon-info-sign"></i>
				<spring:message code="error.generic.header" />
			</h4>
			<br />
			<p>
				<spring:message code="error.generic.text" />
			</p>

		</div>



		<div
			ng-class="{'alert alert-info': state == 'noresult', 'none': state != 'noresult'}">

			<p>
				<spring:message code="books.emptyData.text" />
			</p>

		</div>



		<div id="gridContainer"
			ng-class="{'': state == 'list', 'none': state != 'list'}">

			<table class="table table-bordered table-striped">

				<thead>

					<tr>

						<%-- <th scope="col"><spring:message code="books.id"/></th> --%>

						<th scope="col"><spring:message code="books.name" /></th>

						<th scope="col"><spring:message code="books.author" /></th>

						<th scope="col"><spring:message code="books.cost" /></th>

						<th scope="col"></th>

					</tr>

				</thead>

				<tbody>

					<tr ng-repeat="book in page.source">

						<!-- <td class="tdBooksCentered">{{book.id}}</td> -->

						<td class="tdBooksCentered">{{book.bookName}}</td>

						<td class="tdBooksCentered">{{book.bookAuthor}}</td>

						<td class="tdBooksCentered">{{book.cost}}</td>

						<td class="width15">

							<div class="text-center">

								<input type="hidden" value="{{book.id}}" /> <a
									href="#updateBooksModal" ng-click="selectedBook(book);"
									role="button"
									title="<spring:message code="update"/>&nbsp;<spring:message code="book"/>"
									class="btn btn-info" data-toggle="modal"> <i
									class="icon-pencil"></i>

								</a> <a href="#deleteBooksModal" ng-click="selectedBook(book);"
									role="button"
									title="<spring:message code="delete"/>&nbsp;<spring:message code="book"/>"
									class="btn btn-info" data-toggle="modal"> <i
									class="icon-minus"></i>

								</a>

							</div>

						</td>

					</tr>

				</tbody>

			</table>



			<div style="float: left;">

				<button href="#" class="btn btn-info"
					ng-class="{'btn-info': page.currentPage != 0, 'disabled': page.currentPage == 0}"
					ng-disabled="page.currentPage == 0" ng-click="changePage(0)"
					title='<spring:message code="pagination.first"/>'>

					<spring:message code="pagination.first" />

				</button>

				<button href="#" class="btn btn-info"
					ng-class="{'btn-info': page.currentPage != 0, 'disabled': page.currentPage == 0}"
					ng-disabled="page.currentPage == 0" class="btn btn-info"
					ng-click="changePage(page.currentPage - 1)"
					title='<spring:message code="pagination.back"/>'>&lt;</button>

				<span>{{page.currentPage + 1}} <spring:message
						code="pagination.of" /> {{page.pagesCount}}
				</span>

				<button href="#" class="btn btn-info"
					ng-class="{'btn-info': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
					ng-click="changePage(page.currentPage + 1)"
					ng-disabled="page.pagesCount - 1 == page.currentPage"
					title='<spring:message code="pagination.next"/>'>&gt;</button>

				<button href="#" class="btn btn-info"
					ng-class="{'btn-info': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
					ng-disabled="page.pagesCount - 1 == page.currentPage"
					ng-click="changePage(page.pagesCount - 1)"
					title='<spring:message code="pagination.last"/>'>

					<spring:message code="pagination.last" />

				</button>

			</div>

		</div>

		<div
			ng-class="{'text-center': displayCreateBookButton == true, 'none': displayCreateBookButton == false}"
			style="float: right; padding-top: 0px">

			<a href="#addBooksModal" role="button" ng-click="resetBook();"
				title="<spring:message code='create'/>&nbsp;<spring:message code='book'/>"
				class="btn btn-info" data-toggle="modal"> <i class="icon-plus"></i>
				&nbsp;&nbsp;<spring:message code="create" />&nbsp;<spring:message
					code="book" />

			</a>

		</div>



		<jsp:include page="dialogs/booksDialogs.jsp" />
	</div>

</div>



