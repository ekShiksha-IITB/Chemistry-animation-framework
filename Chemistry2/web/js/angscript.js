/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Ctrl($scope) {
  $scope.tpl = {};
  $scope.tpl.contentUrl ="sidebars/generic.jsp";
  $scope.getUrl=function(val)
  {   
     // val=value.$id;
        if(val==1)
            $scope.tpl.contentUrl='sidebars/atom.jsp';
        else if(val==3)
            $scope.tpl.contentUrl='sidebars/sidebar.jsp';
        else if(val==4)
            $scope.tpl.contentUrl='sidebars/sidebar2.jsp';
        else
            $scope.tpl.contentUrl='sidebars/generic.jsp';

  }
}