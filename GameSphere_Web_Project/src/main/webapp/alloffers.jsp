<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>All Game Offers</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen p-6">

  <div class="max-w-6xl mx-auto bg-white shadow-md rounded-xl p-8">
    <h2 class="text-3xl font-bold text-center text-indigo-600 mb-6">
      All Game Offers
    </h2>

    <div class="overflow-x-auto">
      <table class="min-w-full border border-gray-300 rounded-lg">
        <thead class="bg-gray-800 text-white">
          <tr>
            <th class="py-3 px-4 text-left">Game Name</th>
            <th class="py-3 px-4 text-left">Current Price ($)</th>
            <th class="py-3 px-4 text-left">Offer Price ($)</th>
            <th class="py-3 px-4 text-left">Available Until</th>
            <th class="py-3 px-4 text-left">Action</th>
          </tr>
        </thead>
        <tbody class="text-gray-700 bg-white">
          <c:forEach var="cus" items="${list1}">

           <tr class="border-t border-gray-200">
           <td class="py-3 px-4">${cus.name}</td>
           <td class="py-3 px-4">$${cus.cprice}</td>
           <td class="py-3 px-4">$${cus.oprice}</td>
           <td class="py-3 px-4">${cus.date}</td>
            <td class="py-3 px-4">
              <div class="flex space-x-2">
          <form action="singleOffer" method="post">
           <input type  = "hidden"  name = "name" value ="${cus.name}">
            <button type="submit" title="Edit" class="text-blue-600 hover:text-blue-800">
              <i class="bi bi-pencil-square text-xl"></i>
            </button>
          </form>
          <form action="offerdelete" method="post">
            <input type="hidden" name="name" value="${cus.name}">
            <button type="submit" title="Delete" class="text-red-600 hover:text-red-800">
              <i class="bi bi-trash-fill text-xl"></i>
            </button>
          </form>
        </div>
            </td>
          </tr>
  </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="text-center mt-6 space-x-4">
      <a href="offerui.jsp" class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 py-2 rounded-lg transition shadow">
        ← Back to Offer Form
      </a>
     
      <a href="validateUser" class="bg-green-500 hover:bg-green-600 text-white px-6 py-2 rounded-lg transition shadow">
        Go to Admin Portal →
      </a>
    </div>
  </div>

</body>
</html>