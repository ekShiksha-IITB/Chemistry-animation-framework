function Tetrahedral(r, h) {
	/*yet to complete*/
	this.type = "Tetrahedral" ;
	//alert('in') ;	
	var group = new THREE.Group() ;
	/*central one*/
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),new THREE.MeshBasicMaterial({color : 0xFF1493}));
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
