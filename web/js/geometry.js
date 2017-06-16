function Bond(r, h) {
	this.type = "Bond" ;
	var group = new THREE.Group() ;
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0x008080, specular: 0x555555, shininess: 30 } );
	
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(r, 32, 32),material);
	sphere.position.y += 2*h+r/2 ;
	group.add(sphere) ;
	
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0x008080, specular: 0x555555, shininess: 30 } );
	
	var cylinder = new THREE.Mesh(new THREE.CylinderGeometry( 0.1, 0.1, h, 32 ), material);
	cylinder.position.y += h+h/2 ;
	group.add(cylinder) ;
	
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xFF1493, specular: 0x555555, shininess: 30 } );
		
	var cylinder = new THREE.Mesh(new THREE.CylinderGeometry( 0.1, 0.1, h, 32 ), material);
	cylinder.position.y += h/2 ;
	group.add(cylinder) ;

	
	this.shape = group ;
}
function Linear(r, h) {
	this.type = "Linear" ;
	var group = new THREE.Group() ;
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xFF1493, specular: 0x555555, shininess: 30 } );
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32), material);
	group.add(sphere) ;
	
	var upper = new Bond(r, h) ;
	upper.shape.rotation.z = 0 ;
	group.add(upper.shape) ;

	var lower = new Bond(r, h) ;
	lower.shape.rotation.z = Math.PI ;
	group.add(lower.shape) ;
	this.shape = group ;
}
function Octahedral(r, h, noOfLonePair) {
	this.type = "Octahedral" ;	
	var points = [ [0, 0, -0.4], [0, 0, +0.4], [+0.4, 0, 0], [-0.4, 0, 0]] ;
	var shape = new THREE.Group() ;
	var ob = new Linear(r, h) ;
	shape.add(ob.shape) ;
	if(noOfLonePair == 0) {
		var ob1 = new Linear(r, h) ;
		var ob1instance = ob1.shape ;
		ob1instance.rotation.z = Math.PI/2 ;
		shape.add(ob1instance) ;

		var ob2 = new Linear(r, h) ;
		var ob2instance = ob2.shape ;
		ob2instance.rotation.x = Math.PI/2 ;
		shape.add(ob2instance) ;
	} else if(noOfLonePair == 1) {
		var ob1 = new Linear(r, h) ;
		var ob1instance = ob1.shape ;
		ob1instance.rotation.z = Math.PI/2 ;
		shape.add(ob1instance) ;
		
		var ob2 = new Bond(r, h) ;
		var ob2instance = ob2.shape ;
		ob2instance.rotation.x = Math.PI/2 ;
		shape.add(ob2instance) ;
		for(var i = 0; i < noOfLonePair; i++) {
			var lonepair = makeLonePair() ;
			lonepair.position.set(points[i][0], points[i][1], points[i][2]) ;
			shape.add(lonepair) ;
		}
	} else if(noOfLonePair == 2) {
		var ob1 = new Linear(r, h) ;
		var ob1instance = ob1.shape ;
		ob1instance.rotation.z = Math.PI/2 ;
		shape.add(ob1instance) ;
		
		for(var i = 0; i < noOfLonePair; i++) {
			var lonepair = makeLonePair() ;
			lonepair.position.set(points[i][0], points[i][1], points[i][2]) ;
			shape.add(lonepair) ;
		}	
	} else if(noOfLonePair == 3) {
		var ob1 = new Bond(r, h) ;
		var ob1instance = ob1.shape ;
		ob1instance.rotation.z = Math.PI/2 ;
		shape.add(ob1instance) ;
		
		for(var i = 0; i < noOfLonePair; i++) {
			var lonepair = makeLonePair() ;
			lonepair.position.set(points[i][0], points[i][1], points[i][2]) ;
			shape.add(lonepair) ;
		}	
	} else if(noOfLonePair == 4) {
		
		for(var i = 0; i < noOfLonePair; i++) {
			var lonepair = makeLonePair() ;
			lonepair.position.set(points[i][0], points[i][1], points[i][2]) ;
			shape.add(lonepair) ;
		}
	}
	this.shape = shape ;
}
function makeLonePair() {
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xffff00, specular: 0x555555, shininess: 30 } );
	var lonepair = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
	return lonepair ;		
}
function PentagonalBipyramidal(r, h) {
	this.type = "PentagonalBipyramidal" ;
	var group = new THREE.Group() ;
	/*central one*/
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xFF1493, specular: 0x555555, shininess: 30 } );
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32), material);
	group.add(sphere) ;	
	/*end*/
	var l = new Linear(r, h) ;
	l.shape.rotation.x = Math.PI/2 ;
	group.add(l.shape) ;
	
	var angle = (2*Math.PI)/5 ;
	for(var i = 0; i < (2*Math.PI); i += angle) {
		var ob = new Bond(r, h) ;
		var shape = ob.shape ;
		shape.rotation.z += i ;
		group.add(shape) ;
	}
	group.rotation.x += Math.PI/2 ;
	this.shape = group ;
}
function Tetrahedral(r, h, noOfLonePair) {
	/*yet to complete*/
	this.type = "Tetrahedral" ;
	//alert('in') ;	
	var group = new THREE.Group() ;
	/*central one*/
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xFF1493, specular: 0x555555, shininess: 30 } );
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
	group.add(sphere) ;	
	/*end*/

	var ob1 = new Bond(r, h) ;
	var shape = ob1.shape ;
	shape.applyMatrix( new THREE.Matrix4().makeTranslation( 0, h/2, 0 ) );
	shape.position.set(0, 0, 0) ;
	shape.rotation.x -= Math.PI/2 + Math.PI/6  ;
	group.add(shape) ;

	var ob2 = new Bond(r, h) ;
	var shape = ob2.shape ;
	shape.applyMatrix( new THREE.Matrix4().makeTranslation( 0, h/2, 0 ) );
	shape.position.set(0, 0, 0) ;
	shape.rotation.x += Math.PI/2 + Math.PI/6  ;
	shape.rotation.z += Math.PI/5 ;
	group.add(shape) ;

	var x = sphere.position.x ;
	var y = sphere.position.y ;
	var z = sphere.position.z ;
	var points = [[0, -0.1, -0.5], [x+0.5, y-0.2, 0]] ;

	if(noOfLonePair == 0) {
		var ob4 = new Bond(r, h) ;
		var shape = ob4.shape ;
		group.add(shape) ;
		
		var ob3 = new Bond(r, h) ;
		var shape = ob3.shape ;
		shape.applyMatrix( new THREE.Matrix4().makeTranslation( 0, h/2, 0 ) );
		shape.position.set(0, 0, 0) ;
		shape.rotation.x += Math.PI/2 + Math.PI/6  ;
		shape.rotation.z -= Math.PI/5 ;
		group.add(shape) ;
	} else if(noOfLonePair == 1) {
		var ob3 = new Bond(r, h) ;
		var shape = ob3.shape ;
		shape.applyMatrix( new THREE.Matrix4().makeTranslation( 0, h/2, 0 ) );
		shape.position.set(0, 0, 0) ;
		shape.rotation.x += Math.PI/2 + Math.PI/6  ;
		shape.rotation.z -= Math.PI/5 ;
		group.add(shape) ;		
		for(var i = 0; i < noOfLonePair; i++) {
			var lonepair = makeLonePair() ;
			lonepair.position.set(points[i][0], points[i][1], points[i][2]) ;
			shape.add(lonepair) ;
		}
	} else if(noOfLonePair == 2) {
	
		for(var i = 0; i < noOfLonePair; i++) {
			var lonepair = makeLonePair() ;
			lonepair.position.set(points[i][0], points[i][1], points[i][2]) ;
			shape.add(lonepair) ;
		}					
	}
	this.shape = group ;
}
function TrigonalBipyramidal(r, h, noOfLonePair) {
	this.type = "TrigonalBipyramidal" ;
	var group = new THREE.Group() ;
	/*central one*/
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xFF1493, specular: 0x555555, shininess: 30 } );
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
	group.add(sphere) ;	
	/*end*/
	var l = new Linear(r, h) ;
	l.shape.rotation.x = Math.PI/2 ;
	group.add(l.shape) ;
	var points = [[sphere.position.x, sphere.position.y+0.5, sphere.position.z], [sphere.position.x-0.5, sphere.position.y-0.2, sphere.position.z], [sphere.position.x+0.5, sphere.position.y-0.2, sphere.position.z]] ;
	if(noOfLonePair == 0) {
		var angle = (2*Math.PI)/3 ;
		for(var i = 0; i < (2*Math.PI); i += angle) {
			var ob = new Bond(r, h) ;
			var shape = ob.shape ;
			shape.rotation.z += i ;
			group.add(shape) ;
		}
	} else if(noOfLonePair == 1) {
		var angle = (2*Math.PI)/3 ;
		for(var i = angle; i < (2*Math.PI); i += angle) {
			var ob = new Bond(r, h) ;
			var shape = ob.shape ;
			shape.rotation.z += i ;
			group.add(shape) ;
		}
		var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xffff00, specular: 0x555555, shininess: 30 } );
		var lonepair = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
		lonepair.position.set(points[0][0], points[0][1], points[0][2]) ;
		group.add(lonepair) ;		
	} else if(noOfLonePair == 2) {
		var angle = (2*Math.PI)/3 ;
		for(var i = 2*angle; i < (2*Math.PI); i += angle) {
			var ob = new Bond(r, h) ;
			var shape = ob.shape ;
			shape.rotation.z += i ;
			group.add(shape) ;
		}
		var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xffff00, specular: 0x555555, shininess: 30 } );
		var lonepair = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
		lonepair.position.set(sphere.position.x, sphere.position.y+0.5, sphere.position.z) ;
		group.add(lonepair) ;	
		var lonepair = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
		lonepair.position.set(sphere.position.x-0.5, sphere.position.y-0.2, sphere.position.z) ;
		group.add(lonepair) ;				
	} else if(noOfLonePair == 3) {
		var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xffff00, specular: 0x555555, shininess: 30 } );
		var lonepair = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
		lonepair.position.set(sphere.position.x, sphere.position.y+0.5, sphere.position.z) ;
		group.add(lonepair) ;	
		var lonepair = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
		lonepair.position.set(sphere.position.x-0.5, sphere.position.y-0.2, sphere.position.z) ;
		group.add(lonepair) ;		
		var lonepair = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
		lonepair.position.set(sphere.position.x+0.5, sphere.position.y-0.2, sphere.position.z) ;
		group.add(lonepair) ;
	}
	group.rotation.x += Math.PI/2 ;
	this.shape = group ;
}
function TrigonalPlanar(r, h, noOfLonePair) {
	this.type = "TrigonalPlanar" ;
	var group = new THREE.Group() ;
	/*central one*/
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xFF1493, specular: 0x555555, shininess: 30 } );
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
	group.add(sphere) ;	
	/*end*/
	var angle = (2*Math.PI)/3;
	if(noOfLonePair == 0) {
		for(var i = 0; i < (2*Math.PI); i += angle) {
			var ob = new Bond(r, h) ;
			var shape = ob.shape ;
			shape.rotation.z += i ;
			group.add(shape) ;
		}
	} else {
		for(var i = angle; i < (2*Math.PI); i += angle) {
			var ob = new Bond(r, h) ;
			var shape = ob.shape ;
			shape.rotation.z += i ;
			group.add(shape) ;
		}
		var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xffff00, specular: 0x555555, shininess: 30 } );
		var lonepair = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
		lonepair.position.set(sphere.position.x, sphere.position.y+0.5, sphere.position.z) ;
		group.add(lonepair) ;
	}
	this.shape = group ;
}
