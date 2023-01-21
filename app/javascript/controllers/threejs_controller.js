// /* ----------------------- import stimulus and threejs ---------------------- */

// import { Controller } from "@hotwired/stimulus";
// import * as THREE from "three";
// import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";
// import { OrbitControls } from "three/addons/controls/OrbitControls.js";


// export default class Experience {
//     static instance;
//     constructor(canvas) {
//         if (Experience.instance) {
//             return Experience.instance;
//         }
//         Experience.instance = this;
//         this.canvas = canvas;
//         this.scene = new THREE.Scene();
//         this.time = new Time();
//         this.sizes = new Sizes();
//         this.camera = new Camera();
//         this.renderer = new Renderer();
//         this.resources = new Resources(assets);
//         this.theme = new Theme();
//         this.world = new World();
//         this.preloader = new Preloader();

//         this.preloader.on("enablecontrols", () => {
//             this.controls = new Controls();
//         });

//         this.sizes.on("resize", () => {
//             this.resize();
//         });
//         this.time.on("update", () => {
//             this.update();
//         });
//     }

//     resize() {
//         this.camera.resize();
//         this.world.resize();
//         this.renderer.resize();
//     }

//     update() {
//         this.preloader.update();
//         this.camera.update();
//         this.world.update();
//         this.renderer.update();
//         if (this.controls) {
//             this.controls.update();
//         }
//     }
// }



// export default class Sizes extends EventEmitter {
//     constructor() {
//         super();
//         this.width = window.innerWidth;
//         this.height = window.innerHeight;
//         this.aspect = this.width / this.height;
//         this.pixelRatio = Math.min(window.devicePixelRatio, 2);
//         this.frustrum = 5;
//         if (this.width < 968) {
//             this.device = "mobile";
//         } else {
//             this.device = "desktop";
//         }

//         window.addEventListener("resize", () => {
//             this.width = window.innerWidth;
//             this.height = window.innerHeight;
//             this.aspect = this.width / this.height;
//             this.pixelRatio = Math.min(window.devicePixelRatio, 2);
//             this.emit("resize");

//             if (this.width < 968 && this.device !== "mobile") {
//                 this.device = "mobile";
//                 this.emit("switchdevice", this.device);
//             } else if (this.width >= 968 && this.device !== "desktop") {
//                 this.device = "desktop";
//                 this.emit("switchdevice", this.device);
//             }
//         });
//     }
// }


// import * as THREE from "three";

// export default class Camera {
//     constructor() {
//         this.experience = new Experience();
//         this.sizes = this.experience.sizes;
//         this.scene = this.experience.scene;
//         this.canvas = this.experience.canvas;

//         this.createPerspectiveCamera();
//         this.createOrthographicCamera();
//         this.setOrbitControls();
//     }

//     createPerspectiveCamera() {
//         this.perspectiveCamera = new THREE.PerspectiveCamera(
//             35,
//             this.sizes.aspect,
//             0.1,
//             1000
//         );
//         this.scene.add(this.perspectiveCamera);
//         this.perspectiveCamera.position.x = 29;
//         this.perspectiveCamera.position.y = 14;
//         this.perspectiveCamera.position.z = 12;
//     }

//     createOrthographicCamera() {
//         this.orthographicCamera = new THREE.OrthographicCamera(
//             (-this.sizes.aspect * this.sizes.frustrum) / 2,
//             (this.sizes.aspect * this.sizes.frustrum) / 2,
//             this.sizes.frustrum / 2,
//             -this.sizes.frustrum / 2,
//             -50,
//             50
//         );

//         // 6.5
//         this.orthographicCamera.position.y = 5.65;
//         this.orthographicCamera.position.z = 10;
//         this.orthographicCamera.rotation.x = -Math.PI / 6;

//         this.scene.add(this.orthographicCamera);

//         // this.helper = new THREE.CameraHelper(this.orthographicCamera);
//         // this.scene.add(this.helper);

//         const size = 20;
//         const divisions = 20;

//         // const gridHelper = new THREE.GridHelper(size, divisions);
//         // this.scene.add(gridHelper);

//         // const axesHelper = new THREE.AxesHelper(10);
//         // this.scene.add(axesHelper);
//     }

//     setOrbitControls() {
//         this.controls = new OrbitControls(this.perspectiveCamera, this.canvas);
//         this.controls.enableDamping = true;
//         this.controls.enableZoom = false;
//     }

//     resize() {
//         // Updating Perspective Camera on Resize
//         this.perspectiveCamera.aspect = this.sizes.aspect;
//         this.perspectiveCamera.updateProjectionMatrix();

//         // Updating Orthographic Camera on Resize
//         this.orthographicCamera.left =
//             (-this.sizes.aspect * this.sizes.frustrum) / 2;
//         this.orthographicCamera.right =
//             (this.sizes.aspect * this.sizes.frustrum) / 2;
//         this.orthographicCamera.top = this.sizes.frustrum / 2;
//         this.orthographicCamera.bottom = -this.sizes.frustrum / 2;
//         this.orthographicCamera.updateProjectionMatrix();
//     }

//     update() {
//         // console.log(this.perspectiveCamera.position);
//         this.controls.update();

//         // this.helper.matrixWorldNeedsUpdate = true;
//         // this.helper.update();
//         // this.helper.position.copy(this.orthographicCamera.position);
//         // this.helper.rotation.copy(this.orthographicCamera.rotation);
//     }
// }







// /* ------------------ connect to data-controller="threejs" ----------------- */
// export default class extends Controller {
//   connect() {
//     console.log("hello stimulus", this.element);



//     /* -------------------------------- constants ------------------------------- */
//     const red = 0xdc143c;
//     const blue = 0x4169e1;
//     const white = 0xfdf5e6;
//     const black = 0x000000;
//     const backgroundtexture = new THREE.TextureLoader().load(
//       "/assets/grass.jpg"
//     );

//     const backgroundText = new THREE.TextureLoader().load();

//     /* --------------------------------- lights --------------------------------- */
//     this.ambientlight = new THREE.AmbientLight(0xe3dac9, 3);

//     this.light_main = new THREE.PointLight(0xffffff, 4000);
//     this.light_main.position.set(30, 30, 20);

//     this.light_main2 = new THREE.PointLight(0xffffff, 4000);
//     this.light_main2.position.set(-30, 30, -20);

//     this.biglight = new THREE.PointLight(0xffffff, 3000);
//     this.biglight.position.set(-10, 50, 15);
//     this.biglight.castShadow = true;
//     // this.biglight.power = 10000;

//     this.biglight.shadow.mapSize.width = 2048;
//     this.biglight.shadow.mapSize.height = 2048;
//     this.biglight.shadow.camera.near = 0.5;
//     this.biglight.shadow.camera.far = 500;

//     this.light = new THREE.DirectionalLight(0x5ca2b4, 1);
//     this.light.position.set(15, 9, -20);

//     this.light2 = new THREE.DirectionalLight(0x464196, 1);
//     this.light2.position.set(-15, 9, 20);

//     const helper = new THREE.DirectionalLightHelper(this.light2, 5);
//     /* -------------------------------- load gltf ------------------------------- */
//     const loader = new GLTFLoader();
//     let obj = null;

//     /* ------------------------------ scene set up ------------------------------ */
//     this.scene = new THREE.Scene();

//     this.scene.background = backgroundtexture;

//     this.camera = new THREE.PerspectiveCamera(
//       75,
//       window.innerWidth / window.innerHeight,
//       0.1,
//       1000
//     );

//     this.camera.position.set(25, 18, 20);
//     this.camera.rotateX = -23;
//     this.scene.add(this.camera);

//     this.renderer = new THREE.WebGLRenderer({ antialias: true });
//     this.renderer.setSize(window.innerWidth, window.innerHeight);
//     document.body.appendChild(this.renderer.domElement);

//     const controls = new OrbitControls(this.camera, this.renderer.domElement);

//     /* -------------------------------- add light to scene ------------------------------- */
//     this.renderer.physicallyCorrectLights = true;
//     // this.scene.add(this.light);
//     // this.scene.add(this.light2);

//     this.scene.add(this.light_main);
//     this.scene.add(this.light_main2);

//     this.scene.add(this.biglight);

//     this.scene.add(this.ambientlight);

//     /* ------------------------------- add shadows ------------------------------ */

//     // this.scene.add(helper);
//     // this.texture.encoding = THREE.sRGBEncoding;
//     this.renderer.shadowMap.enabled = true;
//     this.renderer.shadowMap.type = THREE.PCFSoftShadowMap;
//     this.renderer.outputEncoding = THREE.sRGBEncoding;

//     /* ------------------------------- create cube ------------------------------ */
//     this.geometry = new THREE.BoxGeometry();
//     this.material = new THREE.MeshStandardMaterial({
//       color: red,
//       wireframe: false,
//     });

//     // this.cube = this.createCube(0, 0, 0);
//     this.offsetcube = this.createCube(1, 1, -2);

//     /* -------------------------------- add cube -------------------------------- */

//     // this.scene.add(this.cube);
//     this.scene.add(this.offsetcube);

//     this.animate();
//     /* --------------------------------- add obj -------------------------------- */
//     const scene = this.scene;

//     loader.load(
//       // resource URL
//       "/assets/untitled.gltf",
//       // called when the resource is loaded
//       function (gltf) {
//         scene.add(gltf.scene);

//         gltf.animations; // Array<THREE.AnimationClip>
//         gltf.scene; // THREE.Group
//         gltf.scenes; // Array<THREE.Group>
//         gltf.cameras; // Array<THREE.Camera>
//         gltf.asset; // Object
//         gltf.scene.traverse(function (object) {
//           if (object.isMesh) {
//             object.castShadow = true;
//             object.receiveShadow = true;
//           }
//         });
//       },
//       // called while loading is progressing
//       function (xhr) {
//         console.log((xhr.loaded / xhr.total) * 100 + "% loaded");
//       },
//       // called when loading has errors
//       function (error) {
//         console.log("An error happened");
//       }
//     );
//   }

//   /* -------------------------------- functions ------------------------------- */

//   animate() {
//     requestAnimationFrame(this.animate.bind(this));
//     /* --------------------------------- cube 1 --------------------------------- */
//     // this.cube.rotation.x += 0.01;
//     // this.cube.rotation.y += 0.01;

//     /* --------------------------------- cube 2 --------------------------------- */
//     this.offsetcube.rotation.x -= 0.01;
//     this.offsetcube.rotation.y -= 0.01;

//     /* --------------------------------- render --------------------------------- */
//     this.renderer.render(this.scene, this.camera);
//   }

//   createCube(x, y, z) {
//     const cube = new THREE.Mesh(this.geometry, this.material);
//     cube.position.set(x, y, z);
//     this.scene.add(cube);
//     return cube;
//   }
// }
