function Lobe() {
	var group = new THREE.Group() ;
	
	
	var geometry = new THREE.CylinderBufferGeometry( 0.01, 0.3, 1.5, 32 );
	var material = new THREE.MeshLambertMaterial({color: 0xffff00, transparent: true, opacity: 0.5});
	var cylinder = new THREE.Mesh( geometry, material );
	group.add(cylinder) ;

	var geometry = new THREE.SphereGeometry( 0.3,30,30, Math.PI/2, Math.PI*2, 0, Math.PI);

	var material = new THREE.MeshLambertMaterial({color: 0xffff00, transparent: true, opacity: 0.5});
	material.side = THREE.BackSide;

	var sphere = new THREE.Mesh( geometry, material );
	sphere.position.y -= 0.8 ;
	group.add(sphere) ;
	return group ;
}

var sp3_flag = 1 ,ff , f ;
function SP3Hybridization() {
	var g1= new THREE.Group() ;
	for(var i = 0; i < 2; i++) {
		var f = SP3() ;
		g1.add(f) ;
	}
	g1.position.x -= 3 ;
	g1.name = ++objectCount ;
	scene.add(g1) ;
	
	var g2 = new THREE.Group() ;
	for(var i = 0; i < 2; i++) {
		var ff = SP3() ;
		ff.rotation.y += Math.PI ;
		g2.add(ff) ;
	}
	g2.position.x += 3 ;
	g2.name = ++objectCount ;
	scene.add(g2) ;

	var renderScene = function () {
		requestAnimationFrame( renderScene );
		if(g1.position.x <= -1.2) {
			g1.position.x += 0.01 ;
			g2.position.x -= 0.01 ;
		}
		
	};

	renderScene();
}

var sp2_flag = 1 ;
function SP2Hybridization() {
	var f = SP2() ;
	f.position.x -= 3 ;
	f.name = ++objectCount ;
	scene.add(f) ;
	
	var ff = SP2() ;
	ff.name = ++objectCount ;
	
	ff.rotation.y += Math.PI ;
	ff.position.x += 3 ;
	scene.add(ff) ;

	var render = function () {
		requestAnimationFrame( render );
		if(f.position.x <= -1.2) {
			f.position.x += 0.01 ;
			ff.position.x -= 0.01 ;
		} else if(sp2_flag) {
				var geometry = new THREE.CylinderBufferGeometry( 0.1, 0.1, 2, 32 );
				var material = new THREE.MeshLambertMaterial({color: 'springgreen', transparent: true, opacity: 0.5});
				var cylinder = new THREE.Mesh( geometry, material );
				cylinder.rotation.z += Math.PI/2 ;
				cylinder.position.y += 1.2 ;
				cylinder.name = ++objectCount ;
				scene.add(cylinder) ;
				var geometry = new THREE.CylinderBufferGeometry( 0.1, 0.1, 2, 32 );
				var material = new THREE.MeshLambertMaterial({color: 'springgreen', transparent: true, opacity: 0.5});
				var cylinder = new THREE.Mesh( geometry, material );
				cylinder.rotation.z += Math.PI/2 ;
				cylinder.position.y -= 1.2 ;
				cylinder.name = ++objectCount ;
				scene.add(cylinder) ;			
			flag = 0 ;
		}
		
	};

	render();
}

var sp_flag = 0, f, ff;
function SPHybridization() {
	f = new THREE.Group() ;
	for(var i = 0; i < 2; i++) {
		f.add(SP()) ;
	}
	f.name = ++objectCount ;
	f.position.x -= 3 ;
	scene.add(f) ;

	ff = new THREE.Group() ;
	ff.rotation.z += Math.PI ;
	for(var i = 0; i < 2; i++) {
		ff.add(SP()) ;
	}
	ff.position.x += 3 ;
	ff.name = ++objectCount ;
	scene.add(ff) ;
	animateSP() ;
}

function animateSP() {
    console.log("in animate")
	if(f.position.x <= -1.2) {
		f.position.x += 0.01 ;
		ff.position.x -= 0.01 ;
		sp_flag = 1 ;
	} else if(sp_flag) {
			var geometry = new THREE.CylinderBufferGeometry( 0.1, 0.1, 2, 32 );
			var material = new THREE.MeshLambertMaterial({color: 'springgreen', transparent: true, opacity: 0.5});
			var cylinder = new THREE.Mesh( geometry, material );
			cylinder.rotation.z += Math.PI/2 ;
			cylinder.position.y += 1.2 ;
			cylinder.name = ++objectCount ;
			scene.add(cylinder) ;
			var geometry = new THREE.CylinderBufferGeometry( 0.1, 0.1, 2, 32 );
			var material = new THREE.MeshLambertMaterial({color: 'springgreen', transparent: true, opacity: 0.5});
			var cylinder = new THREE.Mesh( geometry, material );
			cylinder.rotation.z += Math.PI/2 ;
			cylinder.position.y -= 1.2 ;
			
			cylinder.name = ++objectCount ;
			scene.add(cylinder) ;
			var geometry = new THREE.CylinderBufferGeometry( 0.1, 0.1, 2, 32 );
			var material = new THREE.MeshLambertMaterial({color: 'springgreen', transparent: true, opacity: 0.5});
			var cylinder = new THREE.Mesh( geometry, material );
			cylinder.rotation.z += Math.PI/2 ;
			cylinder.position.z -= 1.2 ;
			cylinder.name = ++objectCount ;
			scene.add(cylinder) ;
			var geometry = new THREE.CylinderBufferGeometry( 0.1, 0.1, 2, 32 );
			var material = new THREE.MeshLambertMaterial({color: 'springgreen', transparent: true, opacity: 0.5});
			var cylinder = new THREE.Mesh( geometry, material );
			cylinder.rotation.z += Math.PI/2 ;
			cylinder.position.z += 1.2 ;
			cylinder.name = ++objectCount ;
			scene.add(cylinder) ;
			flag = 0 ;
	}
	requestAnimationFrame( animateSP );
	render() ;
}

function SP3() {
	var group = new THREE.Group() ;
	var geometry = new THREE.SphereGeometry( 0.3,30,30, Math.PI/2, Math.PI*2, 0, Math.PI);

	var material = new THREE.MeshBasicMaterial({color: 'red'});
	//material.side = THREE.BackSide;

	var sphere = new THREE.Mesh( geometry, material );
	group.add(sphere) ;	
	var l1 = Lobe() ;
	
	l1.applyMatrix( new THREE.Matrix4().makeTranslation( 0, 0.2, 0 ) );
	l1.position.set(0, 0, 0) ;
	l1.position.z += 0.45 ;
	l1.position.y += 0.25 ;
	l1.rotation.x -= Math.PI/2 + Math.PI/6  ;
	var geometry = new THREE.SphereGeometry( 0.3,30,30, Math.PI/2, Math.PI*2, 0, Math.PI);
		var material = new THREE.MeshBasicMaterial({color: 0xff1493});
	var h1 = new THREE.Mesh(geometry, material) ;
	h1.position.z += 1.40 ;
	h1.position.y += 0.85 ;
	group.add(h1) ;	
	group.add(l1) ;
	var l2 = Lobe() ;
	
	l2.applyMatrix( new THREE.Matrix4().makeTranslation( 0, 0.2, 0 ) );
	l2.position.set(0, 0, 0) ;
	l2.position.y += 0.15 ;
	l2.position.x += 0.40 ;
	l2.position.z -= 0.35 ;
	l2.rotation.x += Math.PI/2 + Math.PI/6  ;
	l2.rotation.z += Math.PI/5 ;

	
	group.add(l2) ;
	var l3 = Lobe() ;
	
	l3.applyMatrix( new THREE.Matrix4().makeTranslation( 0, 0.2, 0 ) );
	l3.position.set(0, 0, 0) ;
	l3.position.x -= 0.40 ;
	l3.position.z -= 0.30 ;
	l3.position.y += 0.15 ;
	l3.rotation.x += Math.PI/2 + Math.PI/6  ;
	l3.rotation.z -= Math.PI/5 ;	
	var geometry = new THREE.SphereGeometry( 0.3,30,30, Math.PI/2, Math.PI*2, 0, Math.PI);
	var material = new THREE.MeshBasicMaterial({color: 0xff1493});
	var h2 = new THREE.Mesh(geometry, material) ;
	h2.position.x -= 1.20 ;
	h2.position.z -= 1.10 ;
	h2.position.y += 0.70 ;
	group.add(h2) ;
	group.add(l3) ;
	
	var l4 = Lobe() ;
	l4.position.y -= 0.45 ;
	group.add(l4) ;
	var geometry = new THREE.SphereGeometry( 0.3,30,30, Math.PI/2, Math.PI*2, 0, Math.PI);
	var material = new THREE.MeshBasicMaterial({color: 0xff1493});
	var h3 = new THREE.Mesh(geometry, material) ;
	h3.position.x += 1.20 ;
	h3.position.z -= 1.25 ;
	h3.position.y += 0.75 ;
	group.add(h3) ;
	group.rotation.z += Math.PI/2 ;
	group.rotation.x += Math.PI/2 ;

	return group ;
}

function SP2() {
	var group = new THREE.Group() ;
	var geometry = new THREE.SphereGeometry( 0.3,30,30, Math.PI/2, Math.PI*2, 0, Math.PI);

	var material = new THREE.MeshBasicMaterial({color: 'red'});
	//material.side = THREE.BackSide;

	var sphere = new THREE.Mesh( geometry, material );
	group.add(sphere) ;	
	var l1 = Lobe() ;
	l1.position.y -= 0.45 ;
	group.add(l1) ;
	var l2 = Lobe() ;
	l2.rotation.z += Math.PI/2+Math.PI/6 ;
	l2.position.x += 0.45 ;
	l2.position.y += 0.25 ;
	group.add(l2) ;
	var l3 = Lobe() ;
	l3.position.x -= 0.4 ;
	l3.position.y += 0.3 ;
	l3.rotation.z += 2*(Math.PI/2+Math.PI/6) ;
	group.add(l3) ;
	var l4 = Lobe() ;
	l4.position.z += 0.45 ;
	l4.rotation.x -= Math.PI/2 ;
	group.add(l4) ;
	var l5 = Lobe() ;
	l5.position.z -= 0.45 ;
	l5.rotation.x += Math.PI/2 ;
	group.add(l5) ;

	group.rotation.z += Math.PI/2 ;
	group.rotation.x += Math.PI/2 ;

	var geometry = new THREE.SphereGeometry( 0.3,30,30, Math.PI/2, Math.PI*2, 0, Math.PI);
	var material = new THREE.MeshLambertMaterial({color: 0xff1493, transparent: true, opacity: 0.5});
	var hyd = new THREE.Mesh( geometry, material );
	hyd.position.x += 1.5 ;
	hyd.position.y += 0.8 ;
	
	group.add(hyd) ;
	var geometry = new THREE.SphereGeometry( 0.3,30,30, Math.PI/2, Math.PI*2, 0, Math.PI);
	var material = new THREE.MeshLambertMaterial({color: 0xff1493, transparent: true, opacity: 0.5});
	var hyd1 = new THREE.Mesh( geometry, material );
	hyd1.position.x -= 1.5 ;
	hyd1.position.y += 0.8 ;

	//hyd.position.y += 1.1 ;
	//hyd.position.z -= 0.2 ;
	group.add(hyd1) ;

	return group ;
}

function SP() {
	var group = new THREE.Group() ;
	var geometry = new THREE.SphereGeometry( 0.3,30,30, Math.PI/2, Math.PI*2, 0, Math.PI);

	var material = new THREE.MeshBasicMaterial({color: 'red'});
	//material.side = THREE.BackSide;

	var sphere = new THREE.Mesh( geometry, material );
	group.add(sphere) ;	
	var l1 = Lobe() ;
	l1.position.y -= 0.45 ;
	group.add(l1) ;
	var l2 = Lobe() ;
	l2.rotation.z += Math.PI/2 ;
	l2.position.x += 0.45 ;
	group.add(l2) ;
	var l3 = Lobe() ;
	l3.position.y += 0.45 ;
	l3.rotation.z += Math.PI ;
	group.add(l3) ;
	var l4 = Lobe() ;
	l4.position.x -= 0.45 ;
	l4.rotation.z += Math.PI + Math.PI/2 ;
	group.add(l4) ;
	var l5 = Lobe() ;
	l5.position.z += 0.45 ;
	l5.rotation.x -= Math.PI/2 ;
	group.add(l5) ;
	var l6 = Lobe() ;
	l6.position.z -= 0.45 ;
	l6.rotation.x += Math.PI/2 ;
	group.add(l6) ;
	var geometry = new THREE.SphereGeometry( 0.3,30,30, Math.PI/2, Math.PI*2, 0, Math.PI);
	var material = new THREE.MeshLambertMaterial({color: 0xFF1493, transparent: true, opacity: 0.5}) ;
	var hy = new THREE.Mesh( geometry, material );
	hy.position.x -= 1.7 ;
	group.add(hy) ;
	return group ;
}