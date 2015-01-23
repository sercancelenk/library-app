'use strict';
/**
 * @author: sercan
 */
function BooksController($scope, $http) {
	
    $scope.pageToGet = 0;

    $scope.state = 'busy';

    $scope.lastAction = '';

    $scope.url = "/library-crud/protected/books/";//FIXME:

    $scope.errorOnSubmit = false;
    $scope.errorIllegalAccess = false;
    $scope.displayMessageToUser = false;
    $scope.displayValidationError = false;
    $scope.displayCreateBookButton = false;
    $scope.showloading = false;

    $scope.book = {}

    $scope.getBookList = function () {
        var url = $scope.url;
        $scope.lastAction = 'list';

        $scope.startDialogAjaxRequest();

        var config = {params: {page: $scope.pageToGet}};

        $http.get(url, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, null, false);
            })
            .error(function () {
                $scope.state = 'error';
                $scope.displayCreateBookButton = false;
            });
    }

    $scope.populateTable = function (data) {
        if (data.pagesCount > 0) {
            $scope.state = 'list';
            $scope.page = {source: data.bookList, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalBooks : data.totalBooks};
            
            console.log("**** " + $scope.page.pagesCount);
            console.log("**** " + $scope.page.currentPage);
            if($scope.page.pagesCount <= $scope.page.currentPage){
                $scope.pageToGet = $scope.page.pagesCount - 1;
                $scope.page.currentPage = $scope.page.pagesCount - 1;
            }

            $scope.displayCreateBookButton = true;
        } else {
            $scope.state = 'noresult';
            $scope.displayCreateBookButton = true;            
        }

        $scope.displayMessageToUser = false;
        
    }

    $scope.changePage = function (page) {
        $scope.pageToGet = page;
        $scope.getBookList();
        
    };

    $scope.exit = function (modalId) {
        $(modalId).modal('hide');

        $scope.book = {};
        $scope.errorOnSubmit = false;
        $scope.errorIllegalAccess = false;
        $scope.displayValidationError = false;
    }

    $scope.finishAjaxCallOnSuccess = function (data, modalId, isPagination) {
    	console.log(data);
    	$scope.populateTable(data);
        $("#loadingModal").modal('hide');
        if(!isPagination){
            if(modalId){
                $scope.exit(modalId);
            }
        }

        $scope.lastAction = '';
    }

    $scope.startDialogAjaxRequest = function () {
        $scope.displayValidationError = false;
        $("#loadingModal").modal('show');
        $scope.previousState = $scope.state;
        $scope.state = 'busy';
    }

    $scope.handleErrorInDialogs = function (status) {
        $("#loadingModal").modal('hide');
        $scope.state = $scope.previousState;

        // illegal access
        if(status == 403){
            $scope.errorIllegalAccess = true;
            return;
        }

        $scope.errorOnSubmit = true;
        $scope.lastAction = '';
    }



    $scope.resetBook = function(){
        $scope.book = {};
        $scope.loadCaptcha();
    };

    $scope.createBook = function (newBookForm) {
    	//captcha is cleaning
    	$scope.captchaOrg="";
    	$scope.captchaAgain="";
    	
        if (!newBookForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'create';

        var url = $scope.url;

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $scope.startDialogAjaxRequest();
        
        console.log("**** bookkkk : " + JSON.stringify($scope.book));

        $http.post(url, $.param($scope.book), config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#addBooksModal", false);
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.selectedBook = function (book) {
        var selectedBook = angular.copy(book);
        $scope.book = selectedBook;
    }

    $scope.updateBook = function (updateBookForm) {
        if (!updateBookForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'update';

        var url = $scope.url + "u/" + $scope.book.id;
        console.log("*** update url: " + url);

        $scope.startDialogAjaxRequest();
        
        $scope.bk = {};
        $scope.bk.id = $scope.book.id;
        $scope.bk.bookName = $scope.book.bookName;
        $scope.bk.bookAuthor = $scope.book.bookAuthor;
        $scope.bk.cost = $scope.book.cost;
        var config = {headers: {'Content-Type': 'application/json; charset=UTF-8'}};
        $http.post(url, $scope.bk, config)
            .success(function (data) {
            	console.log("success metoda girdi");
                $scope.finishAjaxCallOnSuccess(data, "#updateBooksModal", false);
            })
            .error(function(data, status, headers, config) {
            	console.log("***** data: " + JSON.stringify(data));
            	console.log("***** headers: " + JSON.stringify(headers));
            	console.log("***** config: " + JSON.stringify(config));
                $scope.handleErrorInDialogs(status);
            });
    };

    
    $scope.deleteBook = function () {
        $scope.lastAction = 'delete';

        var url = $scope.url + $scope.book.id;

        $scope.startDialogAjaxRequest();

        var params = {page: $scope.pageToGet};

        $http({
            method: 'DELETE',
            url: url,
            params: params
        }).success(function (data) {
                $scope.resetBook();
                $scope.finishAjaxCallOnSuccess(data, "#deleteBooksModal", false);
            }).error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.captchaOrg = "";
    $scope.captchaAgain = "";
    $scope.words = ["Ankara","Istanbul","Izmir","Bursa"];
    $scope.loadCaptcha = function(){
    	var tmpNum = Math.floor((Math.random() * 3));
    	console.log("Captcha : " + tmpNum);
    	$scope.captchaOrg = $scope.words[tmpNum];
    	console.log("Captcha : " + $scope.captchaOrg);
    }
    
    
    
    
    $scope.getBookList();
};
