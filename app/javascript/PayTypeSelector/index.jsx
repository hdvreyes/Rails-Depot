import React from 'react'
import NoPayType from './NoPayType';
import CreditCardPayType from './CreditCardPayType';
import CheckPayType from './CheckPayType';
import PurchaseOrderPayType from './PurchaseOrderPayType';

class PayTypeSelector extends React.Component {
    
    constructor(props) {
        super(props);
        this.onPayTypeSelected = this.onPayTypeSelected.bind(this);
        this.state = { selectedPayType: null }
    }

    onPayTypeSelected(event) {
        this.setState({
                 selectedPayType: event.target.value 
            });

    }

    render() {
        let PayTypeCustomComponent = null;
        switch(this.state.selectedPayType) {
            case "Credit card":
                PayTypeCustomComponent = CreditCardPayType;
                break
            case "Check":
                PayTypeCustomComponent = CheckPayType;
                break
            case "Purchase order":
                PayTypeCustomComponent = PurchaseOrderPayType;
                break
            default:
                PayTypeCustomComponent = NoPayType;
        }
        return(
            <div>
                <div className="field">
                    <label htmlFor="order_pay_type">Pay Type</label>
                    <select id="pay_type" onChange={this.onPayTypeSelected} name="order[pay_type]">
                        <option value="">Select a payment method</option>
                        <option value="Check">Check</option>
                        <option value="Credit card">Credit card</option>
                        <option value="Purchase order">Purchase order</option>
                    </select>
                    <PayTypeCustomComponent />
                </div>
            </div>
        );
    }

}
export default PayTypeSelector