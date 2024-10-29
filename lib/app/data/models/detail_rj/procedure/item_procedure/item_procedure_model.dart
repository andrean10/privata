import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_procedure_model.freezed.dart';
part 'item_procedure_model.g.dart';

@freezed
class ItemProcedureModel with _$ItemProcedureModel {
  const factory ItemProcedureModel({
    String? id,
    String? name,
    int? basicFee,
    int? totalFee,
    bool? isPriceLock,
  }) = _ItemProcedureModel;

  factory ItemProcedureModel.fromJson(Map<String, Object?> json) =>
      _$ItemProcedureModelFromJson(json);
}

// class ProcedureModel {
//   String? id;
//   String? name;
//   int? basicFee;
//   // int? totalTaxFee;
//   // List<Null>? taxElement;
//   // int? totalFee;
//   // String? note;
//   // List<String>? practiceId;
//   // String? hospitalId;
//   // bool? isPriceLock;
//   // List<ItemsUsed>? itemsUsed;
//   // List<Commission>? commission;
//   // Icd9Cm? icd9Cm;
//   // String? createdAt;
//   // String? createdId;
//   // String? createdName;
//   // String? updatedAt;
//   // String? updatedId;
//   // String? updatedName;
//   // bool? isTuslah;
//   // bool? isEmbalase;
//   // bool? isAdminsProcedure;
//   // List<SellingPrice>? sellingPrice;
//   // bool? isActive;
//   // List<PoliId>? poliId;
//   // int? totalFeePrescriptionNeeded;
//   // List<PrescriptionNeeded>? prescriptionNeeded;
//   // String? updateName;
//   // List<CommissionPoint>? commissionPoint;

//   ProcedureModel({
//     this.id,
//     this.name,
//     this.basicFee,
//     // this.totalTaxFee,
//     // this.taxElement,
//     // this.totalFee,
//     // this.note,
//     // this.practiceId,
//     // this.hospitalId,
//     // this.isPriceLock,
//     // this.itemsUsed,
//     // this.commission,
//     // this.icd9Cm,
//     // this.createdAt,
//     // this.createdId,
//     // this.createdName,
//     // this.updatedAt,
//     // this.updatedId,
//     // this.updatedName,
//     // this.isTuslah,
//     // this.isEmbalase,
//     // this.isAdminsProcedure,
//     // this.sellingPrice,
//     // this.isActive,
//     // this.poliId,
//     // this.totalFeePrescriptionNeeded,
//     // this.prescriptionNeeded,
//     // this.updateName,
//     // this.commissionPoint,
//   });

//   ProcedureModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     basicFee = json['basicFee'];
//     // totalTaxFee = json['totalTaxFee'];
//     // if (json['taxElement'] != null) {
//     //   taxElement = <Null>[];
//     //   json['taxElement'].forEach((v) {
//     //     taxElement!.add(new Null.fromJson(v));
//     //   });
//     // }
//     // totalFee = json['totalFee'];
//     // note = json['note'];
//     // practiceId = json['practiceId'].cast<String>();
//     // hospitalId = json['hospitalId'];
//     // isPriceLock = json['isPriceLock'];
//     // if (json['itemsUsed'] != null) {
//     //   itemsUsed = <ItemsUsed>[];
//     //   json['itemsUsed'].forEach((v) {
//     //     itemsUsed!.add(new ItemsUsed.fromJson(v));
//     //   });
//     // }
//     // if (json['commission'] != null) {
//     //   commission = <Commission>[];
//     //   json['commission'].forEach((v) {
//     //     commission!.add(new Commission.fromJson(v));
//     //   });
//     // }
//     // icd9Cm =
//     //     json['icd9Cm'] != null ? new Icd9Cm.fromJson(json['icd9Cm']) : null;
//     // createdAt = json['createdAt'];
//     // createdId = json['createdId'];
//     // createdName = json['createdName'];
//     // updatedAt = json['updatedAt'];
//     // updatedId = json['updatedId'];
//     // updatedName = json['updatedName'];
//     // isTuslah = json['isTuslah'];
//     // isEmbalase = json['isEmbalase'];
//     // isAdminsProcedure = json['isAdminsProcedure'];
//     // if (json['sellingPrice'] != null) {
//     //   sellingPrice = <SellingPrice>[];
//     //   json['sellingPrice'].forEach((v) {
//     //     sellingPrice!.add(new SellingPrice.fromJson(v));
//     //   });
//     // }
//     // isActive = json['isActive'];

//     // if (json['poliId'] != null) {
//     //   poliId = <PoliId>[];
//     //   json['poliId'].forEach((v) {
//     //     poliId!.add(new PoliId.fromJson(v));
//     //   });
//     // }
//     // totalFeePrescriptionNeeded = json['totalFeePrescriptionNeeded'];
//     // if (json['prescriptionNeeded'] != null) {
//     //   prescriptionNeeded = <PrescriptionNeeded>[];
//     //   json['prescriptionNeeded'].forEach((v) {
//     //     prescriptionNeeded!.add(new PrescriptionNeeded.fromJson(v));
//     //   });
//     // }
//     // updateName = json['updateName'];
//     // if (json['commissionPoint'] != null) {
//     //   commissionPoint = <CommissionPoint>[];
//     //   json['commissionPoint'].forEach((v) {
//     //     commissionPoint!.add(new CommissionPoint.fromJson(v));
//     //   });
//     // }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['basicFee'] = basicFee;
//     // data['totalTaxFee'] = this.totalTaxFee;
//     // // if (this.taxElement != null) {
//     // //   data['taxElement'] = this.taxElement!.map((v) => v.toJson()).toList();
//     // // }
//     // data['totalFee'] = this.totalFee;
//     // data['note'] = this.note;
//     // data['practiceId'] = this.practiceId;
//     // data['hospitalId'] = this.hospitalId;
//     // data['isPriceLock'] = this.isPriceLock;
//     // if (this.itemsUsed != null) {
//     //   data['itemsUsed'] = this.itemsUsed!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.commission != null) {
//     //   data['commission'] = this.commission!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.icd9Cm != null) {
//     //   data['icd9Cm'] = this.icd9Cm!.toJson();
//     // }
//     // data['createdAt'] = this.createdAt;
//     // data['createdId'] = this.createdId;
//     // data['createdName'] = this.createdName;
//     // data['updatedAt'] = this.updatedAt;
//     // data['updatedId'] = this.updatedId;
//     // data['updatedName'] = this.updatedName;
//     // data['isTuslah'] = this.isTuslah;
//     // data['isEmbalase'] = this.isEmbalase;
//     // data['isAdminsProcedure'] = this.isAdminsProcedure;
//     // if (this.sellingPrice != null) {
//     //   data['sellingPrice'] = this.sellingPrice!.map((v) => v.toJson()).toList();
//     // }
//     // data['isActive'] = this.isActive;
//     // if (this.poliId != null) {
//     //   data['poliId'] = this.poliId!.map((v) => v.toJson()).toList();
//     // }
//     // data['totalFeePrescriptionNeeded'] = this.totalFeePrescriptionNeeded;
//     // if (this.prescriptionNeeded != null) {
//     //   data['prescriptionNeeded'] =
//     //       this.prescriptionNeeded!.map((v) => v.toJson()).toList();
//     // }
//     // data['updateName'] = this.updateName;
//     // if (this.commissionPoint != null) {
//     //   data['commissionPoint'] =
//     //       this.commissionPoint!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }

// class ItemsUsed {
//   String? id;
//   String? akhpId;
//   String? itemName;
//   double? quantity;
//   int? buyFee;
//   String? dosage;
//   String? unit;
//   bool? isOneTimeUseOnly;
//   int? sellNormalFee;
//   int? stockTotal;
//   List<DepotStocks>? depotStocks;

//   ItemsUsed(
//       {this.id,
//       this.akhpId,
//       this.itemName,
//       this.quantity,
//       this.buyFee,
//       this.dosage,
//       this.unit,
//       this.isOneTimeUseOnly,
//       this.sellNormalFee,
//       this.stockTotal,
//       this.depotStocks});

//   ItemsUsed.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     akhpId = json['akhpId'];
//     itemName = json['itemName'];
//     quantity = json['quantity'];
//     buyFee = json['buyFee'];
//     dosage = json['dosage'];
//     unit = json['unit'];
//     isOneTimeUseOnly = json['isOneTimeUseOnly'];
//     sellNormalFee = json['sellNormalFee'];
//     stockTotal = json['stockTotal'];
//     if (json['DepotStocks'] != null) {
//       depotStocks = <DepotStocks>[];
//       json['DepotStocks'].forEach((v) {
//         depotStocks!.add(new DepotStocks.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['akhpId'] = akhpId;
//     data['itemName'] = itemName;
//     data['quantity'] = quantity;
//     data['buyFee'] = buyFee;
//     data['dosage'] = dosage;
//     data['unit'] = unit;
//     data['isOneTimeUseOnly'] = isOneTimeUseOnly;
//     data['sellNormalFee'] = sellNormalFee;
//     data['stockTotal'] = stockTotal;
//     if (depotStocks != null) {
//       data['DepotStocks'] = depotStocks!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class DepotStocks {
//   String? akhpId;
//   String? hospitalId;
//   String? itemName;
//   String? name;
//   String? type;
//   int? stock;
//   String? unit;
//   String? dosage;
//   // List<Null>? practiceId;
//   bool? isFirstTime;
//   int? countOpened;
//   bool? isRunOut;
//   String? usedItemLabel;
//   int? usedItemPercentage;
//   double? averagePrice;
//   int? averageUsage;
//   String? createdAt;
//   String? updatedAt;
//   String? createdName;
//   String? createdId;
//   String? updatedId;
//   String? id;
//   List<CountUsage>? countUsage;

//   DepotStocks(
//       {this.akhpId,
//       this.hospitalId,
//       this.itemName,
//       this.name,
//       this.type,
//       this.stock,
//       this.unit,
//       this.dosage,
//       // this.practiceId,
//       this.isFirstTime,
//       this.countOpened,
//       this.isRunOut,
//       this.usedItemLabel,
//       this.usedItemPercentage,
//       this.averagePrice,
//       this.averageUsage,
//       this.createdAt,
//       this.updatedAt,
//       this.createdName,
//       this.createdId,
//       this.updatedId,
//       this.id,
//       this.countUsage});

//   DepotStocks.fromJson(Map<String, dynamic> json) {
//     akhpId = json['akhpId'];
//     hospitalId = json['hospitalId'];
//     itemName = json['itemName'];
//     name = json['name'];
//     type = json['type'];
//     stock = json['stock'];
//     unit = json['unit'];
//     dosage = json['dosage'];
//     // if (json['practiceId'] != null) {
//     //   practiceId = <Null>[];
//     //   json['practiceId'].forEach((v) {
//     //     practiceId!.add(new Null.fromJson(v));
//     //   });
//     // }
//     isFirstTime = json['isFirstTime'];
//     countOpened = json['countOpened'];
//     isRunOut = json['isRunOut'];
//     usedItemLabel = json['usedItemLabel'];
//     usedItemPercentage = json['usedItemPercentage'];
//     averagePrice = json['averagePrice'];
//     averageUsage = json['averageUsage'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     createdName = json['createdName'];
//     createdId = json['createdId'];
//     updatedId = json['updatedId'];
//     id = json['id'];
//     if (json['countUsage'] != null) {
//       countUsage = <CountUsage>[];
//       json['countUsage'].forEach((v) {
//         countUsage!.add(new CountUsage.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['akhpId'] = akhpId;
//     data['hospitalId'] = hospitalId;
//     data['itemName'] = itemName;
//     data['name'] = name;
//     data['type'] = type;
//     data['stock'] = stock;
//     data['unit'] = unit;
//     data['dosage'] = dosage;
//     // if (this.practiceId != null) {
//     //   data['practiceId'] = this.practiceId!.map((v) => v.toJson()).toList();
//     // }
//     data['isFirstTime'] = isFirstTime;
//     data['countOpened'] = countOpened;
//     data['isRunOut'] = isRunOut;
//     data['usedItemLabel'] = usedItemLabel;
//     data['usedItemPercentage'] = usedItemPercentage;
//     data['averagePrice'] = averagePrice;
//     data['averageUsage'] = averageUsage;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['createdName'] = createdName;
//     data['createdId'] = createdId;
//     data['updatedId'] = updatedId;
//     data['id'] = id;
//     if (countUsage != null) {
//       data['countUsage'] = countUsage!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class CountUsage {
//   double? usage;
//   OldStockState? oldStockState;
//   String? personInCharge;
//   String? depotId;
//   String? mrId;
//   String? akhpId;
//   bool? isRunOut;
//   bool? isTotal;
//   int? countOpened;
//   int? usedItemPercentage;
//   String? usedItemLabel;
//   String? createdId;
//   String? createdAt;
//   String? id;
//   bool? isFromProcedure;
//   int? queueNumber;
//   List<EffectedKtxItemId>? effectedKtxItemId;

//   CountUsage(
//       {this.usage,
//       this.oldStockState,
//       this.personInCharge,
//       this.depotId,
//       this.mrId,
//       this.akhpId,
//       this.isRunOut,
//       this.isTotal,
//       this.countOpened,
//       this.usedItemPercentage,
//       this.usedItemLabel,
//       this.createdId,
//       this.createdAt,
//       this.id,
//       this.isFromProcedure,
//       this.queueNumber,
//       this.effectedKtxItemId});

//   CountUsage.fromJson(Map<String, dynamic> json) {
//     usage = json['usage'];
//     oldStockState = json['oldStockState'] != null
//         ? new OldStockState.fromJson(json['oldStockState'])
//         : null;
//     personInCharge = json['personInCharge'];
//     depotId = json['depotId'];
//     mrId = json['mrId'];
//     akhpId = json['akhpId'];
//     isRunOut = json['isRunOut'];
//     isTotal = json['isTotal'];
//     countOpened = json['countOpened'];
//     usedItemPercentage = json['usedItemPercentage'];
//     usedItemLabel = json['usedItemLabel'];
//     createdId = json['createdId'];
//     createdAt = json['createdAt'];
//     id = json['id'];
//     isFromProcedure = json['isFromProcedure'];
//     queueNumber = json['queueNumber'];
//     if (json['effectedKtxItemId'] != null) {
//       effectedKtxItemId = <EffectedKtxItemId>[];
//       json['effectedKtxItemId'].forEach((v) {
//         effectedKtxItemId!.add(new EffectedKtxItemId.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['usage'] = usage;
//     if (oldStockState != null) {
//       data['oldStockState'] = oldStockState!.toJson();
//     }
//     data['personInCharge'] = personInCharge;
//     data['depotId'] = depotId;
//     data['mrId'] = mrId;
//     data['akhpId'] = akhpId;
//     data['isRunOut'] = isRunOut;
//     data['isTotal'] = isTotal;
//     data['countOpened'] = countOpened;
//     data['usedItemPercentage'] = usedItemPercentage;
//     data['usedItemLabel'] = usedItemLabel;
//     data['createdId'] = createdId;
//     data['createdAt'] = createdAt;
//     data['id'] = id;
//     data['isFromProcedure'] = isFromProcedure;
//     data['queueNumber'] = queueNumber;
//     if (effectedKtxItemId != null) {
//       data['effectedKtxItemId'] =
//           effectedKtxItemId!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class OldStockState {
//   bool? isFirstTime;
//   bool? isRunOut;
//   String? usedItemLabel;
//   int? usedItemPercentage;

//   OldStockState(
//       {this.isFirstTime,
//       this.isRunOut,
//       this.usedItemLabel,
//       this.usedItemPercentage});

//   OldStockState.fromJson(Map<String, dynamic> json) {
//     isFirstTime = json['isFirstTime'];
//     isRunOut = json['isRunOut'];
//     usedItemLabel = json['usedItemLabel'];
//     usedItemPercentage = json['usedItemPercentage'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['isFirstTime'] = isFirstTime;
//     data['isRunOut'] = isRunOut;
//     data['usedItemLabel'] = usedItemLabel;
//     data['usedItemPercentage'] = usedItemPercentage;
//     return data;
//   }
// }

// class EffectedKtxItemId {
//   String? ktxItemId;
//   int? usedQuantity;

//   EffectedKtxItemId({this.ktxItemId, this.usedQuantity});

//   EffectedKtxItemId.fromJson(Map<String, dynamic> json) {
//     ktxItemId = json['ktxItemId'];
//     usedQuantity = json['usedQuantity'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ktxItemId'] = ktxItemId;
//     data['usedQuantity'] = usedQuantity;
//     return data;
//   }
// }

// class Commission {
//   String? doctorName;
//   String? practiceId;
//   int? procedurePrice;
//   String? type;
//   int? commission;
//   int? totalCommisionFee;
//   int? totalItemsUsedFee;
//   int? margin;

//   Commission(
//       {this.doctorName,
//       this.practiceId,
//       this.procedurePrice,
//       this.type,
//       this.commission,
//       this.totalCommisionFee,
//       this.totalItemsUsedFee,
//       this.margin});

//   Commission.fromJson(Map<String, dynamic> json) {
//     doctorName = json['doctorName'];
//     practiceId = json['practiceId'];
//     procedurePrice = json['procedurePrice'];
//     type = json['type'];
//     commission = json['commission'];
//     totalCommisionFee = json['totalCommisionFee'];
//     totalItemsUsedFee = json['totalItemsUsedFee'];
//     margin = json['margin'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['doctorName'] = doctorName;
//     data['practiceId'] = practiceId;
//     data['procedurePrice'] = procedurePrice;
//     data['type'] = type;
//     data['commission'] = commission;
//     data['totalCommisionFee'] = totalCommisionFee;
//     data['totalItemsUsedFee'] = totalItemsUsedFee;
//     data['margin'] = margin;
//     return data;
//   }
// }

// class Icd9Cm {
//   String? code;
//   String? description;

//   Icd9Cm({this.code, this.description});

//   Icd9Cm.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = code;
//     data['description'] = description;
//     return data;
//   }
// }

// class SellingPrice {
//   String? idMetodeBayar;
//   String? tipe;
//   String? nama;
//   String? harga;

//   SellingPrice({this.idMetodeBayar, this.tipe, this.nama, this.harga});

//   SellingPrice.fromJson(Map<String, dynamic> json) {
//     idMetodeBayar = json['idMetodeBayar'];
//     tipe = json['tipe'];
//     nama = json['nama'];
//     harga = json['harga'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['idMetodeBayar'] = idMetodeBayar;
//     data['tipe'] = tipe;
//     data['nama'] = nama;
//     data['harga'] = harga;
//     return data;
//   }
// }

// class PoliId {
//   bool? poliSakit;
//   String? createdAt;
//   String? createdId;
//   String? id;
//   String? hospitalId;
//   String? kdPoli;
//   String? nmPoli;

//   PoliId(
//       {this.poliSakit,
//       this.createdAt,
//       this.createdId,
//       this.id,
//       this.hospitalId,
//       this.kdPoli,
//       this.nmPoli});

//   PoliId.fromJson(Map<String, dynamic> json) {
//     poliSakit = json['poliSakit'];
//     createdAt = json['createdAt'];
//     createdId = json['createdId'];
//     id = json['id'];
//     hospitalId = json['hospitalId'];
//     kdPoli = json['kdPoli'];
//     nmPoli = json['nmPoli'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['poliSakit'] = poliSakit;
//     data['createdAt'] = createdAt;
//     data['createdId'] = createdId;
//     data['id'] = id;
//     data['hospitalId'] = hospitalId;
//     data['kdPoli'] = kdPoli;
//     data['nmPoli'] = nmPoli;
//     return data;
//   }
// }

// class PrescriptionNeeded {
//   String? label2;
//   String? label;
//   String? medName;
//   String? brandName;
//   String? unit;
//   String? category;
//   String? type;
//   String? dosage;
//   bool? isSetStock;
//   int? sellNormalFee;
//   List<String>? indication;
//   int? stockTotal;
//   String? code;
//   String? id;
//   List<DepotStocks>? depotStocks;
//   int? quantity;

//   PrescriptionNeeded(
//       {this.label2,
//       this.label,
//       this.medName,
//       this.brandName,
//       this.unit,
//       this.category,
//       this.type,
//       this.dosage,
//       this.isSetStock,
//       this.sellNormalFee,
//       this.indication,
//       this.stockTotal,
//       this.code,
//       this.id,
//       this.depotStocks,
//       this.quantity});

//   PrescriptionNeeded.fromJson(Map<String, dynamic> json) {
//     label2 = json['label2'];
//     label = json['label'];
//     medName = json['medName'];
//     brandName = json['brandName'];
//     unit = json['unit'];
//     category = json['category'];
//     type = json['type'];
//     dosage = json['dosage'];
//     isSetStock = json['isSetStock'];
//     sellNormalFee = json['sellNormalFee'];
//     indication = json['indication'].cast<String>();
//     stockTotal = json['stockTotal'];
//     code = json['code'];
//     id = json['id'];
//     if (json['DepotStocks'] != null) {
//       depotStocks = <DepotStocks>[];
//       json['DepotStocks'].forEach((v) {
//         depotStocks!.add(new DepotStocks.fromJson(v));
//       });
//     }
//     quantity = json['quantity'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['label2'] = label2;
//     data['label'] = label;
//     data['medName'] = medName;
//     data['brandName'] = brandName;
//     data['unit'] = unit;
//     data['category'] = category;
//     data['type'] = type;
//     data['dosage'] = dosage;
//     data['isSetStock'] = isSetStock;
//     data['sellNormalFee'] = sellNormalFee;
//     data['indication'] = indication;
//     data['stockTotal'] = stockTotal;
//     data['code'] = code;
//     data['id'] = id;
//     if (depotStocks != null) {
//       data['DepotStocks'] = depotStocks!.map((v) => v.toJson()).toList();
//     }
//     data['quantity'] = quantity;
//     return data;
//   }
// }

// // class DepotStocks {
// //   String? medicineId;
// //   String? hospitalId;
// //   String? medName;
// //   String? name;
// //   String? type;
// //   int? stock;
// //   List<Null>? practiceId;
// //   String? createdAt;
// //   String? updatedAt;
// //   String? createdName;
// //   String? createdId;
// //   String? updatedId;
// //   String? id;

// //   DepotStocks(
// //       {this.medicineId,
// //       this.hospitalId,
// //       this.medName,
// //       this.name,
// //       this.type,
// //       this.stock,
// //       this.practiceId,
// //       this.createdAt,
// //       this.updatedAt,
// //       this.createdName,
// //       this.createdId,
// //       this.updatedId,
// //       this.id});

// //   DepotStocks.fromJson(Map<String, dynamic> json) {
// //     medicineId = json['medicineId'];
// //     hospitalId = json['hospitalId'];
// //     medName = json['medName'];
// //     name = json['name'];
// //     type = json['type'];
// //     stock = json['stock'];
// //     if (json['practiceId'] != null) {
// //       practiceId = <Null>[];
// //       json['practiceId'].forEach((v) {
// //         practiceId!.add(new Null.fromJson(v));
// //       });
// //     }
// //     createdAt = json['createdAt'];
// //     updatedAt = json['updatedAt'];
// //     createdName = json['createdName'];
// //     createdId = json['createdId'];
// //     updatedId = json['updatedId'];
// //     id = json['id'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['medicineId'] = this.medicineId;
// //     data['hospitalId'] = this.hospitalId;
// //     data['medName'] = this.medName;
// //     data['name'] = this.name;
// //     data['type'] = this.type;
// //     data['stock'] = this.stock;
// //     if (this.practiceId != null) {
// //       data['practiceId'] = this.practiceId!.map((v) => v.toJson()).toList();
// //     }
// //     data['createdAt'] = this.createdAt;
// //     data['updatedAt'] = this.updatedAt;
// //     data['createdName'] = this.createdName;
// //     data['createdId'] = this.createdId;
// //     data['updatedId'] = this.updatedId;
// //     data['id'] = this.id;
// //     return data;
// //   }
// // }

// class CommissionPoint {
//   String? doctorName;
//   String? practiceId;
//   int? point;
//   String? nama;
//   String? rs;
//   int? harga;
//   Alamat? alamat;
//   Posisi? posisi;
//   String? telepon;
//   String? pengenal;
//   String? spesialis;
//   String? dokterFkIds;
//   String? rumahSakitId;
//   // List<Senin>? senin;
//   // List<Selasa>? selasa;
//   // List<Rabu>? rabu;
//   // List<Kamis>? kamis;
//   // List<Jumat>? jumat;
//   // List<Sabtu>? sabtu;
//   // List<Minggu>? minggu;
//   int? gender;
//   bool? isVerified;
//   bool? isVisible;
//   int? rekomendasi;
//   String? id;
//   String? slugRs;
//   bool? levelDoctor;
//   Dokters? dokters;
//   List<Halangans>? halangans;
//   String? createdAt;
//   String? kodeDokterBpjs;
//   BpjsResponse? bpjsResponse;
//   String? noKTP;
//   String? practitionerIhsId;

//   CommissionPoint(
//       {this.doctorName,
//       this.practiceId,
//       this.point,
//       this.nama,
//       this.rs,
//       this.harga,
//       this.alamat,
//       this.posisi,
//       this.telepon,
//       this.pengenal,
//       this.spesialis,
//       this.dokterFkIds,
//       this.rumahSakitId,
//       // this.senin,
//       // this.selasa,
//       // this.rabu,
//       // this.kamis,
//       // this.jumat,
//       // this.sabtu,
//       // this.minggu,
//       this.gender,
//       this.isVerified,
//       this.isVisible,
//       this.rekomendasi,
//       this.id,
//       this.slugRs,
//       this.levelDoctor,
//       this.dokters,
//       this.halangans,
//       this.createdAt,
//       this.kodeDokterBpjs,
//       this.bpjsResponse,
//       this.noKTP,
//       this.practitionerIhsId});

//   CommissionPoint.fromJson(Map<String, dynamic> json) {
//     doctorName = json['doctorName'];
//     practiceId = json['practiceId'];
//     point = json['point'];
//     nama = json['nama'];
//     rs = json['rs'];
//     harga = json['harga'];
//     alamat =
//         json['alamat'] != null ? new Alamat.fromJson(json['alamat']) : null;
//     posisi =
//         json['posisi'] != null ? new Posisi.fromJson(json['posisi']) : null;
//     telepon = json['telepon'];
//     pengenal = json['pengenal'];
//     spesialis = json['spesialis'];
//     dokterFkIds = json['dokterFkIds'];
//     rumahSakitId = json['rumahSakitId'];
//     // if (json['senin'] != null) {
//     //   senin = <Senin>[];
//     //   json['senin'].forEach((v) {
//     //     senin!.add(new Senin.fromJson(v));
//     //   });
//     // }
//     // if (json['selasa'] != null) {
//     //   selasa = <Selasa>[];
//     //   json['selasa'].forEach((v) {
//     //     selasa!.add(new Selasa.fromJson(v));
//     //   });
//     // }
//     // if (json['rabu'] != null) {
//     //   rabu = <Rabu>[];
//     //   json['rabu'].forEach((v) {
//     //     rabu!.add(new Rabu.fromJson(v));
//     //   });
//     // }
//     // if (json['kamis'] != null) {
//     //   kamis = <Kamis>[];
//     //   json['kamis'].forEach((v) {
//     //     kamis!.add(new Kamis.fromJson(v));
//     //   });
//     // }
//     // if (json['jumat'] != null) {
//     //   jumat = <Jumat>[];
//     //   json['jumat'].forEach((v) {
//     //     jumat!.add(new Jumat.fromJson(v));
//     //   });
//     // }
//     // if (json['sabtu'] != null) {
//     //   sabtu = <Sabtu>[];
//     //   json['sabtu'].forEach((v) {
//     //     sabtu!.add(new Sabtu.fromJson(v));
//     //   });
//     // }
//     // if (json['minggu'] != null) {
//     //   minggu = <Minggu>[];
//     //   json['minggu'].forEach((v) {
//     //     minggu!.add(new Minggu.fromJson(v));
//     //   });
//     // }
//     gender = json['gender'];
//     isVerified = json['is_verified'];
//     isVisible = json['is_visible'];
//     rekomendasi = json['rekomendasi'];
//     id = json['id'];
//     slugRs = json['slug_rs'];
//     levelDoctor = json['level_doctor'];
//     dokters =
//         json['Dokters'] != null ? new Dokters.fromJson(json['Dokters']) : null;
//     if (json['Halangans'] != null) {
//       halangans = <Halangans>[];
//       json['Halangans'].forEach((v) {
//         halangans!.add(new Halangans.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     kodeDokterBpjs = json['kodeDokterBpjs'];
//     bpjsResponse = json['bpjsResponse'] != null
//         ? new BpjsResponse.fromJson(json['bpjsResponse'])
//         : null;
//     noKTP = json['noKTP'];
//     practitionerIhsId = json['practitionerIhsId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['doctorName'] = doctorName;
//     data['practiceId'] = practiceId;
//     data['point'] = point;
//     data['nama'] = nama;
//     data['rs'] = rs;
//     data['harga'] = harga;
//     if (alamat != null) {
//       data['alamat'] = alamat!.toJson();
//     }
//     if (posisi != null) {
//       data['posisi'] = posisi!.toJson();
//     }
//     data['telepon'] = telepon;
//     data['pengenal'] = pengenal;
//     data['spesialis'] = spesialis;
//     data['dokterFkIds'] = dokterFkIds;
//     data['rumahSakitId'] = rumahSakitId;
//     // if (this.senin != null) {
//     //   data['senin'] = this.senin!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.selasa != null) {
//     //   data['selasa'] = this.selasa!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.rabu != null) {
//     //   data['rabu'] = this.rabu!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.kamis != null) {
//     //   data['kamis'] = this.kamis!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.jumat != null) {
//     //   data['jumat'] = this.jumat!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.sabtu != null) {
//     //   data['sabtu'] = this.sabtu!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.minggu != null) {
//     //   data['minggu'] = this.minggu!.map((v) => v.toJson()).toList();
//     // }
//     data['gender'] = gender;
//     data['is_verified'] = isVerified;
//     data['is_visible'] = isVisible;
//     data['rekomendasi'] = rekomendasi;
//     data['id'] = id;
//     data['slug_rs'] = slugRs;
//     data['level_doctor'] = levelDoctor;
//     if (dokters != null) {
//       data['Dokters'] = dokters!.toJson();
//     }
//     if (halangans != null) {
//       data['Halangans'] = halangans!.map((v) => v.toJson()).toList();
//     }
//     data['createdAt'] = createdAt;
//     data['kodeDokterBpjs'] = kodeDokterBpjs;
//     if (bpjsResponse != null) {
//       data['bpjsResponse'] = bpjsResponse!.toJson();
//     }
//     data['noKTP'] = noKTP;
//     data['practitionerIhsId'] = practitionerIhsId;
//     return data;
//   }
// }

// class Alamat {
//   String? jalan;
//   String? region;
//   String? city;
//   String? district;
//   String? postcode;

//   Alamat({this.jalan, this.region, this.city, this.district, this.postcode});

//   Alamat.fromJson(Map<String, dynamic> json) {
//     jalan = json['jalan'];
//     region = json['region'];
//     city = json['city'];
//     district = json['district'];
//     postcode = json['postcode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['jalan'] = jalan;
//     data['region'] = region;
//     data['city'] = city;
//     data['district'] = district;
//     data['postcode'] = postcode;
//     return data;
//   }
// }

// class Posisi {
//   double? lat;
//   double? lng;

//   Posisi({this.lat, this.lng});

//   Posisi.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lng = json['lng'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lat'] = lat;
//     data['lng'] = lng;
//     return data;
//   }
// }

// class Senin {
//   int? mulai;
//   int? selesai;
//   int? menit;
//   int? totalSlot;
//   int? sisaSlot;
//   String? id;
//   List<String>? tipe;

//   Senin(
//       {this.mulai,
//       this.selesai,
//       this.menit,
//       this.totalSlot,
//       this.sisaSlot,
//       this.id,
//       this.tipe});

//   Senin.fromJson(Map<String, dynamic> json) {
//     mulai = json['mulai'];
//     selesai = json['selesai'];
//     menit = json['menit'];
//     totalSlot = json['total_slot'];
//     sisaSlot = json['sisa_slot'];
//     id = json['id'];
//     tipe = json['tipe'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['mulai'] = mulai;
//     data['selesai'] = selesai;
//     data['menit'] = menit;
//     data['total_slot'] = totalSlot;
//     data['sisa_slot'] = sisaSlot;
//     data['id'] = id;
//     data['tipe'] = tipe;
//     return data;
//   }
// }

// class Dokters {
//   String? gelar;
//   String? telepon;
//   String? email;
//   String? pekerjaan;
//   String? spesialis;
//   String? subSpesialis;
//   String? gambarProfil;
//   int? totalPraktek;
//   bool? isVerified;
//   bool? isShareable;
//   String? slug;
//   List<Registrasi>? registrasi;
//   String? id;
//   // List<RegistrasiSIP>? registrasiSIP;

//   Dokters({
//     this.gelar,
//     this.telepon,
//     this.email,
//     this.pekerjaan,
//     this.spesialis,
//     this.subSpesialis,
//     this.gambarProfil,
//     this.totalPraktek,
//     this.isVerified,
//     this.isShareable,
//     this.slug,
//     this.registrasi,
//     this.id,
//     // this.registrasiSIP,
//   });

//   Dokters.fromJson(Map<String, dynamic> json) {
//     gelar = json['gelar'];
//     telepon = json['telepon'];
//     email = json['email'];
//     pekerjaan = json['pekerjaan'];
//     spesialis = json['spesialis'];
//     subSpesialis = json['sub_spesialis'];
//     gambarProfil = json['gambar_profil'];
//     totalPraktek = json['total_praktek'];
//     isVerified = json['is_verified'];
//     isShareable = json['is_shareable'];
//     slug = json['slug'];
//     if (json['registrasi'] != null) {
//       registrasi = <Registrasi>[];
//       json['registrasi'].forEach((v) {
//         registrasi!.add(new Registrasi.fromJson(v));
//       });
//     }
//     id = json['id'];
//     // if (json['registrasiSIP'] != null) {
//     //   registrasiSIP = <RegistrasiSIP>[];
//     //   json['registrasiSIP'].forEach((v) {
//     //     registrasiSIP!.add(new RegistrasiSIP.fromJson(v));
//     //   });
//     // }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['gelar'] = gelar;
//     data['telepon'] = telepon;
//     data['email'] = email;
//     data['pekerjaan'] = pekerjaan;
//     data['spesialis'] = spesialis;
//     data['sub_spesialis'] = subSpesialis;
//     data['gambar_profil'] = gambarProfil;
//     data['total_praktek'] = totalPraktek;
//     data['is_verified'] = isVerified;
//     data['is_shareable'] = isShareable;
//     data['slug'] = slug;
//     if (registrasi != null) {
//       data['registrasi'] = registrasi!.map((v) => v.toJson()).toList();
//     }
//     data['id'] = id;
//     // if (this.registrasiSIP != null) {
//     //   data['registrasiSIP'] =
//     //       this.registrasiSIP!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }

// class Registrasi {
//   String? nomer;
//   String? lembaga;
//   String? tanggal;
//   String? id;

//   Registrasi({this.nomer, this.lembaga, this.tanggal, this.id});

//   Registrasi.fromJson(Map<String, dynamic> json) {
//     nomer = json['nomer'];
//     lembaga = json['lembaga'];
//     tanggal = json['tanggal'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['nomer'] = nomer;
//     data['lembaga'] = lembaga;
//     data['tanggal'] = tanggal;
//     data['id'] = id;
//     return data;
//   }
// }

// class Halangans {
//   String? praktekFkId;
//   String? startDate;
//   String? endDate;
//   String? reason;
//   String? exchangeId;
//   bool? isExchange;
//   String? rsId;
//   String? id;

//   Halangans(
//       {this.praktekFkId,
//       this.startDate,
//       this.endDate,
//       this.reason,
//       this.exchangeId,
//       this.isExchange,
//       this.rsId,
//       this.id});

//   Halangans.fromJson(Map<String, dynamic> json) {
//     praktekFkId = json['praktekFkId'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     reason = json['reason'];
//     exchangeId = json['exchangeId'];
//     isExchange = json['isExchange'];
//     rsId = json['rs_id'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['praktekFkId'] = praktekFkId;
//     data['start_date'] = startDate;
//     data['end_date'] = endDate;
//     data['reason'] = reason;
//     data['exchangeId'] = exchangeId;
//     data['isExchange'] = isExchange;
//     data['rs_id'] = rsId;
//     data['id'] = id;
//     return data;
//   }
// }

// class BpjsResponse {
//   Metadata? metadata;

//   BpjsResponse({this.metadata});

//   BpjsResponse.fromJson(Map<String, dynamic> json) {
//     metadata = json['metadata'] != null
//         ? new Metadata.fromJson(json['metadata'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (metadata != null) {
//       data['metadata'] = metadata!.toJson();
//     }
//     return data;
//   }
// }

// class Metadata {
//   String? message;
//   int? code;

//   Metadata({this.message, this.code});

//   Metadata.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     code = json['code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = message;
//     data['code'] = code;
//     return data;
//   }
// }
