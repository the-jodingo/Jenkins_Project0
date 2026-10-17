/* Pizza Shop - Interactive Ordering Script */

let cart = [];

// Pizza menu data
const MENU = [
    { name: "Cheese Margherita", price: 12.99, emoji: "🧀" },
    { name: "Pepperoni Classic", price: 16.99, emoji: "🌶️" },
    { name: "Veggie Delight", price: 14.50, emoji: "🥦" }
];

/**
 * Add a pizza to the cart
 * @param {string} name - Pizza name
 * @param {number} price - Pizza price
 */
function addToCart(name, price) {
    const existing = cart.find(item => item.name === name);
    if (existing) {
        existing.qty += 1;
    } else {
        cart.push({ name: name, price: price, qty: 1 });
    }
    renderCart();

    // Visual feedback
    const btn = event.target;
    btn.textContent = "✓ Added!";
    btn.classList.add("cart-item-added");
    setTimeout(() => {
        btn.textContent = "Add to Cart";
        btn.classList.remove("cart-item-added");
    }, 800);
}

/**
 * Render the shopping cart table
 */
function renderCart() {
    const tbody = document.getElementById("order-table-body");
    const totalEl = document.getElementById("order-total");

    if (cart.length === 0) {
        tbody.innerHTML = `
            <tr>
                <td colspan="4" class="text-center text-muted py-4">
                    Your cart is empty. Add some pizzas!
                </td>
            </tr>
        `;
        totalEl.textContent = "$0.00";
        return;
    }

    let html = "";
    let total = 0;

    cart.forEach(item => {
        const itemTotal = item.price * item.qty;
        total += itemTotal;
        html += `
            <tr>
                <td>${item.name}</td>
                <td class="text-center">${item.qty}</td>
                <td class="text-end">$${item.price.toFixed(2)}</td>
                <td class="text-end">$${itemTotal.toFixed(2)}</td>
            </tr>
        `;
    });

    tbody.innerHTML = html;
    totalEl.textContent = `$${total.toFixed(2)}`;
}

/**
 * Place the order — show confirmation
 */
function placeOrder() {
    if (cart.length === 0) {
        alert("Your cart is empty! Add some pizzas first. 🍕");
        return;
    }

    let orderDetails = "Order Summary:\n\n";
    let total = 0;
    cart.forEach(item => {
        const itemTotal = item.price * item.qty;
        orderDetails += `${item.name} x${item.qty} = $${itemTotal.toFixed(2)}\n`;
        total += itemTotal;
    });
    orderDetails += `\nTotal: $${total.toFixed(2)}`;
    orderDetails += "\n\nThank you for your order! Your pizza will be ready in 30-45 minutes. 🍕";

    alert(orderDetails);

    // Reset cart
    cart = [];
    renderCart();
}

/**
 * Load pizza menu from API on page load
 */
document.addEventListener("DOMContentLoaded", function() {
    // Fetch from the servlet API
    fetch("/api/pizzas")
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            // Fallback to local menu if API not available
            return { menu: MENU, shopName: "Pizza Shop" };
        })
        .then(data => {
            console.log("Menu loaded from API:", data.shopName);
        })
        .catch(() => {
            console.log("Using local menu fallback");
        });

    renderCart();
});
