/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prcticafs;

/**
 *parte grafica
 * @author edison
 */
import java.awt.FlowLayout;

import javax.swing.*; 
import javax.swing.event.ChangeListener;
import javax.swing.event.ChangeEvent;
import net.sourceforge.jFuzzyLogic.FIS;
import net.sourceforge.jFuzzyLogic.FunctionBlock;

import net.sourceforge.jFuzzyLogic.plot.JDialogFis;
import net.sourceforge.jFuzzyLogic.plot.JFuzzyChart;

public class ControladorDifuso extends javax.swing.JFrame{
   
    private FIS FIS;
    private JDialogFis jDialogFis;
    FunctionBlock functionBlock; 
    private JSlider slTemperatura;
    private JSlider slhumedad;
    double v;
    double v2;
     JFrame f;
      JLabel l1,l2;
    public ControladorDifuso(){
        
        super("Logica Difusa");
        setSize(700,700);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        getContentPane().setLayout(new FlowLayout());
        FIS = FIS.load("logica.fcl");
        functionBlock = FIS.getFunctionBlock(null);
        functionBlock = FIS.getFunctionBlock(null);
        functionBlock.reset();
        l1=new JLabel("control temperatura");  
        l1.setBounds(50,50, 100,30);
        getContentPane().add(l1);
        slTemperatura=new JSlider();
        slTemperatura.setMinimum(1);
        slTemperatura.setMaximum(33);
        slTemperatura.setMajorTickSpacing(2);
        slTemperatura.setMinorTickSpacing(1);
        slTemperatura.setPaintTicks(true);
        slTemperatura.setPaintLabels(true);
        slTemperatura.setBounds(50, 50, 300, 50);
        getContentPane().add(slTemperatura);
        slTemperatura.addChangeListener(new ChangeListener(){
        public void stateChanged(ChangeEvent e){
           
                cargar();
                jDialogFis.repaint();
               
        }
      });
        l2=new JLabel("control Humedad");  
        l2.setBounds(50,100, 100,30);  
        getContentPane().add(l2);
        slhumedad=new JSlider();
        slhumedad.setMinimum(1);
        slhumedad.setMaximum(33);
        slhumedad.setMajorTickSpacing(2);
        slhumedad.setMinorTickSpacing(1);
        slhumedad.setPaintTicks(true);
        slhumedad.setPaintLabels(true);
        slhumedad.setBounds(50, 50, 300, 50);
        getContentPane().add(slhumedad);
        slhumedad.addChangeListener(new ChangeListener(){
        public void stateChanged(ChangeEvent e){
         
           
                cargar();
                jDialogFis.repaint();
               
           
        }
      });
  
   
    }
    public boolean cargar() {
      // try {   
         functionBlock.getVariable("niveltemperatura").setValue(slhumedad.getValue());
         functionBlock.getVariable("nivelhumedad").setValue(slTemperatura.getValue());
         functionBlock.evaluate();
        jDialogFis = new net.sourceforge.jFuzzyLogic.plot.JDialogFis(FIS);
        JFuzzyChart.get().chart(FIS.getFunctionBlock(null).getVariable("nivelrpm"),FIS.getFunctionBlock(null).getVariable("nivelrpm").getDefuzzifier(),false);
        //jDialogFis.repaint();
        //Thread.sleep(100);
        //} catch (NullPointerException ex) {
              //  Logger.getLogger(ControladorDifuso.class.getName()).log(Level.SEVERE, null, ex);
        //}
          return true;
    }
    public static void main(String[] args) {
        new ControladorDifuso().setVisible(true);
    }
}
