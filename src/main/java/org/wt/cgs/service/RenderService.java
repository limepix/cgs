package org.wt.cgs.service;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wt.cgs.config.Config;

import ar.com.hjg.pngj.ImageInfo;
import ar.com.hjg.pngj.ImageLine;
import ar.com.hjg.pngj.ImageLineHelper;
import ar.com.hjg.pngj.PngWriter;
import ar.com.hjg.pngj.chunks.PngChunkTextVar;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@Service
public class RenderService {
	
	private static final Logger logger = LoggerFactory.getLogger(RenderService.class);
	
	@Autowired
	private Config config;
	
	private QRCodeWriter qrcodeWriter = new QRCodeWriter();
	private final BarcodeFormat FORMAT = BarcodeFormat.QR_CODE;
	
	public RenderService(){
		logger.info("initializing RenderService");
	}
	
	private final double BLACK = 0.0;
	private final double WHITE = 1.0;
	
	public void renderQrCode(String text, int size, HttpServletResponse response){		
		ServletOutputStream os = null;
		
		try{
			os = response.getOutputStream();
		}
		catch(IOException ex){
			logger.error("cannot get outputstream");
			logger.error(ex.getMessage());
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		
		response.setContentType("image/png");
		
	    try {
			renderPng(text, size, os);
		} catch (WriterException ex) {
			logger.error("error during png generation");
			logger.error(ex.getMessage());
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
	}
	
	private void renderPng(String data, int requestedSize, ServletOutputStream outputStream) throws WriterException {
	    int size = calculateMatrixSize(data);
	    BitMatrix matrix = qrcodeWriter.encode(data, FORMAT, size, size);
	    renderMatrix(matrix, requestedSize, outputStream);
	}
	
	private int calculateMatrixSize(String data) {
	    int length = data.length();
	    double sqr = Math.sqrt(length);
	    int size = (int) Math.round(sqr + 0.5);
	    return size;
	}
	
	private void renderMatrix(BitMatrix matrix, int size, ServletOutputStream outputStream) {
	    int cols = matrix.getWidth();	    
	    int qrSize = 0;	    
	    int scale  = config.getMinPixelPerBit();	    
	    int iS = scale;
	    int border;
	    
	    //Hier wird nun die maximal mögliche Skalierung für den QR Code ermittelt
	    //Der Rest der dann noch übrig bleibt, wird mit WHITE Pixeln aufgefüllt.
	    while(true){
	    	iS++;
	    	if(iS%2!=0) continue; //es werden keine ungeraden Skalierungen 
	    						  //genommen -> Das führt zu Verzerrungen!
	    	if(iS * cols > size)
	    		break;
	    	else
	    		scale = iS;
	    }
	    
	    qrSize = scale * cols;

	    logger.debug("requested size:             " + size);
	    
	    //Mindesgröße festsetzen! minPixelPerBit muss sicher gestellt werden!
	    // -> ACHTUNG: Dadurch kann das Bild größer werden, als der User möchte!
	    if(size < qrSize){
	    	size = qrSize;
	    }
	    
	    border = (size - qrSize) / 2;
	    
	    logger.debug("png will have this size:    " + size + " (if this is higher than the requested size, there is too much information in the qr code, so the size has to be increased for all information to fit in)");
	    logger.debug("size of qr-matrix:          " + cols);
	    logger.debug("max. possible scale factor: " + scale);
	    logger.debug("qrSize:                     " + qrSize);
	    logger.debug("borderLeft, borderTop:      " + border);

	    ImageInfo imageInfo = new ImageInfo(size, size, 8, false, true, false);
	    PngWriter png = new PngWriter((ServletOutputStream) outputStream, imageInfo);
	    
	    png.getMetadata().setText(PngChunkTextVar.KEY_Author, "Juergen Binder");
	    png.getMetadata().setText(PngChunkTextVar.KEY_Title, "QRCode");
	    png.getMetadata().setText(PngChunkTextVar.KEY_Software, "wt-cgs");
	    png.getMetadata().setText(PngChunkTextVar.KEY_Comment, "Verwendet ZXing (http://code.google.com/p/zxing/) und pngj (http://code.google.com/p/pngj/)");
	   	    
	    ImageLine line = new ImageLine(png.imgInfo);
	    int channels = png.imgInfo.channels;
	    
	    for (int i = 0; i < size; i++) {
	    	line.incRown();
	    	
	    	if(i < border){
	    		//oberer Rand - wird mit WHITE gefüllt
	    		for (int j = 0; j < size; j++) {
		    		ImageLineHelper.setValD(line, (j * channels), WHITE);
		    	}
	    	}	    	
	    	else if(i < qrSize + border){
	    		int y = (i - border) / scale;
		    	
		    	for (int j = 0; j < size; j++) {
		    		if(j < border){
		    			//linker Rand - wird mit WHITE gefüllt
		    			ImageLineHelper.setValD(line, (j * channels), WHITE);
		    		}		    		
		    		else if(j < qrSize + border){
		    			int x = (j - border) / scale;
			    		
			    		double color = BLACK;
			    		if (matrix.get(x, y) == false) {
			    			color = WHITE;
			    		}
			        
			    		ImageLineHelper.setValD(line, (j * channels), color);
		    		}
		    		else{
		    			//rechter Rand - wird mit WHITE gefüllt
		    			ImageLineHelper.setValD(line, (j * channels), WHITE);
		    		}		    		
		    	}
	    	}
	    	else{
	    		//unterer Rand - wird mit WHITE gefüllt
	    		for (int j = 0; j < size; j++) {
		    		ImageLineHelper.setValD(line, (j * channels), WHITE);
		    	}		    	
	    	}	    	
	    	png.writeRow(line, i);
	    }
	    png.end();
	  }
}
