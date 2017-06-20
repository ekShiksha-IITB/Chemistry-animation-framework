
var scene = new THREE.Scene();
var objectCount = 0 ;
function init() {
	
	var camera = new THREE.PerspectiveCamera( 75, window.innerWidth/window.innerHeight, 0.1, 1000 );
	var renderer = new THREE.WebGLRenderer();
	renderer.setSize( window.innerWidth, window.innerHeight );
        var canvas=document.getElementById("animationCanvas");
	canvas.appendChild( renderer.domElement );	
	var controls = new THREE.OrbitControls(camera, renderer.domElement);
	var cont = new THREE.TrackballControls(camera, renderer.domElement);        
        window.addEventListener('resize', onWindowResize, false);
        onWindowResize();
	var light = new THREE.AmbientLight( 0xffffff ); // white light
	scene.add( light );	
	var directionalLight = new THREE.DirectionalLight( 0xffffff );
	directionalLight.position.set( 0, 10, 10 ).normalize();
	scene.add(directionalLight);

	
	camera.position.z = 5;
	var render = function () {

		requestAnimationFrame( render );
		cont.update() ;
		controls.update() ;
		renderer.render(scene, camera);
	};
        function onWindowResize() {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth/2, 3*window.innerHeight/4);
        };
	render();
	//addAtom(34, 2, 8, 18, 6, 7, 0, 0, 2) ;
	
	//addLinearGeometry() ;
	
	//addOctahedralGeometry(0) ;
	
	//addTrigonalPlanarGeometry(1) ;
	
	//addTrigonalBipyramidalGeometry(1) ;
	
	//addPenatagonalBipyramidalGeometry() ;
	
	//addTetrahedralGeometry(2) ;
	
	//addCubicLattice(0) ;
	
	//addHexagonalLattice() ;
	
	//addMonoclinicLattice(0) ;
	
	//addOrthorhombicLattice(0) ;
	
	//addTetragonalLattice(1) ;
	
	//deleteObjects() ;
}
function addAtom(atomicNumber, k, l, m, n, o, p, q, model) {
        objectCount
	deleteObjects() ;
        console.log(atomicNumber,k,l);
	var ob = new Atom(atomicNumber, k, l, m, n, o, p, q, model) ;
	var shape ;
	if(model == 1) {
		shape = ob.firstModel() ;
	} else if(model == 2) {
		shape = ob.secondModel() ;
	} else {
		shape = ob.thirdModel() ;
	}
	++objectCount ;
	shape.name = objectCount ;
	scene.add(shape) ;
        function atom_rotation() {
                        shape.rotation.z += 0.01 ;
                        requestAnimationFrame(atom_rotation) ;
                     //   render() ;
                }
                atom_rotation() ;
}
function addLinearGeometry() {
	deleteObjects() ;
	var ob = new Linear(0.3, 0.6) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;
}
function addTetrahedralGeometry(noOfLonePair) {
	deleteObjects() ;
	var ob = new Tetrahedral(0.3, 0.6, noOfLonePair) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;
}
function addOctahedralGeometry(noOfLonePair) {
	deleteObjects() ;
	var ob = new Octahedral(0.3, 0.6, noOfLonePair) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;
}
function addTrigonalPlanarGeometry(noOfLonePair) {
	deleteObjects() ;
	var ob = new TrigonalPlanar(0.3, 0.6, noOfLonePair) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;
}
function addTrigonalBipyramidalGeometry(noOfLonePair) {
	deleteObjects() ;
	var ob = new TrigonalBipyramidal(0.3, 0.6, noOfLonePair) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;
}
function addPentagonalBipyramidalGeometry(noOfLonePair) {
	deleteObjects() ;
	var ob = new PentagonalBipyramidal(0.3, 0.6, noOfLonePair) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;
}
function addCubicLattice(param) {
	deleteObjects() ;
	var ob = new Cubic(1.5, 0.3, param) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;
}
function addHexagonalLattice() {
	deleteObjects() ;
	var ob = new Hexagonal(1.5, 0.3) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;	
}
function addMonoclinicLattice(param) {
	deleteObjects() ;
	var ob = new Monoclinic(1.5, 0.3, param) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;		
}
function addOrthorhombicLattice(param) {
	deleteObjects() ;
	var ob = new Orthorhombic(1.5, 0.3, param) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;	
}
function addTetragonalLattice(param) {
	deleteObjects() ;
	var ob = new Tetragonal(1.5, 0.3, param) ;
	++objectCount ;
	var shape = ob.shape ;
	shape.name = objectCount ;
	scene.add(shape) ;		
}
function showExcitation(f, s) {
	deleteObjects() ;
	Excitation(f, s) ;
}
function showCombination() {
	deleteObjects() ;
	Combination() ;
}
function showDecomposition() {
	deleteObjects() ;
	Decomposition() ;
}
function showSingleDisplacement() {
	deleteObjects() ;
	SingleDisplacement() ;
}
function showDoubleDisplacement() {
	deleteObjects() ;
	DoubleDisplacement() ;
}

function deleteObjects() {
	while(objectCount > 0) {
		scene.remove(scene.getObjectByName(objectCount)) ;
		--objectCount ;
	}
}

