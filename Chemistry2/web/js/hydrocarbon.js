var hydrocarbonGroup = new THREE.Group() ;
function Hydrocarbon(noOfCarbon, noOfHydrogen, firstCarbon, secondCarbon, type) {
        deleteObjects() ;
	freq = [] ;
	for(var i = 0; i <= noOfCarbon; i += 1) freq.push(4) ;
	for(var i = 0; i < noOfCarbon; i += 1) {
		var geometry = new THREE.SphereGeometry( 0.2, 32, 32 );
		var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'red', specular: 0x555555, shininess: 30 } );
		var sphere = new THREE.Mesh( geometry, material );
		sphere.position.set(-noOfCarbon/2+i, 0, 0) ;
		hydrocarbonGroup.add( sphere );	
		if(i != noOfCarbon-1) {	
			freq[i] -= 1 ;
			freq[i+1] -= 1 ;
		}
		var line = makeLineH(new THREE.Vector3( -noOfCarbon/2+i, 0, 0 ), new THREE.Vector3( -noOfCarbon/2+i+1, 0, 0 )) ;
		if(i != noOfCarbon-1)
			hydrocarbonGroup.add( line );
	}
	if(type == 2) {
		var X = new THREE.Vector3( -noOfCarbon/2+(firstCarbon-1), 0.1, 0 ) ;
		var Y = new THREE.Vector3( -noOfCarbon/2+(secondCarbon-1), 0.1, 0 ) ;
		var line = makeLineH(X, Y);
		hydrocarbonGroup.add( line );	
		freq[firstCarbon-1] -= 1 ;
		freq[secondCarbon-1] -= 1 ;
	} else if(type == 3) {
		var X = new THREE.Vector3( -noOfCarbon/2+(firstCarbon-1), 0.1, 0 ) ;
		var Y = new THREE.Vector3( -noOfCarbon/2+(secondCarbon-1), 0.1, 0 ) ;
		var line = makeLineH(X, Y);
		hydrocarbonGroup.add( line );	
		freq[firstCarbon-1] -= 1 ;
		freq[secondCarbon-1] -= 1 ;
		var X = new THREE.Vector3( -noOfCarbon/2+(firstCarbon-1), -0.1, 0 ) ;
		var Y = new THREE.Vector3( -noOfCarbon/2+(secondCarbon-1), -0.1, 0 ) ;
		var line = makeLineH(X, Y);
		hydrocarbonGroup.add( line );	
		freq[firstCarbon-1] -= 1 ;
		freq[secondCarbon-1] -= 1 ;		
	}
	for(var i = 0; i < noOfCarbon; i++) {
		if(freq[i] == 1) {
			var x = -noOfCarbon/2+i, y = 0, z = 0;
			var X = new THREE.Vector3(x, y, z) ;
			var Y = new THREE.Vector3(x, y+1, z) ;
			var line = makeLineH(X, Y) ;
			hydrocarbonGroup.add(line) ;
			addSphereH(Y) ;
		} else if(freq[i] == 2) {
			var x = -noOfCarbon/2+i, y = 0, z = 0;
			var X = new THREE.Vector3(x, y, z) ;
			var Y = new THREE.Vector3(x, y+1, z) ;
			var line = makeLineH(X, Y) ;
			hydrocarbonGroup.add(line) ;
			addSphereH(Y) ;
			X = new THREE.Vector3(x, y, z) ;
			Y = new THREE.Vector3(x, y-1, z) ;
			var line = makeLineH(X, Y) ;
			hydrocarbonGroup.add(line) ;
			addSphereH(Y) ;
		} else if(freq[i] == 3) {
			if(i == 0) {
				var x = -noOfCarbon/2+i, y = 0, z = 0;
				var X = new THREE.Vector3(x, y, z) ;
				var Y = new THREE.Vector3(x, y+1, z) ;
				var line = makeLineH(X, Y) ;
				hydrocarbonGroup.add(line) ;
				addSphereH(Y) ;
				X = new THREE.Vector3(x, y, z) ;
				Y = new THREE.Vector3(x, y-1, z) ;
				var line = makeLineH(X, Y) ;
				hydrocarbonGroup.add(line) ;
				addSphereH(Y) ;
				X = new THREE.Vector3(x, y, z) ;
				Y = new THREE.Vector3(x-1, y, z) ;	
				var line = makeLineH(X, Y) ;
				hydrocarbonGroup.add(line) ;	
				addSphereH(Y) ;		
			} else {
				var x = -noOfCarbon/2+i, y = 0, z = 0;
				var X = new THREE.Vector3(x, y, z) ;
				var Y = new THREE.Vector3(x, y+1, z) ;
				var line = makeLineH(X, Y) ;
				hydrocarbonGroup.add(line) ;
				addSphereH(Y) ;
				X = new THREE.Vector3(x, y, z) ;
				Y = new THREE.Vector3(x, y-1, z) ;
				var line = makeLineH(X, Y) ;
				hydrocarbonGroup.add(line) ;
				addSphereH(Y) ;
				X = new THREE.Vector3(x, y, z) ;
				Y = new THREE.Vector3(x+1, y, z) ;	
				var line = makeLineH(X, Y) ;
				hydrocarbonGroup.add(line) ;	
				addSphereH(Y) ;			
			}
		}
	}
	scene.add(hydrocarbonGroup) ;
}
function makeLineH(pointX, pointY) {
	var material = new THREE.LineBasicMaterial({color: 0xffffff});

	var geometry = new THREE.Geometry();
	geometry.vertices.push(
		new THREE.Vector3( pointX.x, pointX.y, pointX.z ),
		new THREE.Vector3( pointY.x, pointY.y, pointY.z )
	);

	var line = new THREE.Line( geometry, material );
	return line ;			
}
function addSphereH(pointX) {
	var geometry = new THREE.SphereGeometry( 0.15, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'green', specular: 0x555555, shininess: 30 } );
	var sphere = new THREE.Mesh( geometry, material );
	sphere.position.set(pointX.x, pointX.y, pointX.z) ;
	hydrocarbonGroup.add( sphere );					
}