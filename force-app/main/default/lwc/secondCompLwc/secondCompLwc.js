import { api, LightningElement, track } from 'lwc';

export default class SecondCompLwc extends LightningElement 
{
    constructor()
    {
        super()
        alert('Child Costructor Called 1 ')
    }
    connectedCallback()
    {
        alert('Child call back 2')
    }
    renderedCallback()
    {
        alert('Child render call back 3')
    }
}