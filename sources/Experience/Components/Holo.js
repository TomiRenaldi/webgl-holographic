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

        this.setTexture()
        this.setPlane()
    }

    setTexture()
    {
        this.texture = {}
        this.texture.width = 32
        this.texture.height = 128
        this.texture.canvas = document.createElement('canvas')
        this.texture.canvas.width = this.texture.width
        this.texture.canvas.height = this.texture.height

        this.texture.context = this.texture.canvas.getContext('2d')
        this.texture.context.fillStyle = 'red'
        this.texture.context.fillRect(0, 0, this.texture.width, this.texture.height)
    }

    setPlane()
    {
        this.plane = {}

        this.plane.geometry = new THREE.PlaneGeometry(2, 2, 1, 1)

        this.plane.material = new THREE.ShaderMaterial({
            uniforms: {
                uTime: { value: 0 }
            },
            vertexShader: vertexShader,
            fragmentShader: fragmentShader
        })

        this.plane.mesh = new THREE.Mesh(this.plane.geometry, this.plane.material)
        this.scene.add(this.plane.mesh)
    }
}