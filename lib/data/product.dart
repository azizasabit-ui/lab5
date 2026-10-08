import '../models/product.dart';

const List<Product> products = [
  Product(
    id: 'P001',
    name: 'Dewy Skin Serum',
    category: 'Skincare',
    price: 4500,
    rating: 4.8,
    imageUrl:
        'https://images.unsplash.com/photo-1612817288484-6f916006741a?auto=format&fit=crop&w=900&q=80',
    tags: [
      'Skincare',
      'Serum',
      'Niacinamide',
    ],
    description:
        'A lightweight serum that helps improve skin hydration '
        'and gives the face a fresh and healthy glow.',
  ),

  Product(
    id: 'P002',
    name: 'Velvet Lip Tint',
    category: 'Makeup',
    price: 3200,
    rating: 4.7,
    imageUrl:
        'https://images.unsplash.com/photo-1586495777744-4413f21062fa?auto=format&fit=crop&w=900&q=80',
    tags: [
      'Makeup',
      'Lips',
      'Tint',
    ],
    description:
        'A soft and long-lasting lip tint with a comfortable '
        'velvet finish for everyday makeup.',
  ),

  Product(
    id: 'P003',
    name: 'Daily Glow Cream',
    category: 'Skincare',
    price: 5200,
    rating: 4.9,
    imageUrl:
        'https://images.unsplash.com/photo-1556228578-0d85b1a4d571?auto=format&fit=crop&w=900&q=80',
    tags: [
      'Skincare',
      'Cream',
      'Glow',
    ],
    description:
        'A moisturizing daily cream designed to keep your skin '
        'soft, smooth and naturally glowing.',
  ),

  Product(
    id: 'P004',
    name: 'Silk Hair Mask',
    category: 'Haircare',
    price: 4100,
    rating: 4.6,
    imageUrl:
        'https://images.unsplash.com/photo-1522338242992-e1a54906a8da?auto=format&fit=crop&w=900&q=80',
    tags: [
      'Haircare',
      'Mask',
      'Repair',
    ],
    description:
        'A nourishing hair mask that helps make dry hair softer, '
        'smoother and easier to manage.',
  ),
];