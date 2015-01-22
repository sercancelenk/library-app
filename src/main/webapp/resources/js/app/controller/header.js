function LocationController ($scope, $location) {
	
    if($location.$$absUrl.lastIndexOf('/books') > 0){
        $scope.activeURL = 'books';
    } else{
        $scope.activeURL = 'home';
    }
    
};