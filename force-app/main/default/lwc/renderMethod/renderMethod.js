import { LightningElement } from 'lwc';
import signinTemp from './signinTemp.html';
import signoutTemp from './signoutTemp.html';
import renderMethod from './renderMethod.html';

export default class RenderMethod extends LightningElement 
{
    render()
    {
        return this.selBtn === 'SignUp' ? signoutTemp : 
               this.selBtn === 'Signin' ? signinTemp : 
               renderMethod ;
    }
    selBtn = '';
    handleClick(event)
    {
        this.selBtn = event.target.label;
    }
}