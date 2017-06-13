function Cubic(edgeLength, nodeRadius, param) {
	this.edgeLength = edgeLength ;
	var shape = new THREE.Group() ;
	var points = [[-edgeLength, -edgeLength, +edgeLength], 
				  [+edgeLength, -edgeLength, +edgeLength],
				  [+edgeLength, +edgeLength, +edgeLength],
				  [-edgeLength, +edgeLength, +edgeLength],
				  [-edgeLength, -edgeLength, -edgeLength],
				  [+edgeLength, -edgeLength, -edgeLength],
				  [+edgeLength, +edgeLength, -edgeLength],
				  [-edgeLength, +edgeLength, -edgeLength],
				  [0, 0, 0]] ;


	var face_points = [[0, 0, edgeLength], [0, edgeLength, 0],
					   [edgeLength, 0, 0], [0, 0, -edgeLength],
					   [0, -edgeLength, 0], [-edgeLength, 0, 0]] ;



	var co_ordinates = [[3,2], [3, 0], [1, 0], [2, 1], [7, 6], [7, 4], [5, 4], [6, 5], [7, 3], [0, 4], [5, 1], [6, 2]] ;
	var len = (param == 1) ? 9 : 8 ;
	for(var i = 0; i < len; i++) {
		var s = makeSphere(nodeRadius) ;
		s.position.set(points[i][0], points[i][1], points[i][2]) ;
		shape.add(s) ;
	}
	
	for(var i = 0; i < 12; i++) {
    	var l1 = getLine(points[co_ordinates[i][0]], points[co_ordinates[i][1]]) ;
    	shape.add(l1) ;
	}
	if(param == 2) {
		for(var i = 0; i < 6; i++) {
			var s = makeSphere(nodeRadius) ;
			s.position.set(face_points[i][0], face_points[i][1], face_points[i][2]) ;
			shape.add(s) ;
		}
    }
    this.shape = shape ;
}
function makeSphere(nodeRadius) {
	var sphere = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0x336699, specular: 0x555555, shininess: 30 } )
	);	
	return sphere ;
}
function getLine(pointX, pointY) {
    var l = new THREE.Geometry() ;
    l.vertices.push(new THREE.Vector3(pointX[0], pointX[1], pointX[2])) ;
    l.vertices.push(new THREE.Vector3(pointY[0], pointY[1], pointY[2])) ;
    var lMesh = new THREE.Line(l, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    return lMesh ;
}
function Hexagonal(edgeLength, nodeRadius) {
	this.edgeLength = edgeLength ;
	var shape = new THREE.Group() ;
	var points = [ 	[-edgeLength/1.5, +edgeLength, +edgeLength], [-edgeLength/1.5, -edgeLength, +edgeLength],
					[+edgeLength/1.5, +edgeLength, +edgeLength], [+edgeLength/1.5, -edgeLength, +edgeLength], 
					[-edgeLength/1.5, +edgeLength, -edgeLength], [-edgeLength/1.5, -edgeLength, -edgeLength],
					[+edgeLength/1.5, +edgeLength, -edgeLength], [+edgeLength/1.5, -edgeLength, -edgeLength],
					[-edgeLength-edgeLength/3, +edgeLength, 0], [-edgeLength-edgeLength/3, -edgeLength, 0],
					[+edgeLength+edgeLength/3, +edgeLength, 0], [+edgeLength+edgeLength/3, -edgeLength, 0] ] ;

	for(var i = 0; i < 12; i++) {
		var s = makeSphere(nodeRadius) ;
		s.position.set(points[i][0], points[i][1], points[i][2]) ;
		shape.add(s) ;
	}

	var co_ordinates = [[0, 1], [2, 3], [4, 5], [6, 7], [10, 11], [8, 9], [0, 2], [4, 6], [1, 3], [5, 7], [0, 8], [1, 9],
						[4, 8], [5, 9], [6, 10], [7, 11], [2, 10], [3, 11]] ;
	for(var i = 0; i < 18; i++) {
    	var l1 = getLine(points[co_ordinates[i][0]], points[co_ordinates[i][1]]) ;
    	shape.add(l1) ;
	}
    this.shape = shape ;
}
function Monoclinic(edgeLength, nodeRadius, param) {
	this.edgeLength = edgeLength ;
	var shape = new THREE.Group() ;
	var points = [	[+1.5*edgeLength, +edgeLength, +edgeLength], [+edgeLength, -edgeLength, +edgeLength],
					[-0.5*edgeLength, +edgeLength, +edgeLength], [-edgeLength, -edgeLength, +edgeLength],
					[+1.5*edgeLength, +edgeLength, -edgeLength], [+edgeLength, -edgeLength, -edgeLength],
					[-0.5*edgeLength, +edgeLength, -edgeLength], [-edgeLength, -edgeLength, -edgeLength],
					[-0.75*edgeLength, 0, 0], [1.25*edgeLength, 0, 0]] ;
	var len = (param == 0) ? 8 : 10 ;
	for(var i = 0; i < len; i++) {
		var s = makeSphere(nodeRadius) ;
		s.position.set(points[i][0], points[i][1], points[i][2]) ;
		shape.add(s) ;
	}

	var co_ordinates = [[0, 1], [2, 3], [4, 5], [6, 7], [7, 5], [4, 0], [6, 2], [3, 1], [5, 1], [7, 3], [6, 4], [2, 0]] ;
	for(var i = 0; i < 12; i++) {
    	var l1 = getLine(points[co_ordinates[i][0]], points[co_ordinates[i][1]]) ;
    	shape.add(l1) ;
	}
    
    this.shape = shape ;
}
function Orthorhombic(edgeLength, nodeRadius, param) {
	this.edgeLength = edgeLength ;
	var shape = new THREE.Group() ;

	var points = [	[-1.5*edgeLength, -1.1*edgeLength, +edgeLength], [+1.5*edgeLength, -1.1*edgeLength, +edgeLength],
					[+1.5*edgeLength, +1.1*edgeLength, +edgeLength], [-1.5*edgeLength, +1.1*edgeLength, +edgeLength],
					[-1.5*edgeLength, -1.1*edgeLength, -edgeLength], [+1.5*edgeLength, -1.1*edgeLength, -edgeLength],
					[+1.5*edgeLength, +1.1*edgeLength, -edgeLength], [-1.5*edgeLength, +1.1*edgeLength, -edgeLength],
					[0, 0, 0]] ;
	var len = (param == 1) ? 9 : 8 ;
 	for(var i = 0; i < len; i++) {
		var s = makeSphere(nodeRadius) ;
		s.position.set(points[i][0], points[i][1], points[i][2]) ;
		shape.add(s) ;
	}
	var co_ordinates = [[3,2], [3, 0], [1, 0], [2, 1], [7, 6], [7, 4], [5, 4], [6, 5], [7, 3], [0, 4], [5, 1], [6, 2]] ;
	
	for(var i = 0; i < 12; i++) {
    	var l1 = getLine(points[co_ordinates[i][0]], points[co_ordinates[i][1]]) ;
    	shape.add(l1) ;
	}
	len = (param == 2 || param == 3) ? ( (param == 2) ? 6 : 2) : 0 ; 
	var face_points = [	[+1.5*edgeLength, 0, 0], [-1.5*edgeLength, 0, 0], [0, 0, +1.1*edgeLength], 
						[0, +1.1*edgeLength, 0], [0, 0, -1.1*edgeLength], [0, -1.1*edgeLength, 0]  ] ;

	for(var i = 0; i < len; i++) {
		var s = makeSphere(nodeRadius) ;
		s.position.set(face_points[i][0], face_points[i][1], face_points[i][2]) ;
		shape.add(s) ;
	}


    
    this.shape = shape ;
}
function Tetragonal(edgeLength, nodeRadius, param) {
	this.edgeLength = edgeLength ;
	var shape = new THREE.Group() ;
	var points = [	[-1.5*edgeLength, -edgeLength, +edgeLength], [+1.5*edgeLength, -edgeLength, +edgeLength],
					[+1.5*edgeLength, +edgeLength, +edgeLength], [-1.5*edgeLength, +edgeLength, +edgeLength],
					[-1.5*edgeLength, -edgeLength, -edgeLength], [+1.5*edgeLength, -edgeLength, -edgeLength], 
					[+1.5*edgeLength, +edgeLength, -edgeLength], [-1.5*edgeLength, +edgeLength, -edgeLength],
					[0, 0,0] ] ;
	var len = (param == 1) ? 9 : 8 ;
	for(var i = 0; i < len; i++) {
		var s = makeSphere(nodeRadius) ;
		s.position.set(points[i][0], points[i][1], points[i][2]) ;
		shape.add(s) ;
	}

	var co_ordinates = [[3,2], [3, 0], [1, 0], [2, 1], [7, 6], [7, 4], [5, 4], [6, 5], [7, 3], [0, 4], [5, 1], [6, 2]] ;
	for(var i = 0; i < 12; i++) {
    	var l1 = getLine(points[co_ordinates[i][0]], points[co_ordinates[i][1]]) ;
    	shape.add(l1) ;
	}
    
    this.shape = shape ;
}