import { LightningElement } from 'lwc';

export default class Udemy extends LightningElement {
    fullname="Zero To Hero"
    title="aura"

    changeHandler(event){
        this.title = event.target.value

    }
}