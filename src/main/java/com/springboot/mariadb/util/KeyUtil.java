package com.springboot.mariadb.util;

import com.fasterxml.uuid.EthernetAddress;
import com.fasterxml.uuid.Generators;
import com.fasterxml.uuid.impl.TimeBasedGenerator;

public class KeyUtil {
	
	/***	Universally Unique Identifier
	 * 主键生成策略，按照时间进行排序		uuid
	 * @return
	 */
	public static String generatorUUID() {
		
		TimeBasedGenerator timeBasedGenerator = Generators.timeBasedGenerator(EthernetAddress.fromInterface());
		
		return timeBasedGenerator.generate().toString();
		
	}
}
