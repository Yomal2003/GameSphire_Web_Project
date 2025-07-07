<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Offer</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-gray-900 min-h-screen flex items-center justify-center p-4 text-white">

  <div class="bg-gray-800 shadow-2xl rounded-2xl p-8 w-full max-w-xl">
    <h2 class="text-2xl font-bold mb-6 text-center text-indigo-400">
      Offer Details
    </h2>
    <c:set var="offer" value="${of2}" />
    <div class="space-y-4 text-lg">
      <div class="mb-3">
    <label class="form-label text-white">
        <i class="bi bi-controller text-indigo-300 me-2"></i> Game Name
    </label>
    <input type="text" class="w-full px-4 py-2 bg-gray-200 text-black border border-gray-400 focus:outline-none" name="name" value="${offer.name}" placeholder="Game Name">
</div>

<div class="mb-3">
    <label class="form-label text-white">
        <i class="bi bi-cash-coin text-green-300 me-2"></i> Current Price
    </label>
    <input type="number" class="w-full px-4 py-2 bg-gray-200 text-black border border-gray-400 focus:outline-none" name="cprice" value="${offer.cprice}" placeholder="Current Price">
</div>

<div class="mb-3">
    <label class="form-label text-white">
        <i class="bi bi-tag-fill text-red-300 me-2"></i> Offer Price
    </label>
    <input type="number" class="w-full px-4 py-2 bg-gray-200 text-black border border-gray-400 focus:outline-none" name="oprice" value="${offer.oprice}" placeholder="Offer Price">
</div>

<div class="mb-3">
    <label class="form-label text-white">
        <i class="bi bi-calendar-event text-blue-300 me-2"></i> Offer Until
    </label>
    <input type="date"class="w-full px-4 py-2 bg-gray-200 text-black border border-gray-400 focus:outline-none" name="date" value="${offer.date}" placeholder="Offer Date">
</div>

    </div>

    <!-- Buttons -->
    <div class="mt-8 flex justify-between gap-4">
      <!-- Edit Offer button -->
      <form action="offerUpdate.jsp" method="post">
        <input type="hidden" name="name" value="${offer.name}">
        <input type="hidden" name="cprice" value="${offer.cprice}">
        <input type="hidden" name="oprice" value="${offer.oprice}">
        <input type="hidden" name="date" value="${offer.date}">
        <button type="submit"
                class="flex-1 bg-yellow-500 hover:bg-yellow-600 text-white font-semibold py-2 rounded-lg shadow">
          <i class="bi bi-pencil-fill mr-2"></i> Edit Offer
        </button>
      </form>

      <!-- Back to Offers -->
      <a href="offerTable"
         class="flex-1 text-center bg-gray-600 hover:bg-gray-700 text-white font-semibold py-2 rounded-lg shadow">
        <i class="bi bi-arrow-left-circle mr-2"></i> Back to Manage Offers
      </a>
    </div>
  </div>

</body>
</html>
