import 'package:flutter/material.dart';
import '../widgets/product_action_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {
  bool isBookmarked = false;
  int cartCount = 0;

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void addToCart() {
    setState(() {
      cartCount++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),

      // Sticky bottom action bar
      bottomNavigationBar: ProductActionBar(
        onAddToCart: addToCart,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 900,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        constraints.maxWidth < 600 ? 16 : 32,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      // Product image with bookmark overlay
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: constraints.maxWidth < 600
                                ? 280
                                : 420,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                            top: 16,
                            right: 16,
                            child: Material(
                              color: Colors.white,
                              shape: const CircleBorder(),
                              child: IconButton(
                                onPressed: toggleBookmark,
                                icon: Icon(
                                  isBookmarked
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: isBookmarked
                                      ? Colors.blue
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Product title + rating
                      Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'Premium Running Sneakers',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Price
                      Row(
                        children: [
                          Text(
                            '\$129.99',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '\$159.99',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                              decoration:
                                  TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Category badges
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          Chip(
                            avatar: Icon(
                              Icons.directions_run,
                              size: 18,
                            ),
                            label: Text('Running'),
                          ),
                          Chip(
                            label: Text('Sports'),
                          ),
                          Chip(
                            label: Text('Men'),
                          ),
                          Chip(
                            label: Text('Premium'),
                          ),
                          Chip(
                            label: Text('New'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'About this product',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'Premium running sneakers designed '
                        'for comfort and everyday performance. '
                        'The lightweight construction provides '
                        'excellent support during workouts, '
                        'running and daily activities.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Cart counter
                      if (cartCount > 0)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Items in cart: $cartCount',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}