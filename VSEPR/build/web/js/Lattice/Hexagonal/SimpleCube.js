function HexagonalSimpleCube(edgeLength, nodeRadius) {
	this.edgeLength = edgeLength ;
	var shape = new THREE.Group() ;
	var s1 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s1.position.set(-edgeLength/1.5, +edgeLength, +edgeLength) ;
	shape.add(s1) ;
	var s2 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s2.position.set(-edgeLength/1.5, -edgeLength, +edgeLength) ;
	shape.add(s2) ;
	var s3 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s3.position.set(+edgeLength/1.5, +edgeLength, +edgeLength) ;
	shape.add(s3) ;
	var s4 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s4.position.set(+edgeLength/1.5, -edgeLength, +edgeLength) ;
	shape.add(s4) ;

	var s5 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s5.position.set(-edgeLength/1.5, +edgeLength, -edgeLength) ;
	shape.add(s5) ;
	var s6 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s6.position.set(-edgeLength/1.5, -edgeLength, -edgeLength) ;
	shape.add(s6) ;
	var s7 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s7.position.set(+edgeLength/1.5, +edgeLength, -edgeLength) ;
	shape.add(s7) ;
	var s8 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s8.position.set(+edgeLength/1.5, -edgeLength, -edgeLength) ;
	shape.add(s8) ;

	var s9 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s9.position.set(-edgeLength-edgeLength/3, +edgeLength, 0) ;
	shape.add(s9) ;
	var s10 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s10.position.set(-edgeLength-edgeLength/3, -edgeLength, 0) ;
	shape.add(s10) ;
	var s11 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s11.position.set(+edgeLength+edgeLength/3, +edgeLength, 0) ;
	shape.add(s11) ;
	var s12 = new THREE.Mesh(
		new THREE.SphereBufferGeometry(nodeRadius, 32, 32),
		new THREE.MeshBasicMaterial({color : 'steelblue'})
	);
	s12.position.set(+edgeLength+edgeLength/3, -edgeLength, 0) ;
	shape.add(s12) ;

	
    var l1 = new THREE.Geometry() ;
    l1.vertices.push(new THREE.Vector3(-edgeLength/1.5, +edgeLength, +edgeLength)) ;
    l1.vertices.push(new THREE.Vector3(-edgeLength/1.5, -edgeLength, +edgeLength)) ;
    var l1Mesh = new THREE.Line(l1, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l1Mesh) ;
	
    var l2 = new THREE.Geometry() ;
    l2.vertices.push(new THREE.Vector3(+edgeLength/1.5, +edgeLength, +edgeLength)) ;
    l2.vertices.push(new THREE.Vector3(+edgeLength/1.5, -edgeLength, +edgeLength)) ;
    var l2Mesh = new THREE.Line(l2, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l2Mesh) ;

    var l3 = new THREE.Geometry() ;
    l3.vertices.push(new THREE.Vector3(-edgeLength/1.5, +edgeLength, -edgeLength)) ;
    l3.vertices.push(new THREE.Vector3(-edgeLength/1.5, -edgeLength, -edgeLength)) ;
    var l3Mesh = new THREE.Line(l3, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
	shape.add(l3Mesh) ;

    var l4 = new THREE.Geometry() ;
    l4.vertices.push(new THREE.Vector3(+edgeLength/1.5, +edgeLength, -edgeLength)) ;
    l4.vertices.push(new THREE.Vector3(+edgeLength/1.5, -edgeLength, -edgeLength)) ;
    var l4Mesh = new THREE.Line(l4, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l4Mesh) ;

    var l5 = new THREE.Geometry() ;
    l5.vertices.push(new THREE.Vector3(+edgeLength+edgeLength/3, +edgeLength, 0)) ;
    l5.vertices.push(new THREE.Vector3(+edgeLength+edgeLength/3, -edgeLength, 0)) ;
    var l5Mesh = new THREE.Line(l5, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l5Mesh) ;
 
    var l6 = new THREE.Geometry() ;
    l6.vertices.push(new THREE.Vector3(-edgeLength-edgeLength/3, +edgeLength, 0)) ;
    l6.vertices.push(new THREE.Vector3(-edgeLength-edgeLength/3, -edgeLength, 0)) ;
    var l6Mesh = new THREE.Line(l6, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l6Mesh) ;

    var l7 = new THREE.Geometry() ;
    l7.vertices.push(new THREE.Vector3(-edgeLength/1.5, +edgeLength, +edgeLength)) ;
    l7.vertices.push(new THREE.Vector3(+edgeLength/1.5, +edgeLength, +edgeLength)) ;
    var l7Mesh = new THREE.Line(l7, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l7Mesh) ;

    var l8 = new THREE.Geometry() ;
    l8.vertices.push(new THREE.Vector3(-edgeLength/1.5, +edgeLength, -edgeLength)) ;
    l8.vertices.push(new THREE.Vector3(+edgeLength/1.5, +edgeLength, -edgeLength)) ;
    var l8Mesh = new THREE.Line(l8, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l8Mesh) ;

    var l9 = new THREE.Geometry() ;
    l9.vertices.push(new THREE.Vector3(-edgeLength/1.5, -edgeLength, +edgeLength)) ;
    l9.vertices.push(new THREE.Vector3(+edgeLength/1.5, -edgeLength, +edgeLength)) ;
    var l9Mesh = new THREE.Line(l9, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l9Mesh) ;

    var l10 = new THREE.Geometry() ;
    l10.vertices.push(new THREE.Vector3(-edgeLength/1.5, -edgeLength, -edgeLength)) ;
    l10.vertices.push(new THREE.Vector3(+edgeLength/1.5, -edgeLength, -edgeLength)) ;
    var l10Mesh = new THREE.Line(l10, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l10Mesh) ;

    var l11 = new THREE.Geometry() ;
    l11.vertices.push(new THREE.Vector3(-edgeLength/1.5, +edgeLength, +edgeLength)) ;
    l11.vertices.push(new THREE.Vector3(-edgeLength-edgeLength/3, +edgeLength, 0)) ;
    var l11Mesh = new THREE.Line(l11, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l11Mesh) ;

    var l12 = new THREE.Geometry() ;
    l12.vertices.push(new THREE.Vector3(-edgeLength/1.5, -edgeLength, +edgeLength)) ;
    l12.vertices.push(new THREE.Vector3(-edgeLength-edgeLength/3, -edgeLength, 0)) ;
    var l12Mesh = new THREE.Line(l12, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l12Mesh) ;

    var l13 = new THREE.Geometry() ;
    l13.vertices.push(new THREE.Vector3(-edgeLength/1.5, +edgeLength, -edgeLength)) ;
    l13.vertices.push(new THREE.Vector3(-edgeLength-edgeLength/3, +edgeLength, 0)) ;
    var l13Mesh = new THREE.Line(l13, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l13Mesh) ;

    var l14 = new THREE.Geometry() ;
    l14.vertices.push(new THREE.Vector3(-edgeLength/1.5, -edgeLength, -edgeLength)) ;
    l14.vertices.push(new THREE.Vector3(-edgeLength-edgeLength/3, -edgeLength, 0)) ;
    var l14Mesh = new THREE.Line(l14, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l14Mesh) ;

    var l15 = new THREE.Geometry() ;
    l15.vertices.push(new THREE.Vector3(+edgeLength/1.5, +edgeLength, -edgeLength)) ;
    l15.vertices.push(new THREE.Vector3(+edgeLength+edgeLength/3, +edgeLength, 0)) ;
    var l15Mesh = new THREE.Line(l15, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l15Mesh) ;

    var l16 = new THREE.Geometry() ;
    l16.vertices.push(new THREE.Vector3(+edgeLength/1.5, -edgeLength, -edgeLength)) ;
    l16.vertices.push(new THREE.Vector3(+edgeLength+edgeLength/3, -edgeLength, 0)) ;
    var l16Mesh = new THREE.Line(l16, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l16Mesh) ;

    var l17 = new THREE.Geometry() ;
    l17.vertices.push(new THREE.Vector3(+edgeLength/1.5, +edgeLength, +edgeLength)) ;
    l17.vertices.push(new THREE.Vector3(+edgeLength+edgeLength/3, +edgeLength, 0)) ;
    var l17Mesh = new THREE.Line(l17, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l17Mesh) ;
 
    var l18 = new THREE.Geometry() ;
    l18.vertices.push(new THREE.Vector3(+edgeLength/1.5, -edgeLength, +edgeLength)) ;
    l18.vertices.push(new THREE.Vector3(+edgeLength+edgeLength/3, -edgeLength, 0)) ;
    var l18Mesh = new THREE.Line(l18, new THREE.LineBasicMaterial({color:0xffffff, linewidth : 3})) ;
    shape.add(l18Mesh) ;
    
    this.shape = shape ;
}
