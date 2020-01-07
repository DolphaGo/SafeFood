package com.safe.controller;

import java.util.ArrayList;
import java.util.List;

import com.safe.vo.Food;

public class Algo {
	double ans;
	List<Food> recommendList;
	List<Food> ansList;
	List<Food> alergyList;
	int[] data;
	double min;

	public double calcCal(String active, String height) {
		double act = Double.parseDouble(active);
		double hei = Double.parseDouble(height);
		return act * ((hei - 100) * 0.9);
	}

	public void prod(int n, int r, int flag, int count, double max, double dailyCal, List<Food> list) {
		if (max < ans)
			return;
		if (count == r) {
			if (max > dailyCal)
				return;
			ans = ans < max ? max : ans;
			ansList = new ArrayList<>();
			for (int i = 0; i < data.length; i++) {
				ansList.add(list.get(data[i]));
			}
		}
		for (int i = 0; i < n; i++) {
			if ((flag & 1 << i) == 0) {
				if (max + list.get(i).getCalory() > ans)
					continue;
				data[count] = i;
				prod(i, r, flag | 1 << i, count + 1, max + list.get(i).getCalory(), dailyCal, list);
			}
		}
	}

	public List<Food> recomPlain(List<Food> list, String active, String height) {
		double dailyCal = calcCal(active, height);
		ansList = new ArrayList<>();
		recommendList = new ArrayList<>();
		min = Double.MAX_VALUE;
		dfsPlain(list, 0, dailyCal, 0);
		return recommendList;
	}

	public List<Food> recom(List<Food> list, List<String> alergen, String active, String height) {
		double dailyCal = calcCal(active, height);
		ansList = new ArrayList<>();
		recommendList = new ArrayList<>();
		alergyList = new ArrayList<>();
		min = Double.MAX_VALUE;

		dfs(list, alergen, 0, dailyCal, 0);
		return recommendList;
	}

	double getBestcal() {
		return min;
	}

	void dfsPlain(List<Food> list, double cal, double dailyCal, int v) {
		if (cal >= dailyCal) {
			if (min > cal) {
				recommendList.clear();
				min = cal;
				for (Food f : ansList)
					recommendList.add(f);
			}
			return;
		}
		if (v >= list.size())
			return;
		double curcal = list.get(v).getCalory();
		ansList.add(list.get(v));
		dfsPlain(list, cal + curcal, dailyCal, v + 1);
		ansList.remove(ansList.size() - 1);
		dfsPlain(list, cal, dailyCal, v + 1);
	}

	void dfs(List<Food> list, List<String> alergen, double cal, double dailyCal, int v) {
		if (cal >= dailyCal) {
			if (min > cal) {
				recommendList.clear();
				min = cal;
				for (Food f : ansList)
					recommendList.add(f);
			}
			return;
		}
		if (v >= list.size())
			return;
		boolean flag = true;
		double curcal = list.get(v).getCalory();
		if (list.get(v).getAllergy().length() > 0) {
			String curAllergy[] = list.get(v).getAllergy().split(",");
			for (int i = 0; i < curAllergy.length; i++) {
				String s = curAllergy[i].trim();
				if (alergen.contains(s)) {
					flag = false;
					break;
				}
			}
		}

		if (flag) {
			ansList.add(list.get(v));
			dfs(list, alergen, cal + curcal, dailyCal, v + 1);
			ansList.remove(ansList.size() - 1);
		}
		dfs(list, alergen, cal, dailyCal, v + 1);
	}
}
