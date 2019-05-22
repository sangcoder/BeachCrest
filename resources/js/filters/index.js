import moment from 'moment'

export function upText (text) {
  if (!text) return ''
  text = text.toString()
  return text.charAt(0).toUpperCase() + text.substr(1)
}
export function myDate (date) {
  return moment(date).format('DD/MM/YYYY')
}
export function toCurrency (value) {
  if (typeof value !== 'number') {
    return value
  }
  var formatter = new Intl.NumberFormat('it-IT', {
    style: 'currency',
    currency: 'VND',
    minimumFractionDigits: 0
  })
  return formatter.format(value)
}
