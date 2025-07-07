<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Offer Management</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-gray-800 min-h-screen flex items-center justify-center p-4">

  <div class="bg-gray-200 shadow-2xl rounded-2xl p-8 w-full max-w-lg">
    <h2 class="text-2xl font-semibold mb-6 flex items-center gap-2 text-gray-800">
      <i class="bi bi-tags-fill text-indigo-600"></i> Manage Game Offer
    </h2>

    <form  action = "offerManage" method = "post" class="space-y-5">
      
      <!-- Game Name -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">
          <i class="bi bi-controller text-indigo-500 mr-1"></i> Game Name
        </label>
        <input type="text" placeholder="Enter game name" name = "gname" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
      </div>

      <!-- Current Price -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">
          <i class="bi bi-cash-coin text-green-500 mr-1"></i> Current Price ($)
        </label>
        <input type="number" min="0" placeholder="Enter current price" name = "gcp" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-green-500" required>
      </div>

      <!-- Offer Price -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">
          <i class="bi bi-tag-fill text-red-500 mr-1"></i> Offer Price ($)
        </label>
        <input type="number" min="0" placeholder="Enter offer price" name = "gop" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-red-500" required>
      </div>

      <!-- Still Available Date -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">
          <i class="bi bi-calendar-event text-blue-500 mr-1"></i> Offer Available Until
        </label>
        <input type="date" id="availableDate" name = "odate" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required>
      </div>

      <!-- Submit Button -->
      <div class="pt-4">
        <button type="submit"
                class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 rounded-lg shadow transition">
          <i class="bi bi-check-circle-fill mr-2"></i> Save Offer
        </button>
      </div>
      
      
    </form>
  
  <!-- Submit and View Buttons -->
<div class="pt-4 space-y-3">

  <!-- View All Offers Button -->
  <form action = "offerTable" method = "post">
       <button class="block w-full text-center bg-yellow-500 hover:bg-yellow-600 text-white font-semibold py-2 rounded-lg shadow transition">
    <i class="bi bi-eye-fill mr-2"></i> View All Offers</a>
  </form>

</div>
  
  
  </div>

  <script>
    // Set today's date as minimum for the date input
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('availableDate').setAttribute('min', today);
  </script>

</body>
</html>
