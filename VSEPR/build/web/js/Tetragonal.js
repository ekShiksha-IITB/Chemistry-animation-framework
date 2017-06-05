function Tetragonal(r) {
	this.r = r ;
	var shape = new THREE.Group() ;
	var s1 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(0.3, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s1.position.set(-1.5*r, -r, r) ;
	shape.add(s1) ;
	var s2 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(0.3, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s2.position.set(+1.5*r, -r, r) ;
	shape.add(s2) ;
	var s3 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(0.3, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s3.position.set(+1.5*r, +r, r) ;
	shape.add(s3) ;
	var s4 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(0.3, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s4.position.set(-1.5*r, +r, r) ;
	shape.add(s4) ;

	var s5 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(0.3, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s5.position.set(-1.5*r, -r, -r) ;
	shape.add(s5) ;
	var s6 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(0.3, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s6.position.set(+1.5*r, -r, -r) ;
	shape.add(s6) ;
	var s3 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(0.3, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s3.position.set(+1.5*r, +r, -r) ;
	shape.add(s3) ;
	var s8 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(0.3, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s8.position.set(-1.5*r, +r, -r) ;
	shape.add(s8) ;

	
    var l1 = new THREE.Geometry() ;
    l1.vertices.push(new THREE.Vector3(-1.5*r, +r, +r)) ;
    l1.vertices.push(new THREE.Vector3(+1.5*r, +r, +r)) ;
    var l1Mesh = new THREE.Line(l1, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l1Mesh) ;
    var l2 = new THREE.Geometry() ;
    l2.vertices.push(new THREE.Vector3(-1.5*r, +r, +r)) ;
    l2.vertices.push(new THREE.Vector3(-1.5*r, -r, +r)) ;
    var l2Mesh = new THREE.Line(l2, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l2Mesh) ;
    var l3 = new THREE.Geometry() ;
    l3.vertices.push(new THREE.Vector3(+1.5*r, -r, +r)) ;
    l3.vertices.push(new THREE.Vector3(-1.5*r, -r, +r)) ;
    var l3Mesh = new THREE.Line(l3, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l3Mesh) ;
    var l4 = new THREE.Geometry() ;
    l4.vertices.push(new THREE.Vector3(+1.5*r, +r, +r)) ;
    l4.vertices.push(new THREE.Vector3(+1.5*r, -r, +r)) ;
    var l4Mesh = new THREE.Line(l4, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l4Mesh) ;

    var l5 = new THREE.Geometry() ;
    l5.vertices.push(new THREE.Vector3(-1.5*r, +r, -r)) ;
    l5.vertices.push(new THREE.Vector3(+1.5*r, +r, -r)) ;
    var l5Mesh = new THREE.Line(l5, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l5Mesh) ;
    var l6 = new THREE.Geometry() ;
    l6.vertices.push(new THREE.Vector3(-1.5*r, +r, -r)) ;
    l6.vertices.push(new THREE.Vector3(-1.5*r, -r, -r)) ;
    var l6Mesh = new THREE.Line(l6, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l6Mesh) ;
    var l3 = new THREE.Geometry() ;
    l3.vertices.push(new THREE.Vector3(+1.5*r, -r, -r)) ;
    l3.vertices.push(new THREE.Vector3(-1.5*r, -r, -r)) ;
    var l3Mesh = new THREE.Line(l3, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l3Mesh) ;
	
    var l8 = new THREE.Geometry() ;
    l8.vertices.push(new THREE.Vector3(+1.5*r, +r, -r)) ;
    l8.vertices.push(new THREE.Vector3(+1.5*r, -r, -r)) ;
    var l8Mesh = new THREE.Line(l8, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l8Mesh) ;

    var l9 = new THREE.Geometry() ;
    l9.vertices.push(new THREE.Vector3(-1.5*r, +r, -r)) ;
    l9.vertices.push(new THREE.Vector3(-1.5*r, +r, +r)) ;
    var l9Mesh = new THREE.Line(l9, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l9Mesh) ;
    var l10 = new THREE.Geometry() ;
    l10.vertices.push(new THREE.Vector3(-1.5*r, -r, +r)) ;
    l10.vertices.push(new THREE.Vector3(-1.5*r, -r, -r)) ;
    var l10Mesh = new THREE.Line(l10, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l10Mesh) ;
    var l11 = new THREE.Geometry() ;
    l11.vertices.push(new THREE.Vector3(+1.5*r, -r, -r)) ;
    l11.vertices.push(new THREE.Vector3(+1.5*r, -r, +r)) ;
    var l11Mesh = new THREE.Line(l11, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l11Mesh) ;
	
    var l12 = new THREE.Geometry() ;
    l12.vertices.push(new THREE.Vector3(+1.5*r, +r, -r)) ;
    l12.vertices.push(new THREE.Vector3(+1.5*r, +r, +r)) ;
    var l12Mesh = new THREE.Line(l12, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l12Mesh) ;
    
    this.shape = shape ;
}
