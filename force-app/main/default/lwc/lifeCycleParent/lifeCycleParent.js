import { LightningElement } from 'lwc';

export default class LifeCycleParent extends LightningElement 
{
    constructor()
    {
        super()
        alert('Parent Costructor Called 1 ')
    }
    connectedCallback()
    {
        alert('Parent call back 2')
    }
    renderedCallback()
    {
        alert('Parent render call back 3')
    }
}