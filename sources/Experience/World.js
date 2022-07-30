import * as THREE from 'three'
import Holo from './Components/Holo.js'
import Experience from './Experience.js'

export default class World
{
    constructor(_options)
    {
        this.experience = new Experience()
        this.config = this.experience.config
        this.scene = this.experience.scene
        this.resources = this.experience.resources
        
        this.resources.on('groupEnd', (_group) =>
        {
            if(_group.name === 'base')
            {
                this.setHolo()
            }
        })
    }

    setHolo()
    {
        this.holo = new Holo()     
    }

    resize()
    {
    }

    update()
    {
        if (this.holo)
            this.holo.update()
    }

    destroy()
    {
    }
}