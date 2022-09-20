import { api, LightningElement, wire } from 'lwc';
import AllAccountRec from '@salesforce/apex/AccRecLwcController.accList';
import { NavigationMixin } from 'lightning/navigation';

const tableCols =[
    {label: 'Account id', fieldName : 'Id'},
    {label: 'Account Name', fieldName: 'Name'},
    {label: 'Contact Number', fieldName: 'Phone'},
    
];
export default class AccountPageC extends NavigationMixin(LightningElement) 
{
    @api allRecords;
    @api cols = tableCols; 
    @wire (AllAccountRec)
    AllAccountRec({data,error})
    {
        if(data)
        {
            this.allRecords = data;
        }
        else if(error)
        {
            console.log('Aha! Hit a Snap!'+error);
        }
    }

    @api captureAccrecordId;
    captureAccrecordName;
    rowHandler = event => {
        var selectedRows=event.detail.selectedRows;
        this.captureAccrecordId = selectedRows[0].Id;
        this.captureAccrecordName = selectedRows[0].Name;
    }

    buttonHandler()
    {
        this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:this.captureAccrecordId,
                objectApiName:'Account',
                actionName:'edit'
            }
        })
    }
}