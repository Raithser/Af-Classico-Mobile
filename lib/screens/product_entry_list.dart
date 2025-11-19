import 'package:flutter/material.dart';
import 'package:af_classico_mobile/models/product_entry.dart';
import 'package:af_classico_mobile/widgets/left_drawer.dart';
import 'package:af_classico_mobile/screens/product_detail.dart';
import 'package:af_classico_mobile/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
  try {
    print("=== DEBUG FETCH PRODUCT ===");
    print("User logged in: ${request.loggedIn}");
    
    // **SOLUSI: Gunakan endpoint utama dan filter di Flutter**
    final response = await request.get('http://localhost:8000/json/user/');
    
    print("Total products from server: ${response.length}");
    print("Raw response: $response");
    
    // Dapatkan info user yang login
    final userResponse = await request.get('http://localhost:8000/auth/user/');
    final currentUserId = userResponse['id'];
    final currentUsername = userResponse['username'];
    
    print("Current user - ID: $currentUserId, Username: $currentUsername");
    
    // Filter hanya produk milik user yang login
    List<ProductEntry> listProduct = [];
    for (var d in response) {
      if (d != null) {
        print("Product data: $d");
        print("Product user_id: ${d['user_id']}, type: ${d['user_id'].runtimeType}");
        print("Current user_id: $currentUserId, type: ${currentUserId.runtimeType}");
        
        // Debug: Tampilkan semua produk dulu
        var product = ProductEntry.fromJson(d);
        listProduct.add(product);
        
        // // Filter nanti setelah debug
        // if (d['user_id'] == currentUserId) {
        //   listProduct.add(product);
        // }
      }
    }
    
    print("All products count: ${listProduct.length}");
    return listProduct;
    
  } catch (e) {
    print("Error fetching products: $e");
    return [];
  }
}
  

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    // Cek jika user belum login
    if (!request.loggedIn) {
      return Scaffold(
        appBar: AppBar(title: const Text('My Products')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'Please login to view your products',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inventory_2, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No products yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    'Create your first product!',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ProductEntryCard(
                product: snapshot.data![index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}