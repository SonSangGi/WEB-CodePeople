package com.jhta.cope.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.digest.DigestUtils;

public class Test {

	public static void main(String[] args) {
		String a = "zxcv1234";
		
		String b = DigestUtils.sha256Hex(a);
		System.out.println(b);
	}
}
