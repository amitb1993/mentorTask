import { LightningElement,api } from 'lwc';
import CSlistView from '@salesforce/apex/caseWebPageClass.CSlistView'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class CaseWebPage extends LightningElement {
    @api accFNames;
    @api accLNames;
    @api accEmails;
    @api accPhones;
    @api accdecrips;
    myQuestion;

 allNotSelected(){
        return!(inp1.length===this.myQuestion.length)

    }

  
    handleSubmit(){
        this.template.querySelectorAll('lightning-input').forEach(element => {
            element.reportValidity();});
        var inp1 = this.template.querySelectorAll("lightning-input");
        console.log('fh3uhgu34h'+inp1);
          inp1.forEach(function (element) {
              if (element.name == "Fname")
                  this.accFName = element.value;
              if (element.name == "Lname")
                  this.accLName = element.value;
              else if (element.name == "email")
                  this.accEmail = element.value;
              else if (element.name == "Pnum")
                  this.accPhone = element.value;
              else if (element.name == "decription")
                  this.accdecrip = element.value;
          }, this);
          console.log('dfdfsff'+ this.accFName);
          console.log('dfdfsff'+ this.accLName) ;
          console.log('dfdfsff'+ this.accEmail);
          console.log('dfdfsff'+ this.accPhone);
          console.log('dfdfsff'+ this.accdecrip);
         
         CSlistView({accFNames: this.accFName, accLNames: this.accLName, accEmails: this.accEmail, accPhones: this.accPhone,accdecrips: this.accdecrip })
          .then(result => {
              if (result) {
                this.myQuestion = result;
                  const evt =new ShowToastEvent({
                      title: "Success",
                      message: 'Record Updated Successfully',
                      variant: "success",
                  });
             this.dispatchEvent(evt);
              }
              else {
                  alert('Data not updated');
              }
          })
          .catch(error => {
              console.log(error);
          })
      }

//       connectedCallback()
//       {
//         this. handleSubmit();
//       }
}
