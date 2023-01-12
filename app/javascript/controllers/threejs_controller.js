/* ----------------------- import stimulus and threejs ---------------------- */

import { Controller } from "@hotwired/stimulus";
import * as THREE from "three";

/* ------------------ connect to data-controller="threejs" ----------------- */
export default class extends Controller {
  connect() {
    console.log("hello stimulus", this.element);

    /* -------------------------------- constants ------------------------------- */
    const red = 0xdc143c;
    const blue = 0x4169e1;
    const white = 0xfdf5e6;
    const black = 0x000000;
    const color2 = new THREE.TextureLoader().load("/assets/grass.png");

    const backgroundText = new THREE.TextureLoader().load();

    /* ------------------------------ scene set up ------------------------------ */
    this.scene = new THREE.Scene();
    this.scene.background = color2;
    this.camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth / window.innerHeight,
      0.1,
      1000
    );

    this.camera.position.set(0, 0, 5);

    this.renderer = new THREE.WebGLRenderer();
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(this.renderer.domElement);

    /* ------------------------------- create cube ------------------------------ */
    this.geometry = new THREE.BoxGeometry();
    this.material = new THREE.MeshBasicMaterial({
      color: red,
      wireframe: false,
    });

    this.cube = this.createCube(0, 0, 0);
    this.offsetcube = this.createCube(1, 1, -2);

    /* -------------------------------- add cube -------------------------------- */

    this.scene.add(this.cube);
    this.scene.add(this.offsetcube);

    this.animate();
  }

  /* -------------------------------- functions ------------------------------- */

  animate() {
    requestAnimationFrame(this.animate.bind(this));
    /* --------------------------------- cube 1 --------------------------------- */
    this.cube.rotation.x += 0.01;
    this.cube.rotation.y += 0.01;

    /* --------------------------------- cube 2 --------------------------------- */
    this.offsetcube.rotation.x -= 0.01;
    this.offsetcube.rotation.y -= 0.01;

    /* --------------------------------- render --------------------------------- */
    this.renderer.render(this.scene, this.camera);
  }

  createCube(x, y, z) {
    const cube = new THREE.Mesh(this.geometry, this.material);
    cube.position.set(x, y, z);
    this.scene.add(cube);
    return cube;
  }
}
