/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Ctrl($scope) {
  $scope.tpl = {};
  $scope.tpl.contentUrl ="";
  $scope.getUrl=function(val)
  {   
     // val=value.$id;
        if(val==1)
            $scope.tpl.contentUrl='sidebar1.jsp';
        else if(val==3)
            $scope.tpl.contentUrl='sidebar.jsp';
        else if(val==4)
            $scope.tpl.contentUrl='sidebar2.jsp';
        else
            $scope.tpl.contentUrl='generic.jsp';

  }
}