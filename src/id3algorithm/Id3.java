package id3algorithm;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;

public class Id3 {

	static Scanner in = new Scanner(System.in);
	static String[][] table = null;

	public static void main(String[] args) {
		try {
			menu();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ID3_calculation obj = new ID3_calculation(table);
		obj.calculate_class();
		obj.calculate_attribute();
		obj.calculate_entropy();
		obj.information_gain();

		List<Node> node = obj.getNode();
		HashMap<String, Double> information_gain = obj.getInformationGain();
		HashMap<String, String> information_gain_subAttribute = obj.getInformationGain_of_subAttribute();

		Vector attributes = obj.getlistofAttributes();
		GenerateTree tree = new GenerateTree(attributes, node, information_gain, information_gain_subAttribute);
		tree.create_tree();
		tree.Display_attribute();
		tree.display_tree();

	}

	public static void menu() throws FileNotFoundException {

		File files = new File("G:/thesisWorkSpace/Id3project/E-Salary.csv");
		readCSV(files);

		change_numeric_to_name(1);

	}

	public static void change_numeric_to_name(int i) {

		if (i == 2) {

			for (int j = 1; j < table.length; j++) {

				if (table[j][0].equals("Yes")) {
					table[j][0] = "T";
				} else {
					table[j][0] = "F";
				}

				if (table[j][1].equals("Yes")) {
					table[j][1] = "T";
				} else {
					table[j][1] = "F";
				}

				if (table[j][2].equals("Yes")) {
					table[j][2] = "T";
				} else {
					table[j][2] = "F";
				}

				if (table[j][3].equals("Yes")) {
					table[j][3] = "T";
				} else {
					table[j][3] = "F";
				}

				if (table[j][6].equals("Yes")) {
					table[j][6] = "T";
				} else {
					table[j][6] = "F";
				}

				if (table[j][7].equals("Yes")) {
					table[j][7] = "T";
				} else {
					table[j][7] = "F";
				}

			}

		} else {
			System.out.println("Thank You!");
		}

	}

	public static void readCSV(File filename) {

		File csvFile = filename;
		BufferedReader br = null;
		BufferedReader pre_count = null;

		String line = "";
		String cvsSplitBy = ",";

		int row = 0;
		int col = 0;

		try {

			pre_count = new BufferedReader(new FileReader(csvFile));

			pre_count = new BufferedReader(new FileReader(csvFile));
			while ((line = pre_count.readLine()) != null) {

				// use comma as separator
				String[] attributes = line.split(cvsSplitBy);
				col = attributes.length - 1;
				row++;
			}

			// size of table

			table = new String[row][col];

			int rows = 0;

			br = new BufferedReader(new FileReader(csvFile));
			while ((line = br.readLine()) != null) {

				String[] attributes = line.split(cvsSplitBy);

				for (int i = 1; i < col + 1; i++) {
					table[rows][i - 1] = attributes[i];

				}

				rows++;

			}

		} catch (IOException e) {
			System.out.println("File not found Exception");
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					System.out.println("File not found Exception Finally");
				}
			}
		}

	}

}
