import Success from './components/Success.vue'
import Cancel from './components/Cancel.vue'

export default [
  {
    path: '/paypal/success',
    name: 'PaypalSuccess',
    component: Success
  },
  {
    path: '/paypal/cancel',
    name: 'PaypalCancel',
    component: Cancel
  }
]
