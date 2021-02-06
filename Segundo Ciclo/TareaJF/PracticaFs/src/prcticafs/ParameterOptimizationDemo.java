/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prcticafs;

import java.util.logging.Level;
import java.util.logging.Logger;
import net.sourceforge.jFuzzyLogic.FIS;
import net.sourceforge.jFuzzyLogic.FunctionBlock;
import net.sourceforge.jFuzzyLogic.plot.JFuzzyChart;
/**
 * clase ejempo para cargar datos 
 * @author edison
 */
public class ParameterOptimizationDemo {
/**
 * 
 * @param args 
 */
    public static void main(String[] args) {
        try {
            FIS fis = FIS.load("logica.fcl");

            FunctionBlock functionBlock = fis.getFunctionBlock(null);
            functionBlock.reset();
            functionBlock.getVariable("niveltemperatura").setValue(18);
            functionBlock.getVariable("nivelhumedad").setValue(22);
            functionBlock.evaluate();
            JFuzzyChart.get().chart(functionBlock);
            //jDialogFis.repaint();
            //Thread.sleep(100);
        } catch (Exception ex) {
            Logger.getLogger(ControladorDifuso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
