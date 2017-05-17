function Beaker(h,fillp){
    this.height=h;
    this.radius=h*3/5;
    var m=new THREE.MeshLambertMaterial({color: "white",transparent:true,opacity:0.5});
    var c1=new THREE.CylinderGeometry(this.radius,this.radius,this.height,64,1);
    c1=new THREE.Mesh(c1,m);
    var c2=new THREE.CylinderGeometry(this.radius*0.9,this.radius*0.9,this.height+this.radius,64,1);
    c2=new THREE.Mesh(c2,m);
    var t=new THREE.TorusGeometry(this.radius*0.95,this.radius*0.1,10,64);
    t=new THREE.Mesh(t,m);
    t.rotation.x+=Math.PI/2;
    t.position.set(0,this.height/2,0);
    c2.position.set(0,this.height*0.049+this.radius/2,0);
    c1.position.set(0,0,0);
    var b1=new ThreeBSP(c1);
    var b2=new ThreeBSP(c2);
    var b3=new ThreeBSP(t);
    var r=b1.union(b3);
    r=r.subtract(b2);
    r=r.toGeometry();
    r=new THREE.Mesh(r,m);
    var temp = new THREE.CylinderGeometry(this.radius*0.9,this.radius*0.9,this.height*0.9*1,64,1);
    this.fl=new THREE.Mesh(temp,new THREE.MeshBasicMaterial({color: "blue"}));
    this.fl.position.set(0,this.height*0.9*fillp*0.5-this.height*0.45,0);
    this.fl.scale.y=fillp;
    this.Mesh=r;
	this.Fill=Fill;
}
function Fill(fillp){
	this.fl.scale.y=fillp;
	this.fl.position.set(0,this.height*0.9*fillp*0.5-this.height*0.45,0);
}