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

class ApiParams {
  // API Response params C2B SINGLE STAGE
  static const String OutputTransactionID = 'output_TransactionID';
  static const String OutputConversationID = 'output_ConversationID';
  static const String OutputThirdPartyConversationID =
      'output_ThirdPartyConversationID';

  // API Request params C2B SINGLE STAGE
  static const String InputAmount = 'input_Amount';
  static const String InputCustomerMSISDN = 'input_CustomerMSISDN';
  static const String InputCountry = 'input_Country';
  static const String InputCurrency = 'input_Currency';
  static const String InputServiceProviderCode = 'input_ServiceProviderCode';
  static const String InputTransactionReference = 'input_TransactionReference';
  static const String InputThirdPartyConversationID =
      'input_ThirdPartyConversationID';
  static const String InputPurchasedItemsDesc = 'input_PurchasedItemsDesc';

  // API Response params C2B SINGLE STAGE
  static const String OutputResponseCode = 'output_ResponseCode';
  static const String OutputResponseDesc = 'output_ResponseDesc';
  static const String OutputSessionID = 'output_SessionID';
}
