import { LightningElement } from 'lwc';
import createNewUser from '@salesforce/apex/LoginControllerLwc.createNewUser';
import loginAccess from '@salesforce/apex/LoginControllerLwc.validateLogin';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation'

export default class MyLoginPage extends NavigationMixin(LightningElement )
{
    //Some functions used to condition based rendering
    fullForm = false;
    signupControl(event)
    {
        this.fullForm = true;
    }
    existingControl(event)
    {
        this.fullForm = false;
    }

    // Capture data for User name Password,Email,Phone
    UserName;
    Uname(event)
    {
       this.UserName = event.target.value;
    }
    Pwd;
    passCode(event)
    {
       this.Pwd = event.target.value;
    }
    PhoenNo;
    pno(event)
    {
       this.PhoenNo = event.target.value;
    }
    eMail;
    mail(event)
    {
       this.eMail = event.target.value;
    }


    //Using these variables in Toast Messages
    title = 'Sucess';
    message = 'HoolyMolly! New User Created Sucessfully';
    variant = 'success';

    //To create a new user 
    newUserCreate()
    {
        // alert(`User Name : ${this.UserName}  \n Password Entered : ${this.Pwd} \n Phone no is: ${this.PhoenNo} \n Email is : ${this.eMail}`);
        createNewUser({
            uName:this.UserName , passWd:this.Pwd, phNo:this.PhoenNo, mailId:this.eMail
        })
        .then(result =>{
            const evt = new ShowToastEvent({
                title: this._title,
                message: this.message,
                variant: this.variant,
            });
            this.dispatchEvent(evt);
        })
        .error(error =>{});
    }
    //below code handle if user click on login
    loginHandler(event)
    {
        //alert(`User Name : ${this.UserName} and Password Entered : ${this.Pwd}`);
        loginAccess({Uname:this.UserName, passWd:this.Pwd})
        .then(result => {
        if(result && result.length>0)
        {
            console.log(result[0])
            console.log(typeof(result))
            const evt = new ShowToastEvent({
                title: 'Login Sucess',
                message: 'Hohoo 💯☑️! Your are Authorized User 😎 . We are moving to Search Books Application',
                variant: 'success',
            });
            this.dispatchEvent(evt);
            this[NavigationMixin.Navigate]({ 
                type:'standard__navItemPage',
                attributes:{ 
                    apiName:'Search_Books'
                }
            })
        }
        else
        {
            const evt = new ShowToastEvent({
                title: 'We 😏 Hit a Snag! User Not Found',
                message: 'Omg! 🙏🙏Create New User instead of Login',
                variant: 'warning',
            });
            this.dispatchEvent(evt);
        }
        }).catch(error => {});
    }
}