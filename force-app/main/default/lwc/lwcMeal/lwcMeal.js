import { LightningElement, api, wire, track } from 'lwc';
import wireCall from '@salesforce/apex/ControllerMeal.wireCall';

const columns = [
  { label: 'Name', fieldName: 'strMeal', type: 'text' },
  { label: 'Category', fieldName: 'strCategory', type: 'text' },
  { label: 'Area', fieldName: 'strArea', type: 'text' },
  { label: 'Thumb', fieldName: 'strMealThumb', type: 'text' },
  { label: 'Instruction', fieldName: 'strInstructions', type: 'text' }
];

export default class LwcMeal extends LightningElement {

  @api title;
  @track dataRow;
  @track strSearch = '';

  data;
  size = 0;
  columns = columns;

  @wire( wireCall, { strSearch: null })
  wireMethodCallback({ error, data }){
    if (data) {
      this.data = data;
      this.size += 5;
      this.setDataRow();
    }
  }

  loadMoreData(event){
    if (this.strSearch.length != 0) {
      return;
    }
    if(event.target){
      event.target.isLoading = true;
    }

    this.tableElement = event.target;

    this.size += 5;
    this.setDataRow();
    this.tableElement.isLoading = false;
  }

  handlerKeyUp(event){
    if(event.target){
      event.target.isLoading = true;
    }
    this.tableElement = event.target;
    this.strSearch = event.target.value;
    if (event.keyCode === 13 || (this.strSearch.length == 0 && event.keyCode === 8 ) ) {
      wireCall({ strSearch: this.strSearch })
      .then(data =>{
        
        this.data = data;
        this.size = 5;
        this.setDataRow();

        if(this.tableElement){
          this.tableElement.isLoading = false;
        }
      })
    }
  }

  setDataRow(){
    this.dataRow = this.data.slice(0, this.size);
  }
}