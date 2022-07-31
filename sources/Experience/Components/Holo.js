import * as THREE from 'three'
import Experience from '../Experience'

import vertexShader from '../shaders/holo/vertex.glsl'
import fragmentShader from '../shaders/holo/fragment.glsl'

export default class Holo
{
    constructor ()
    {
        this.experience = new Experience()
        this.scene = this.experience.scene
        this.time = this.experience.time

        this.setPlane()
    }

    setPlane()
    {
        this.plane = {}

        this.plane.geometry = new THREE.PlaneGeometry(2, 2, 1, 1)
        
        this.plane.uniforms = {
            uTime: { value: 0 }
        }

        this.plane.material = new THREE.ShaderMaterial({
            uniforms: this.plane.uniforms,
            vertexShader: vertexShader,
            fragmentShader: fragmentShader
        })

        this.plane.mesh = new THREE.Mesh(this.plane.geometry, this.plane.material)
        this.scene.add(this.plane.mesh)
    }

    update()
    {
        this.plane.uniforms.uTime.value = this.time.elapsed * 0.001
    }
}