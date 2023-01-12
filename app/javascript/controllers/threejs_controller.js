/* ----------------------- import stimulus and threejs ---------------------- */

import { Controller } from "@hotwired/stimulus";
import * as THREE from "three";
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";
import { OrbitControls } from "three/addons/controls/OrbitControls.js";
/* ------------------ connect to data-controller="threejs" ----------------- */
export default class extends Controller {
  connect() {
    console.log("hello stimulus", this.element);

    /* -------------------------------- constants ------------------------------- */
    const red = 0xdc143c;
    const blue = 0x4169e1;
    const white = 0xfdf5e6;
    const black = 0x000000;
    const backgroundtexture = new THREE.TextureLoader().load(
      "/assets/grass.png"
    );

    const backgroundText = new THREE.TextureLoader().load();

    // this.ambientlight = new THREE.AmbientLight(0x5ba4a9, 0.1);
    this.light = new THREE.DirectionalLight(0xffffff, 0.3);
    this.light.position.set(10, 10, 10);
    this.light2 = new THREE.DirectionalLight(0xffffff, 0.5);
    this.light2.position.set(-15, 10, -10);
    this.biglight = new THREE.HemisphereLight(0xffffff, 0x0c142d, 0.4);
    const helper = new THREE.DirectionalLightHelper(this.light2, 5);

    const loader = new GLTFLoader();
    let obj = null;

    /* ------------------------------ scene set up ------------------------------ */
    this.scene = new THREE.Scene();

    this.scene.background = backgroundtexture;

    this.camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth / window.innerHeight,
      0.1,
      1000
    );

    this.camera.position.set(25, 18, 20);
    this.camera.rotateX = -23;
    this.scene.add(this.camera);

    this.renderer = new THREE.WebGLRenderer();
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(this.renderer.domElement);

    const controls = new OrbitControls(this.camera, this.renderer.domElement);

    /* -------------------------------- add light ------------------------------- */
    this.scene.add(this.light);
    this.scene.add(this.light2);
    // this.scene.add(this.ambientlight);
    this.scene.add(this.biglight);
    // this.scene.add(helper);
    this.renderer.shadowMap.enabled = true;
    this.renderer.shadowMap.type = THREE.PCFSoftShadowMap;
    // this.renderer.physicallyCorrectLights = true;

    /* ------------------------------- create cube ------------------------------ */
    this.geometry = new THREE.BoxGeometry();
    this.material = new THREE.MeshStandardMaterial({
      color: red,
      wireframe: false,
    });

    // this.cube = this.createCube(0, 0, 0);
    this.offsetcube = this.createCube(1, 1, -2);

    /* -------------------------------- add cube -------------------------------- */

    // this.scene.add(this.cube);
    this.scene.add(this.offsetcube);

    this.animate();
    /* --------------------------------- add obj -------------------------------- */
    const scene = this.scene;

    loader.load(
      // resource URL
      "/assets/house.glb",
      // called when the resource is loaded
      function (gltf) {
        scene.add(gltf.scene);

        gltf.animations; // Array<THREE.AnimationClip>
        gltf.scene; // THREE.Group
        gltf.scenes; // Array<THREE.Group>
        gltf.cameras; // Array<THREE.Camera>
        gltf.asset; // Object
      },
      // called while loading is progressing
      function (xhr) {
        console.log((xhr.loaded / xhr.total) * 100 + "% loaded");
      },
      // called when loading has errors
      function (error) {
        console.log("An error happened");
      }
    );
  }

  /* -------------------------------- functions ------------------------------- */

  animate() {
    requestAnimationFrame(this.animate.bind(this));
    /* --------------------------------- cube 1 --------------------------------- */
    // this.cube.rotation.x += 0.01;
    // this.cube.rotation.y += 0.01;

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
