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
function Octahedral(r, h) {
	this.type = "Octahedral" ;
	var shape = new THREE.Group() ;
	var ob = new Linear(r, h) ;
	shape.add(ob.shape) ;
				
	var ob1 = new Linear(r, h) ;
	var ob1instance = ob1.shape ;
	ob1instance.rotation.z = Math.PI/2 ;
	shape.add(ob1instance) ;

	var ob2 = new Linear(r, h) ;
	var ob2instance = ob2.shape ;
	ob2instance.rotation.x = Math.PI/2 ;
	shape.add(ob2instance) ;
	
	this.shape = shape ;
}
function PentagonalBipyramidal(r, h) {
	this.type = "TrigonalPlanar" ;
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
function Tetrahedral(r, h) {
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

	var ob3 = new Bond(r, h) ;
	var shape = ob3.shape ;
	shape.applyMatrix( new THREE.Matrix4().makeTranslation( 0, h/2, 0 ) );
	shape.position.set(0, 0, 0) ;
	shape.rotation.x += Math.PI/2 + Math.PI/6  ;
	shape.rotation.z -= Math.PI/5 ;
	group.add(shape) ;

	var ob4 = new Bond(r, h) ;
	var shape = ob4.shape ;
	group.add(shape) ;

	this.shape = group ;
}
function TrigonalBypyramidal(r, h) {
	this.type = "TrigonalBypyramidal" ;
	var group = new THREE.Group() ;
	/*central one*/
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xFF1493, specular: 0x555555, shininess: 30 } );
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
	group.add(sphere) ;	
	/*end*/
	var l = new Linear(r, h) ;
	l.shape.rotation.x = Math.PI/2 ;
	group.add(l.shape) ;
	
	var angle = (2*Math.PI)/3 ;
	for(var i = 0; i < (2*Math.PI); i += angle) {
		var ob = new Bond(r, h) ;
		var shape = ob.shape ;
		shape.rotation.z += i ;
		group.add(shape) ;
	}
	group.rotation.x += Math.PI/2 ;
	this.shape = group ;
}
function TrigonalPlanar(r, h) {
	this.type = "TrigonalPlanar" ;
	var group = new THREE.Group() ;
	/*central one*/
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xFF1493, specular: 0x555555, shininess: 30 } );
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),material);
	group.add(sphere) ;	
	/*end*/
	var angle = (2*Math.PI)/3 ;
	for(var i = 0; i < (2*Math.PI); i += angle) {
		var ob = new Bond(r, h) ;
		var shape = ob.shape ;
		shape.rotation.z += i ;
		group.add(shape) ;
	}
	this.shape = group ;
}


