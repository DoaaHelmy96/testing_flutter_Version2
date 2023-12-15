import 'package:testing_flutter/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'unit_test.mocks.dart';

@GenerateMocks([Client, DateTime])
void main() {
  group('Testing Procuct', () {
    test('testing the fetchproduct function', () async {
      final client = MyMockClient();
      when(client.get(Uri.parse('https://mystore.com/api/products/123')))
          .thenAnswer((_) async {
        return Response('{"name": "Shirt", "price": 29.99}', 200);
      });
      var x = await fetchProduct('123', client);
      expect(x!.name, "Shirt");
      expect(x!.price, 29.99);
    });
    test('testing isDiscounecting Function', () async {
      final mockDateTime = MockDateTime();
      when(mockDateTime.weekday).thenReturn(DateTime.monday);
      final product = Product(name: 'Test Product', price: 10.0);
      final isDiscounted = product.isDiscounted(mockDateTime);
      expect(isDiscounted, isTrue);
    });
  });
}
