import { LightningElement,wire,track } from 'lwc';
import getSwiggy from '@salesforce/apex/mySwiggyclass.getSwiggy';
export default class mySwiggyclass extends LightningElement{
    dishName='';
@track FoodList =[];
@wire(getSwiggy,{foodName:'$dishName'})
retrieveSwiggy({error,data}){
    if(data){
        this.FoodList = data;
    }
    else if(error){
    }
  }
  handleKeyChange(event){
      this.dishName = event.target.value;
  }
}