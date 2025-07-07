package net.webapp.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import net.webapp.dao.DBConnection;
import net.webapp.model.offer;

public class offerservices {

	public void addOffer(offer op) {

		try {
			String query = "INSERT INTO offer (gamename, cprice, oprice, adate) VALUES ('" + op.getName() + "', "
					+ op.getCprice() + ", " + op.getOprice() + ", '" + op.getDate() + "')";

			Statement sta = DBConnection.getConnection().createStatement();
			sta.executeUpdate(query);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public ArrayList<offer> getAllOffers() {
		ArrayList<offer> offerList = new ArrayList<>();

		try {
			String query = "SELECT * FROM offer";
			Statement stat = DBConnection.getConnection().createStatement();
			ResultSet rs = stat.executeQuery(query);

			while (rs.next()) {
				offer o = new offer();
				o.setName(rs.getString("gamename"));
				o.setCprice(rs.getInt("cprice"));
				o.setOprice(rs.getInt("oprice"));
				o.setDate(rs.getDate("adate")); // or use getDate if using java.sql.Date
				offerList.add(o);
			}
			return offerList;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public offer getSingleOfferByName(offer os) {

		try {
			String query = "SELECT * FROM offer WHERE gamename = '" + os.getName() + "'";
			Statement stat = DBConnection.getConnection().createStatement();
			ResultSet rs = stat.executeQuery(query);

			if (rs.next()) {

				os.setName(rs.getString("gamename"));
				os.setCprice(rs.getInt("cprice"));
				os.setOprice(rs.getInt("oprice"));
				os.setDate(rs.getDate("adate"));
			}

			return os;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public void updateOffer(offer offer) {
		try {
			String query = "UPDATE offer SET  cprice = " + offer.getCprice() + ", oprice = " + offer.getOprice()+ ", adate = '" + offer.getDate() + "'" + " WHERE gamename = '" + offer.getName() + "'";

			Statement stat = DBConnection.getConnection().createStatement();
			stat.executeUpdate(query);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteoffer(offer os) {
		try {
			String query = "DELETE from offer WHERE gamename = '" + os.getName() + "'";
			Statement stat = DBConnection.getConnection().createStatement();
			stat.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
