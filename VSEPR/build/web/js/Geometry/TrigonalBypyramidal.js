function TrigonalBypyramidal(r, h) {
	this.type = "TrigonalBypyramidal" ;
	var group = new THREE.Group() ;
	/*central one*/
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),new THREE.MeshBasicMaterial({color : 0xFF1493}));
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
	this.shape = group ;
}
