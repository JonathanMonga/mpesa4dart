///The API service endpoints
///-------------------------
class Endpoints {
  ///Before you can integrate on the M-Pesa OpenAPI solution,
  ///you must exchange your Application Key for a Session Key.
  ///The API Key is created with the creation of a new application.
  ///The Session Key acts as an access token that authorises the rest
  ///of your REST API calls to the system. A valid Session Key is needed
  ///to transact on M-Pesa using OpenAPI.
  static const String getSession = '/getSession/';

  ///The C2B API call is used as a standard customer-to-business transaction.
  ///Funds from the customer’s mobile money wallet will be deducted and be
  ///transferred to the mobile money wallet of the business.
  ///To authenticate and authorize this transaction, M-Pesa Payments Gateway will
  ///initiate a `USSD` Push message to the customer to gather and verify the mobile
  ///money PIN number. This number is not stored and is used only to authorize the
  ///transaction.
  static const String customerToBusinessPaymentSingleStage =
      '/c2bPayment/singleStage/';

  ///The B2C API Call is used as a standard business-to-customer funds disbursement.
  ///Funds from the business account’s wallet will be deducted and paid to the mobile money
  ///wallet of the customer. Use cases for the B2C includes:
  ///  * Salary payments
  ///  * Funds transfers from business
  ///  * Charity pay-out
  static const String businessToCustomerPayment = '/b2cPayment/';

  ///The B2B API Call is used for business-to-business transactions.
  ///Funds from the business mobile money wallet will be deducted
  ///and transferred to the mobile money wallet of the other business.
  ///Use cases for the B2C includes:
  ///   * Stock purchases
  ///   * Bill payment
  ///   * Ad-hoc payment
  static const String businessToBusinessPayment = '/b2bPayment/';

  ///The Reversal API is used to reverse a successful transaction.
  ///Using the Transaction ID of a previously successful transaction,
  ///the OpenAPI will withdraw the funds from the recipient party’s
  ///mobile money wallet and revert the funds to the mobile money wallet of
  ///the initiating party of the original transaction.
  static const String reversal = '/reversal/';

  /*
 * Created on Sun Jan 01 2023
 *
 * The MIT License (MIT)
 * Copyright (c) 2023 Jonathan Monga jmonga98@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software
 * and associated documentation files (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial
 * portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 * TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

  ///The Query Transaction Status API call is used to query the status of the transaction that has been initiated.
  static const String queryTransactionStatus = '/queryTransactionStatus/';

  ///Direct Debits are payments in M-Pesa that are initiated by the Payee alone
  ///without any Payer interaction, but permission must first be granted by the Payer.
  ///The granted permission from the Payer to Payee is commonly termed a ‘Mandate’,
  ///and M-Pesa must hold details of this Mandate.
  ///The Direct Debit API set allows an organisation to get the initial consent of
  ///their customers to create the Mandate that allows the organisation to debit
  ///customer's account at an agreed frequency and amount for services rendered.
  ///After the initial consent, the debit of the account will not involve any customer
  ///interaction. The Direct Debit feature makes use of the following API calls:
  ///  * Create a Direct Debit mandate
  ///  * Pay a mandate
  ///The customer is able to view and cancel the Direct Debit mandate from G2 menu
  ///accessible via USSD menu or the Smartphone Application.
  static const String directDebitCreation = '/directDebitCreation/';

  ///Direct Debits are payments in M-Pesa that are initiated by the Payee alone
  ///without any Payer interaction, but permission must first be granted by the Payer.
  ///The granted permission from the Payer to Payee is commonly termed a ‘Mandate’,
  ///and M-Pesa must hold details of this Mandate.
  ///The Direct Debit API set allows an organisation to get the initial consent of
  ///their customers to create the Mandate that allows the organisation to debit
  ///customer's account at an agreed frequency and amount for services rendered.
  ///After the initial consent, the debit of the account will not involve any customer
  ///interaction. The Direct Debit feature makes use of the following API calls:
  ///  * Create a Direct Debit mandate
  ///  * Pay a mandate
  ///The customer is able to view and cancel the Direct Debit mandate from G2 menu
  ///accessible via USSD menu or the Smartphone Application.
  static const String directDebitPayment = '/directDebitPayment/';

  ///The Query Beneficiary Name API call is used to query the details about a customer.
  ///Information that can be retrieved when using this API is:
  ///   * Customer First Name
  ///   * Customer Last Name
  static const String queryBeneficiaryName = '/queryBeneficiaryName/';

  ///M-Pesa Open API allows a merchant/partner to Query the Status of the Mandate in
  ///order to verify if the Direct Debit Payment will be approved prior to processing
  ///the payment. This API also includes the capability to query the account balance
  ///against the payment amount.
  static const String queryDirectDebit = '/queryDirectDebit/';
}
