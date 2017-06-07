function Linear(r, h) {
	this.type = "Linear" ;
	var group = new THREE.Group() ;
	
	var sphere = new THREE.Mesh(new THREE.SphereBufferGeometry(r, 32, 32),new THREE.MeshBasicMaterial({color : 0xFF1493}));
	group.add(sphere) ;
	
	var upper = new Bond(r, h) ;
	upper.shape.rotation.z = 0 ;
	group.add(upper.shape) ;

	var lower = new Bond(r, h) ;
	lower.shape.rotation.z = Math.PI ;
	group.add(lower.shape) ;
	
	this.shape = group ;
}
