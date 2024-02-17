import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:trademale/data/repository/suppliers_repo.dart';

import '../models/suppliers_Model.dart';

class SuppliersController extends GetxController {
  final SuppliersRepo suppliersRepo;

  SuppliersController({required this.suppliersRepo});

  List<dynamic> _suppliersList = [];

  List<dynamic> get suppliersList => _suppliersList;

  List<dynamic> _supplierProducts = [];

  List<dynamic> get supplierProductsList => _supplierProducts;

  bool _sListIsLoaded = false;

  bool get sListIsLoaded => _sListIsLoaded;

  bool _sProductsIsLoaded = false;

  bool get sProductsIsLoaded => _sProductsIsLoaded;

  Future<void> getSuppliersList() async {
    Response response = await suppliersRepo.getSuppliersList();
    if (response.statusCode == 200) {
      print("got suppliers");
      _suppliersList = []; //you have to make it empty to avoid repetition
      _suppliersList.addAll(Suppliers.fromJson(response.body).suppliers);
      _sListIsLoaded = true;
      update(); //is something like setState to update ui
    } else {}
  }

  Future<void> getSupplierDetails(int supplierId) async {
    Response response =
        await suppliersRepo.getSupplierDetails(supplierId.toString());
    if (response.statusCode == 200) {
      print("got supplier details including products");
      // Assuming the response body is the details of a single supplier
      SupplierModel supplierDetails = SupplierModel.fromJson(response.body);
      // If you need to update a specific supplier in the list with its products
      int index =
          _suppliersList.indexWhere((supplier) => supplier.id == supplierId);
      if (index != -1) {
        // print(_suppliersList[index].products);
        _suppliersList[index] = supplierDetails;
        _sProductsIsLoaded = true;
        //print(_suppliersList[index].products);
        update(); // Update UI
      }
    } else {
      // Handle errors
      print("Error fetching supplier details: ${response.statusCode}");
    }
  }
}
