<template>
  <div>
    <div id="paypal-button-container"></div>
    <div v-if="success" class="alert alert-success">
      <strong>Success!</strong> Payment successfuly done
    </div>
    <div v-if="error" class="alert alert-danger">
      <strong>Ooops!</strong> something went wrong
    </div>
  </div>
</template>
<script>
import BookingAPI from "../bookingService";
export default {
  name: "paypalCheckout",
  props: ["amount"],
  data() {
    return {
      error: false,
      success: false,
      myItems: [
        {
          "name": "hat",
          "description": "Brown hat.",
          "quantity": "1",
          "price": "5",
          "currency": "USD"
          },
          {
          "name": "handbag",
          "description": "Black handbag.",
          "quantity": "1",
          "price": "5",
          "currency": "USD"
          }
      ]
    };
  },
  mounted() {
    let client = {
      sandbox:
        "AQvKshlWsrIkgNGV4wmSTBWiuIaspbylerlvlk20XEW8FSnPQ9UmZMkuMUXHaxPtAe0wrGFaOGDpsniD"
    };
    let payment = (data, actions) => {
      // Make a call to the REST api to create the payment
      return actions.payment.create({
        payment: {
          transactions: [
            {
              amount: { total: this.amount, currency: "USD" }
            }
          ]
        }
      });
    };
    let onAuthorize = data => {
      var data = {
        paymentID: data.paymentID,
        payerID: data.payerID,
        amount: this.amount
      };
      this.senDataPaypal({ data: data })
        .then(res => {
          console.log("ok" + res);
          this.success = true;
        })
        .catch(err => {
          this.error = true;
        });
    };
    paypal.Button.render(
      {
        env: "sandbox", // sandbox | production
        commit: true,

        client,
        payment,
        onAuthorize
      },
      "#paypal-button-container"
    );
  },
  methods: {
    senDataPaypal(creds) {
      return new Promise((resolve, reject) => {
        BookingAPI.checkOutPaypal(creds)
          .then(res => {
            console.log("la" + res);
            return resolve();
          })
          .catch(err => {
            reject(err);
          });
      });
    }
  }
};
</script>
<style scoped>
</style>
