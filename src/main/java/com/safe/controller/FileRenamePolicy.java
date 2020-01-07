package com.safe.controller;

import java.io.File;
import java.io.IOException;

public class FileRenamePolicy {

	public File rename(File f) { // File f는 원본 파일
		if (createNewFile(f))
			return f; // 생성된 f가 중복되지 않으면 리턴
		String name = f.getName();
		String body = null;
		String ext = null;
		int dot = name.lastIndexOf(".");
		if (dot != -1) { // 확장자가 없을 때
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else { // 확장자가 있을 때
			body = name;
			ext = "";
		}
		int count = 0;

		while (!createNewFile(f) && count < 9999) {
			count++;
			String newName = body + count + ext;
			f = new File(f.getParent(), newName);
		}
		return f;
	}

	private boolean createNewFile(File f) {
		try {
			return f.createNewFile(); // 존재하는 파일이 아니면
		} catch (IOException ignored) {
			return false;
		}
	}

}
