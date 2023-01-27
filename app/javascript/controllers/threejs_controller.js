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
    var model;
    var that = this;
    this.onScrollRunning = true;
    const red = 0xdc143c;
    const blue = 0x4169e1;
    const white = 0xfdf5e6;
    const black = 0x000000;
    const backgroundtexture = new THREE.TextureLoader().load(
      "https://roots-house.s3.ap-southeast-2.amazonaws.com/house/grass.jpg"
    );
    const backgroundText = new THREE.TextureLoader().load();
    /* --------------------------------- lights --------------------------------- */
    this.ambientlight = new THREE.AmbientLight(0xe3dac9, 3);
    this.light_main = new THREE.PointLight(0xffffff, 4000);
    this.light_main.position.set(30, 30, 20);
    this.light_main2 = new THREE.PointLight(0xffffff, 4000);
    this.light_main2.position.set(-30, 30, -20);
    this.biglight = new THREE.PointLight(0xffffff, 3000);
    this.biglight.position.set(-10, 50, 15);
    this.biglight.castShadow = true;
    // this.biglight.power = 10000;
    this.biglight.shadow.mapSize.width = 2048; // default
    this.biglight.shadow.mapSize.height = 2048; // default
    this.biglight.shadow.camera.near = 0.5; // default
    this.biglight.shadow.camera.far = 500; // default
    this.light = new THREE.DirectionalLight(0x5ca2b4, 1);
    this.light.position.set(15, 9, -20);
    this.light2 = new THREE.DirectionalLight(0x464196, 1);
    this.light2.position.set(-15, 9, 20);
    const helper = new THREE.DirectionalLightHelper(this.light2, 5);
    /* -------------------------------- load gltf ------------------------------- */
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
    this.camera.position.set(25, 20, 15);
    // this.camera.rotateX = -23;
    this.scene.add(this.camera);

    this.renderer = new THREE.WebGLRenderer({ antialias: true });
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(this.renderer.domElement);

    /* -------------------------------- add light to scene ------------------------------- */
    this.renderer.physicallyCorrectLights = true;
    // this.scene.add(this.light);
    // this.scene.add(this.light2);
    this.scene.add(this.light_main);
    this.scene.add(this.light_main2);
    this.scene.add(this.biglight);
    this.scene.add(this.ambientlight);
    /* ------------------------------- add shadows ------------------------------ */
    // this.scene.add(helper);
    // this.texture.encoding = THREE.sRGBEncoding;
    this.renderer.shadowMap.enabled = true;
    this.renderer.shadowMap.type = THREE.PCFSoftShadowMap;
    this.renderer.outputEncoding = THREE.sRGBEncoding;
    /* ------------------------------- create cube ------------------------------ */
    this.geometry = new THREE.BoxGeometry();
    this.material = new THREE.MeshStandardMaterial({
      color: red,
      wireframe: false,
    });
    // this.cube = this.createCube(0, 0, 0);
    // this.offsetcube = this.createCube(1, 1, -2);
    /* -------------------------------- add cube -------------------------------- */
    // this.scene.add(this.cube);
    // this.scene.add(this.offsetcube)
    /* --------------------------------- add obj -------------------------------- */
    const scene = this.scene;
    var model;
    loader.load(
      // resource URL
      "https://roots-house.s3.ap-southeast-2.amazonaws.com/house/untitled.gltf",
      // called when the resource is loaded
      (gltf) => {
        this.model = gltf.scene;
        scene.add(this.model);
        gltf.animations; // Array<THREE.AnimationClip>
        gltf.scene; // THREE.Group
        gltf.scenes; // Array<THREE.Group>
        gltf.cameras; // Array<THREE.Camera>
        gltf.asset; // Object
        gltf.scene.traverse(function (object) {
          if (object.isMesh) {
            object.castShadow = true;
            object.receiveShadow = true;
          }
        });
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
    document.body.onscroll = () => {
      const t = document.body.getBoundingClientRect().top;

      if (this.model) this.model.rotation.y += 0.04;
      // this.camera.position.y = t * -0.01;
    };

    const controls = new OrbitControls(this.camera, this.renderer.domElement);
    controls.enabled = false;
    this.animate();
  }
  // onScroll(event) {
  //   if (!this.onScrollRunning) {
  //     this.onScrollRunning = true;
  //     if (window.requestAnimationFrame) {
  //       window.requestAnimationFrame(this.moveCamera.bind(this));
  //     } else {
  //       setTimeout(this.scrollTableHeader.bind(this), 66);
  //     }
  //   }
  // }
  // moveCamera() {
  //   if (window.requestAnimationFrame) {
  //     window.requestAnimationFrame(this.moveCamera.bind(this));
  //   } else {
  //     setTimeout(this.scrollTableHeader.bind(this), 66);
  //   }
  //   const t = document.body.getBoundingClientRect().top;

  //   if (this.model) this.model.rotation.y += 0.01;
  //   this.camera.position.y = t * -0.01;
  // }

  animate() {
    requestAnimationFrame(this.animate.bind(this));

    this.renderer.render(this.scene, this.camera);
  }
  /* -------------------------------- functions ------------------------------- */
}
