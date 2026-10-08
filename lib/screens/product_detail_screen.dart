import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {
  bool isFavorite = false;
  bool addedToCart = false;

  @override
  Widget build(BuildContext context) {
    final Product product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 800,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    110,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      // IMAGE + FAVORITE BUTTON
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(24),
                              child: Image.network(
                                product.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (
                                  context,
                                  error,
                                  stackTrace,
                                ) {
                                  return Container(
                                    color:
                                        const Color(0xFFFCE4EC),
                                    child: const Center(
                                      child: Icon(
                                        Icons.spa,
                                        size: 100,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          Positioned(
                            top: 14,
                            right: 14,
                            child: Material(
                              color: Colors.white,
                              shape: const CircleBorder(),
                              elevation: 3,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavorite =
                                        !isFavorite;
                                  });
                                },
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                ),
                                color: isFavorite
                                    ? Colors.pink
                                    : Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // TITLE + RATING
                      Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              product.name,
                              maxLines: 3,
                              overflow:
                                  TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xFFFFF3CD),
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize:
                                  MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  product.rating
                                      .toString(),
                                  style: const TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      // PRICE
                      Text(
                        '${product.price.toStringAsFixed(0)} ₸',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 18),

                      // CATEGORY BADGES
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: product.tags.map((tag) {
                          return Chip(
                            label: Text(tag),
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 6,
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 26),

                      const Text(
                        'About this product',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        product.description,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // PRODUCT INFO
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDF5F7),
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            _InfoRow(
                              title: 'Category',
                              value: product.category,
                            ),
                            const Divider(),
                            _InfoRow(
                              title: 'Rating',
                              value:
                                  '${product.rating} / 5.0',
                            ),
                            const Divider(),
                            const _InfoRow(
                              title: 'Delivery',
                              value: '1–3 days',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),

      // STICKY BOTTOM ACTION BAR
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addedToCart = !addedToCart;
                      });

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                            addedToCart
                                ? '${product.name} added to cart'
                                : '${product.name} removed from cart',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      addedToCart
                          ? 'Added to Cart ✓'
                          : 'Add to Cart',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const _InfoRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}