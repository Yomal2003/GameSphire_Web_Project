<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Offer</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-gray-800 min-h-screen flex items-center justify-center p-4 text-white">

  <div class="bg-gray-200 shadow-2xl rounded-2xl p-8 w-full max-w-lg">
    <h2 class="text-2xl font-semibold mb-6 flex items-center gap-2 text-gray-800">
      <i class="bi bi-pencil-square text-indigo-600"></i> Update Game Offer
    </h2>

    <form action="offerUpdateServ" method="post">
      <div class="space-y-4 text-lg">
        <div class="mb-3">
          <label class="form-label text-gray-800">
              <i class="bi bi-controller text-indigo-600 me-2"></i> Game Name
          </label>
          <input type="text" name="name" value="${param.name}"
                 class="w-full px-4 py-2 bg-white text-black border border-gray-400 focus:outline-none" readonly>
        </div>

        <div class="mb-3">
          <label class="form-label text-gray-800">
              <i class="bi bi-cash-coin text-green-600 me-2"></i> Current Price
          </label>
          <input type="number" name="cprice" value="${param.cprice}"
                 class="w-full px-4 py-2 bg-white text-black border border-gray-400 focus:outline-none" required>
        </div>

        <div class="mb-3">
          <label class="form-label text-gray-800">
              <i class="bi bi-tag-fill text-red-600 me-2"></i> Offer Price
          </label>
          <input type="number" name="oprice" value="${param.oprice}"
                 class="w-full px-4 py-2 bg-white text-black border border-gray-400 focus:outline-none" required>
        </div>

        <div class="mb-3">
          <label class="form-label text-gray-800">
              <i class="bi bi-calendar-event text-blue-600 me-2"></i> Offer Until
          </label>
          <input type="date" name="date" value="${param.date}"
                 class="w-full px-4 py-2 bg-white text-black border border-gray-400 focus:outline-none" required>
        </div>
      </div>

      <!-- Update Button -->
      <div class="pt-4">
        <button type="submit"
                class="w-full bg-green-600 hover:bg-green-700 text-white font-semibold py-2 rounded-lg shadow transition">
          <i class="bi bi-save-fill mr-2"></i> Update Offer
        </button>
      </div>
    </form>

    <!-- Back Button -->
    <div class="pt-4">
      <a href="offerui.jsp"
         class="block w-full text-center bg-gray-500 hover:bg-gray-600 text-white font-semibold py-2 rounded-lg shadow transition">
        <i class="bi bi-arrow-left-circle mr-2"></i> Back to Offers
      </a>
    </div>
  </div>

</body>
</html>
