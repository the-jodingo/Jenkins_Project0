<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pizza Shop - Fresh Pizzas Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <!-- Header -->
    <header class="pizza-header text-center text-white py-5 position-relative overflow-hidden">
        <div class="pizza-pattern-overlay"></div>
        <div class="container position-relative">
            <h1 class="pizza-logo display-1 fw-bold mb-3">🍕 Pizza Shop</h1>
            <p class="lead fs-4">Fresh Pizzas Delivered to Your Door</p>
            <p class="fs-6 opacity-90">Hand-tossed dough &bull; Premium ingredients &bull; Wood-fired oven</p>
        </div>
    </header>

    <!-- Menu Section -->
    <main class="container my-5">

        <!-- Pizza Cards -->
        <div class="row g-4 mb-5" id="pizza-menu">
            <div class="col-md-4">
                <div class="card h-100 pizza-card border-0 shadow-lg overflow-hidden" data-pizza="Cheese Margherita" data-price="12.99">
                    <div class="pizza-card-img text-center py-4 bg-light">🧀</div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title fw-bold">Cheese Margherita</h5>
                        <p class="card-text text-muted flex-grow-1">Classic Italian cheese pizza with fresh mozzarella and San Marzano tomatoes.</p>
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <span class="price fw-bold fs-4 text-danger">$12.99</span>
                        </div>
                        <button class="btn btn-outline-danger mt-auto fw-bold" onclick="addToCart('Cheese Margherita', 12.99)">
                            Add to Cart
                        </button>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 pizza-card border-0 shadow-lg overflow-hidden" data-pizza="Pepperoni Classic" data-price="16.99">
                    <div class="pizza-card-img text-center py-4 bg-light">🌶️</div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title fw-bold">Pepperoni Classic</h5>
                        <p class="card-text text-muted flex-grow-1">Savory pepperoni pizza with extra cheese and crispy crust.</p>
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <span class="price fw-bold fs-4 text-danger">$16.99</span>
                        </div>
                        <button class="btn btn-outline-danger mt-auto fw-bold" onclick="addToCart('Pepperoni Classic', 16.99)">
                            Add to Cart
                        </button>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 pizza-card border-0 shadow-lg overflow-hidden" data-pizza="Veggie Delight" data-price="14.50">
                    <div class="pizza-card-img text-center py-4 bg-light">🥦</div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title fw-bold">Veggie Delight</h5>
                        <p class="card-text text-muted flex-grow-1">Fresh vegetables, bell peppers, olives, and mozzarella.</p>
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <span class="price fw-bold fs-4 text-danger">$14.50</span>
                        </div>
                        <button class="btn btn-outline-danger mt-auto fw-bold" onclick="addToCart('Veggie Delight', 14.50)">
                            Add to Cart
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Order & About Sections -->
        <div class="row g-4">

            <!-- Order Summary -->
            <div class="col-lg-5">
                <div class="card shadow-lg border-0 h-100">
                    <div class="card-header bg-danger text-white fw-bold py-3">🛒 Your Order</div>
                    <div class="card-body">
                        <div id="order-summary" class="table-responsive">
                            <table class="table table-hover align-middle">
                                <thead class="table-light">
                                    <tr>
                                        <th>Item</th>
                                        <th class="text-center">Qty</th>
                                        <th class="text-end">Price</th>
                                        <th class="text-end">Total</th>
                                    </tr>
                                </thead>
                                <tbody id="order-table-body">
                                    <tr>
                                        <td colspan="4" class="text-center text-muted py-4">
                                            Your cart is empty. Add some pizzas!
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="border-top pt-3 mt-3">
                            <div class="d-flex justify-content-between fw-bold fs-5">
                                <span>Total:</span>
                                <span class="text-danger" id="order-total">$0.00</span>
                            </div>
                        </div>

                        <button class="btn btn-danger w-100 py-3 fw-bold fs-5 mt-3" onclick="placeOrder()">
                            ✅ Place Order
                        </button>
                    </div>
                </div>
            </div>

            <!-- About Section -->
            <div class="col-lg-7">
                <div class="card shadow-lg border-0 h-100">
                    <div class="card-header bg-warning text-dark fw-bold py-3">📍 About Our Pizzeria</div>
                    <div class="card-body">
                        <p class="lead">Welcome to Pizza Shop — where every pizza is made with love and fresh ingredients.</p>
                        <p>We hand-stretch our dough daily using locally-sourced flour, top it with premium Italian cheeses, fresh vegetables, and the finest meats. Every pizza goes into our wood-fired oven at 450&deg;F for that perfect char.</p>

                        <div class="row text-center my-4">
                            <div class="col-4">
                                <div class="fs-2 mb-1">⏱️</div>
                                <div class="fw-bold">30-45 mins</div>
                                <small class="text-muted">Delivery</small>
                            </div>
                            <div class="col-4">
                                <div class="fs-2 mb-1">🌟</div>
                                <div class="fw-bold">4.9/5</div>
                                <small class="text-muted">Rating</small>
                            </div>
                            <div class="col-4">
                                <div class="fs-2 mb-1">🚚</div>
                                <div class="fw-bold">Free</div>
                                <small class="text-muted">Delivery</small>
                            </div>
                        </div>

                        <div class="bg-light p-3 rounded">
                            <h6 class="fw-bold mb-2">📍 Store Hours</h6>
                            <ul class="list-unstyled small mb-0">
                                <li><strong>Mon-Fri:</strong> 11:00 AM - 10:00 PM</li>
                                <li><strong>Sat:</strong> 12:00 PM - 11:00 PM</li>
                                <li><strong>Sun:</strong> 12:00 PM - 9:00 PM</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4 mt-5">
        <div class="container">
            <p class="mb-0">&copy; 2026 Pizza Shop. All rights reserved.</p>
            <small class="text-muted">123 Pizza Street, New York, NY 10001</small>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="script.js"></script>
</body>
</html>
