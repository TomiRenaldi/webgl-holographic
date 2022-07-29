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

        this.setGeometry()
        this.setMaterial()
        this.setMesh()
    }

    setGeometry()
    {
        this.geometry = new THREE.PlaneGeometry(2, 2, 1, 1)
    }
    setMaterial()
    {
        this.material = new THREE.ShaderMaterial({
            vertexShader: vertexShader,
            fragmentShader: fragmentShader
        })
    }
    setMesh()
    {
        this.mesh = new THREE.Mesh(this.geometry, this.material)
        this.scene.add(this.mesh)
    }
}