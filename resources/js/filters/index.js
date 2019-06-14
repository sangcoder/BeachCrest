import moment from 'moment'

export function upText (text) {
  if (!text) return ''
  text = text.toString()
  return text.charAt(0).toUpperCase() + text.substr(1)
}
export function birthDay (date) {
  return moment(date).format('DD-MM-YYYY')
}
export function calcAge (date) {
  return moment().diff(date, 'years')
}
export function myDate (date) {
  return moment(date).format('YYYY-MM-DD HH:mm:ss')
}
export function twoDigits (value) {
  if (value.toString().length <= 1) {
    return '0' + value.toString()
  }
  return value.toString()
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

export function timeAgo (value) {
  return moment(value).fromNow()
}

export function timeHour (value) {
  return moment(value).format('hh:mm a')
}
