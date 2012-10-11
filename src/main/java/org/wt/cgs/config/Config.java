package org.wt.cgs.config;

public class Config {
	private int defaultSize = 0;
	private int minPixelPerBit = 0;

	public void setDefaultSize(int size) {
		this.defaultSize = size;
	}

	public int getDefaultSize() {
		return defaultSize;
	}

	public int getMinPixelPerBit() {
		return minPixelPerBit;
	}

	public void setMinPixelPerBit(int minPixelPerBit) {
		this.minPixelPerBit = minPixelPerBit;
	}
}
