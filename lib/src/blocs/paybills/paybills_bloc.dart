import 'dart:async';
import 'dart:ui';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:azapay/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'paybills_event.dart';
part 'paybills_state.dart';
part 'paybills_bloc.freezed.dart';

class PaybillsBloc extends Bloc<PaybillsEvent, PaybillsState> {
  final Repository repository;
  final GlobalKey<NavigatorState> navigatorState;
  final _logger = Logger();
  PaybillsBloc({this.repository, this.navigatorState}) : super(PaybillsInitial());

  final _previousState = <PaybillsState>[];
  @override
  void onTransition(Transition<PaybillsEvent, PaybillsState> transition) {
    // print(transition.toString());
    _previousState.add(transition.currentState);
    super.onTransition(transition);
  }

  Stream<PaybillsState> mapEventToState(
    PaybillsEvent event,
  ) async* {
    if (event is PayBillsService) {
      //recieve the list

      switch (event.service) {
        case 0:
          //Buyairtime
          try {
            final response = await repository.retrieveAirtime();
            //i placed buy airtime as  category not product
            //todo: repository to get list
            yield PaybillsInputData<String, GetPayBillsItem>()
                .copyWith(getPayBillsCategory: response, service: event.service);
          } catch (e) {
            showToast(
                BasicResponse(
                  message: AppDioErrorHandling().handleError(e),
                  status: 400,
                ).message,
                backgroundColor: ColorSets.colorPrimaryLightYellow,
                context: navigatorState.currentState.context,
                animation: StyledToastAnimation.slideFromTop,
                reverseAnimation: StyledToastAnimation.slideToTop,
                position: StyledToastPosition.top,
                startOffset: Offset(0.0, -3.0),
                reverseEndOffset: Offset(0.0, -3.0),
                duration: Duration(seconds: 4),
                //Animation duration   animDuration * 2 <= duration
                animDuration: Duration(seconds: 1),
                curve: Curves.elasticOut,
                reverseCurve: Curves.fastOutSlowIn);
            // final response = await repository.retrieveAirtime();
            //i placed buy airtime as  category not product
            //todo: repository to get list
            // yield PaybillsInputData<String, GetPayBillsItem>()
            //     .copyWith(getPayBillsCategory: response, service: event.service);
          }

          break;
        case 1:
          //buydata
          try {
            // final responsecategory = await repository.retrieveDataCategory();
            final responseproduct = await repository.retrieveDataProduct();

            yield PaybillsInputData<GetPayBillsItem, GetPayBillsItem>()
                .copyWith(service: event.service, getPayBillsProduct: responseproduct);

            //todo: repository to

          } catch (e) {
            // final responseproduct = await repository.retrieveDataProduct();

            // yield PaybillsInputData<GetPayBillsItem, GetPayBillsItem>()
            //     .copyWith(service: event.service, getPayBillsProduct: responseproduct);

            // final response = await repository.retrieveDataCategory();

            // yield PaybillsInputData<GetPayBillsItem, GetPayBillsItem>()
            //     .copyWith(getPayBillsCategory: response, service: event.service);
            showToast(
                BasicResponse(
                  message: AppDioErrorHandling().handleError(e),
                  status: 400,
                ).message,
                backgroundColor: ColorSets.colorPrimaryLightYellow,
                context: navigatorState.currentState.context,
                animation: StyledToastAnimation.slideFromTop,
                reverseAnimation: StyledToastAnimation.slideToTop,
                position: StyledToastPosition.top,
                startOffset: Offset(0.0, -3.0),
                reverseEndOffset: Offset(0.0, -3.0),
                duration: Duration(seconds: 4),
                //Animation duration   animDuration * 2 <= duration
                animDuration: Duration(seconds: 1),
                curve: Curves.elasticOut,
                reverseCurve: Curves.fastOutSlowIn);
            //todo: repository to

          }

          break;

        case 2:
          //electricity

          try {
            final response = await repository.retrieveElectricityCategory();

            yield PaybillsInputData<GetPayBillsItem, GetPayBillsItem>()
                .copyWith(getPayBillsCategory: response, service: event.service);

            //todo: repository to
          } catch (e) {
            showToast(
                BasicResponse(
                  message: AppDioErrorHandling().handleError(e),
                  status: 400,
                ).message,
                backgroundColor: ColorSets.colorPrimaryRed,
                context: navigatorState.currentState.context,
                animation: StyledToastAnimation.slideFromTop,
                reverseAnimation: StyledToastAnimation.slideToTop,
                position: StyledToastPosition.top,
                startOffset: Offset(0.0, -3.0),
                reverseEndOffset: Offset(0.0, -3.0),
                duration: Duration(seconds: 4),
                //Animation duration   animDuration * 2 <= duration
                animDuration: Duration(seconds: 1),
                curve: Curves.elasticOut,
                reverseCurve: Curves.fastOutSlowIn);
            // final response = await repository.retrieveElectricityCategory();

            // yield PaybillsInputData<GetPayBillsItem, GetPayBillsItem>()
            //     .copyWith(getPayBillsCategory: response, service: event.service);

            //todo: repository to
          }

          break;
        case 3:

          //tvcable
          try {
            final response = await repository.retrieveCableCategory();

            yield PaybillsInputData<GetPayBillsItem, GetPayBillsItem>()
                .copyWith(getPayBillsCategory: response, service: event.service);

            //todo: repository to
          } catch (e) {
            showToast(
                BasicResponse(
                  message: AppDioErrorHandling().handleError(e),
                  status: 400,
                ).message,
                backgroundColor: ColorSets.colorPrimaryRed,
                context: navigatorState.currentState.context,
                animation: StyledToastAnimation.slideFromTop,
                reverseAnimation: StyledToastAnimation.slideToTop,
                position: StyledToastPosition.top,
                startOffset: Offset(0.0, -3.0),
                reverseEndOffset: Offset(0.0, -3.0),
                duration: Duration(seconds: 4),
                //Animation duration   animDuration * 2 <= duration
                animDuration: Duration(seconds: 1),
                curve: Curves.elasticOut,
                reverseCurve: Curves.fastOutSlowIn);
            // final response = await repository.retrieveCableCategory();

            // yield PaybillsInputData<GetPayBillsItem, GetPayBillsItem>().copyWith(getPayBillsCategory: response);

            //todo: repository to
          }

          break;
        case 4:
          //todo: repository to

          break;

        case 5:
          //todo: repository to

          break;
        case 6:
          //todo: repository to
          break;
        case 7:

          //todo: repository to

          break;
      }
    } else if (event is SendPayBillsRequest) {
      //send request
      yield PaybillsLoading();
      // print(_previousState.last);
      final inputstateTransisiton = _previousState.last is PaybillsInputData<GetPayBillsItem, GetPayBillsItem>
          ? _previousState.whereType<PaybillsInputData<GetPayBillsItem, GetPayBillsItem>>().last
          : _previousState.whereType<PaybillsInputData<String, GetPayBillsItem>>().last;
      // final inputstate = (state as PaybillsInputData);
      switch (inputstateTransisiton.service) {
        case 0:
          try {
            final inputstateTransisiton = _previousState.whereType<PaybillsInputData<String, GetPayBillsItem>>().last;
            final response = await repository.purchaseAirtime(
                payBill: PayBill<double>(
                    product: inputstateTransisiton.product,
                    amount: inputstateTransisiton.amount,
                    transactionPin: repository.retrievePin().pin,
                    phone: inputstateTransisiton.phone));
            if (response.status == 200) {
              yield inputstateTransisiton.copyWith(success: response.status, responsemessage: response.message);
            } else {
              yield inputstateTransisiton.copyWith(error: response.status, responsemessage: response.message);
            }
          } catch (e) {
            yield inputstateTransisiton.copyWith(
                responsemessage: BasicResponse(
                  message: e is! DioError ? e.toString() : AppDioErrorHandling().handleError(e),
                  status: 400,
                ).message,
                error: 400);
          }
          //todo: repository to

          break;
        case 1:
          try {
            // print(inputstateTransisiton);
            final response = await repository.purchaseData(
                payBill: PayBill<double>(
                    telco: inputstateTransisiton.product,
                    amount: inputstateTransisiton.amount,
                    transactionPin: repository.retrievePin().pin,
                    productCode: inputstateTransisiton.productCode,
                    phone: inputstateTransisiton.phone));

            if (response.status == 200) {
              yield inputstateTransisiton.copyWith(success: response.status, responsemessage: response.message);
            } else {
              yield inputstateTransisiton.copyWith(error: response.status, responsemessage: response.message);
            }
          } catch (e) {
            yield inputstateTransisiton.copyWith(
                responsemessage: BasicResponse(
                  message: AppDioErrorHandling().handleError(e),
                  status: 400,
                ).message,
                error: 400);
          }
          //todo: repository to

          break;

        case 2:
          //todo: repository to
          try {
            final response = await repository.purchaseElectricity(
                payBill: PayBill<double>(
                    billCode: inputstateTransisiton.billcode,
                    // productCode: inputstateTransisiton.productCode,
                    product: inputstateTransisiton.product,
                    phone: inputstateTransisiton.phone,
                    accountName: inputstateTransisiton.verifyCustomer.data.name,
                    meterNo: inputstateTransisiton.smartcardormeterNo,
                    transactionPin: repository.retrievePin().pin,
                    amount: inputstateTransisiton.amount));

            if (response.status == 200) {
              yield inputstateTransisiton.copyWith(success: response.status, responsemessage: response.message);
            } else {
              yield inputstateTransisiton.copyWith(error: response.status, responsemessage: response.message);
            }
          } catch (e) {
            yield inputstateTransisiton.copyWith(
                responsemessage: BasicResponse(
                  message: AppDioErrorHandling().handleError(e),
                  status: 400,
                ).message,
                error: 400);
          }

          break;
        case 3:
          //todo: repository to
          try {
            final response = await repository.purchaseCable(
                payBill: PayBill<double>(
                    billCode: inputstateTransisiton.billcode,
                    productCode: inputstateTransisiton.productCode,
                    phone: inputstateTransisiton.phone,
                    name: inputstateTransisiton.verifyCustomer.data.name,
                    smartcard: inputstateTransisiton.smartcardormeterNo,
                    transactionPin: repository.retrievePin().pin,
                    amount: inputstateTransisiton.amount));

            if (response.status == 200) {
              yield inputstateTransisiton.copyWith(success: response.status, responsemessage: response.message);
            } else {
              yield inputstateTransisiton.copyWith(error: response.status, responsemessage: response.message);
            }
          } catch (e) {
            yield inputstateTransisiton.copyWith(
                responsemessage: BasicResponse(
                  message: AppDioErrorHandling().handleError(e),
                  status: 400,
                ).message,
                error: 400);
          }

          break;
        case 4:
          //todo: repository to

          break;

        case 5:
          //todo: repository to

          break;
        case 6:
          //todo: repository to

          break;

        case 7:
          //todo: repository to
          break;
      }
    } else if (event is PayBillsAmount) {
      yield (state as PaybillsInputData).copyWith(
        amount: event.amount,
      );
    } else if (event is PayBillsCategoryName) {
      //todo: remove categoryname from my state--done

      yield (state as PaybillsInputData).copyWith(
        categoryName: event.categoryName,
      );
    } else if (event is PayBillsCategoryId) {
      //todo: remove categoryid from my state--done
      // switch ((state as PaybillsInputData).service) {
      //   case 2:
      //     if ((state as PaybillsInputData).smartcardormeterNo.isNotEmpty) {
      //       final response = await repository.verifyElectricityUserMeter(
      //           category_id: event.categoryId, meter_no: (state as PaybillsInputData).smartcardormeterNo);

      //       yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(verifyCustomer: response);
      //     }
      //     break;
      //   case 3:
      //     if ((state as PaybillsInputData).smartcardormeterNo.isNotEmpty) {
      //       final response = await repository.verifyCableUser(
      //           category_id: event.categoryId, smartcard: (state as PaybillsInputData).smartcardormeterNo);

      //       yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(verifyCustomer: response);
      //     }
      //     break;
      //   default:
      yield (state as PaybillsInputData).copyWith(
        categoryId: event.categoryId,
      );
      //     break;
      // }
    } else if (event is PayBillsOthersNumber) {
      switch ((state as PaybillsInputData).service) {
        case 0:
          yield (state as PaybillsInputData<String, GetPayBillsItem>).copyWith(
            phone: event.othersno,
          );
          break;
        default:
          yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(
            phone: event.othersno,
          );
      }
    } else if (event is PayBillsProductCode) {
      yield (state as PaybillsInputData).copyWith(
        productCode: event.productCode,
      );
    } else if (event is PayBillsisRadioSelectedBillCategoryProvider) {
      switch ((state as PaybillsInputData).service) {
        case 0:
          yield (state as PaybillsInputData<String, GetPayBillsItem>).copyWith(
            isRadioSelectedBillCategoryProvider: event.position,
          );
          break;

        default:
          yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(
            isRadioSelectedBillCategoryProvider: event.position,
          );
      }
    } else if (event is PayBillsisRadioSelectedBillProductProvider) {
      yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(
        isRadioSelectedBillProductProvider: event.position,
      );
    } else if (event is PayBillisRadioSelectedBillSubProductProvider) {
      yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(
        isRadioSelectedBillSubProductProvider: event.position,
      );
    } else if (event is PayBillsisRadioSelectedPhoneNumber) {
      switch ((state as PaybillsInputData).service) {
        case 0:
          yield (state as PaybillsInputData<String, GetPayBillsItem>).copyWith(
            isRadioSelectedPhoneNumber: event.position,
          );

          break;

        default:
          yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(
            isRadioSelectedPhoneNumber: event.position,
          );
      }
    } else if (event is PayBillsSmartCardOrMeterNo) {
      yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(
        smartcardormeterNo: event.smartcardormeterno,
      );
    } else if (event is ClearBillService) {
      yield PaybillsInputData<String, GetPayBillsItem>();
      yield PaybillsInputData<GetPayBillsItem, GetPayBillsItem>();
      yield PaybillsInitial();
    } else if (event is ClearBillServiceAfterResponse) {
      if (state is PaybillsInputData<String, GetPayBillsItem>) {
        yield (state as PaybillsInputData<String, GetPayBillsItem>).copyWith(
            success: 100,
            responsemessage: '',
            error: 100,
            verifyCustomer: VerifyCustomer(data: VerifyCustomerData(name: AppStrings.empty)));
      } else if (state is PaybillsInputData<GetPayBillsItem, GetPayBillsItem>) {
        yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(
            success: 100,
            responsemessage: '',
            error: 100,
            verifyCustomer: VerifyCustomer(data: VerifyCustomerData(name: AppStrings.empty)));
      }
    } else if (event is PayBillsProductName) {
      yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
          .copyWith(product: event.productName, isRadioSelectedBillSubProductProvider: null);
    } else if (event is PayBillsBillCode) {
      // if ((state as PaybillsInputData).smartcardormeterNo.isNotEmpty) {
      // final response = await repository.retrieveCableProductSelectedCategory(
      //     category_name: event.billCode, smartcard: (state as PaybillsInputData).smartcardormeterNo);

      // yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(getPayBillsProduct: response);

      // yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(billcode: event.billCode);
      // }

      //     break;

      // }

      yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(billcode: event.billCode);
    } else if (event is PayBillsRetrieveName) {
      print((state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).service);
      switch ((state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).service) {
        case 2:
          if ((state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).smartcardormeterNo.isNotEmpty) {
            final response = await repository.verifyElectricityUserMeter(
                billcode: (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).billcode,
                meter_no: (state as PaybillsInputData).smartcardormeterNo);

            yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(verifyCustomer: response);
          }
          break;
        case 3:
          if ((state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).smartcardormeterNo.isNotEmpty) {
            final response = await repository.verifyCableUser(
                billcode: (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).billcode,
                smartcard: (state as PaybillsInputData).smartcardormeterNo);

            yield (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).copyWith(verifyCustomer: response);
          }
          break;
      }
    }
  }
}
