<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="addBooksModal"
	class="modal hide fade in centering insertAndUpdateDialogs"
	role="dialog" aria-labelledby="addBooksModalLabel" aria-hidden="true">
	<div class="modal-header">
		<h3 id="addBooksModalLabel" class="displayInLine">
			<spring:message code="create" />
			&nbsp;
			<spring:message code="book" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="newBookForm" novalidate>
			<div class="pull-left">
				<div>
					<div class="input-append">
						<label>* <spring:message code="books.name" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" required autofocus ng-model="book.bookName"
							name="bookName"
							placeholder="<spring:message code='book'/>&nbsp;<spring:message code='books.name'/>" />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && newBookForm.bookName.$error.required">
								<spring:message code="books.form.required.bookName" />
						</span>
						</label>
					</div>
				</div>
				<div>
					<div class="input-append">
						<label>* <spring:message code="books.author" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" required ng-model="book.bookAuthor"
							name="bookAuthor" />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && newBookForm.bookAuthor.$error.required">
								<spring:message code="books.form.required.authorName" />
						</span>
						</label>
					</div>
				</div>
				<div>
					<div class="input-append">
						<label>* <spring:message code="books.cost" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" required ng-model="book.cost" name="cost" />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && newBookForm.cost.$error.required">
								<spring:message code="books.form.required.cost" />
						</span>
						</label>
					</div>
				</div>
				<div>
					<div class="input-append">
						<label>[ {{captchaOrg}} ] (Please type this word to below)
						</label>
					</div>
					<div class="input-append">
						<input type="text" ng-valid="captchaOrg!=captchaAgain" required ng-model="captchaAgain"
							name="capt" />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && newBookForm.capt.$error.required && (captchaOrg!=captchaAgain)">
								Captcha incorrect!!!
						</span>
						</label>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="createBook(newBookForm);"
					value='<spring:message code="create"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#addBooksModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="updateBooksModal"
	class="modal hide fade in centering insertAndUpdateDialogs"
	role="dialog" aria-labelledby="updateBooksModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="updateBooksModalLabel" class="displayInLine">
			<spring:message code="update" />
			&nbsp;
			<spring:message code="book" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="updateBookForm" novalidate>
			<input type="hidden" required ng-model="book.id" name="id"
				value="{{book.id}}" />

			<div class="pull-left">
				<div>
					<div class="input-append">
						<label>* <spring:message code="books.name" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" autofocus required ng-model="book.bookName"
							name="bookName"
							placeholder="<spring:message code='book'/>&nbsp;<spring:message code='books.name'/> " />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && updateBookForm.bookName.$error.required">
								<spring:message code="books.form.required.bookName" />
						</span>
						</label>
					</div>
				</div>
				<div>
					<div class="input-append">
						<label>* <spring:message code="books.author" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" required ng-model="book.bookAuthor"
							name="bookAuthor"
							placeholder="<spring:message code='sample.email'/> " />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && updateBookForm.bookAuthor.$error.required">
								<spring:message code="books.form.required.authorName" />
						</span>
						</label>
					</div>
				</div>
				<div>
					<div class="input-append">
						<label>* <spring:message code="books.cost" />:
						</label>
					</div>
					<div class="input-append">
						<input type="text" required ng-model="book.cost" name="cost" />
					</div>
					<div class="input-append">
						<label> <span class="alert alert-error"
							ng-show="displayValidationError && updateBookForm.cost.$error.required">
								<spring:message code="books.form.required.cost" />
						</span>
						</label>
					</div>
				</div>
				<input type="submit" class="btn btn-inverse"
					ng-click="updateBook(updateBookForm);"
					value='<spring:message code="update"/>' />
				<button class="btn btn-inverse" data-dismiss="modal"
					ng-click="exit('#updateBooksModal');" aria-hidden="true">
					<spring:message code="cancel" />
				</button>
			</div>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span>
</div>

<div id="deleteBooksModal" class="modal hide fade in centering"
	role="dialog" aria-labelledby="searchBooksModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<h3 id="deleteBooksModalLabel" class="displayInLine">
			<spring:message code="delete" />
			&nbsp;
			<spring:message code="book" />
		</h3>
	</div>
	<div class="modal-body">
		<form name="deleteBookForm" novalidate>
			<p>
				<spring:message code="delete.confirm" />
				:&nbsp;{{book.bookName}}?
			</p>

			<input type="submit" class="btn btn-inverse" ng-click="deleteBook();"
				value='<spring:message code="delete"/>' />
			<button class="btn btn-inverse" data-dismiss="modal"
				ng-click="exit('#deleteBooksModal');" aria-hidden="true">
				<spring:message code="cancel" />
			</button>
		</form>
	</div>
	<span class="alert alert-error dialogErrorMessage"
		ng-show="errorOnSubmit"> <spring:message code="request.error" />
	</span> <span class="alert alert-error dialogErrorMessage"
		ng-show="errorIllegalAccess"> <spring:message
			code="request.illegal.access" />
	</span>
</div>


