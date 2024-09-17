import { LightningElement, api } from 'lwc';
import getPositions from '@salesforce/apex/ShowPositionHandler.getPositions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ShowCandidateDetailLWC extends LightningElement {
    @api recordId;
    positionList = [];
    error;
    showPositionDetails = false;

    handleShowPositionDetails() {
        if (this.showPositionDetails) {
            this.showPositionDetails = false;
        } else {
            getPositions({ candidateId: this.recordId })
                .then(result => {
                    this.positionList = result;
                    this.error = undefined;
                    this.showPositionDetails = true;
                    this.showToast('Success', 'Position details loaded successfully', 'success');
                })
                .catch(error => {
                    this.error = error;
                    this.positionList = [];
                    this.showToast('Error', 'Failed to load position details', 'error');
                });
        }
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }
}
