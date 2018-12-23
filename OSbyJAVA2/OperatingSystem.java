import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.File;
import java.util.ArrayList;

public class OperatingSystem {
    private Floppy floppyDisk = new Floppy();

    private void writeFileToFloppy(String fileName) {
        File file = new File(fileName);
        InputStream in = null;

        try {
            in = new FileInputStream(file);
            byte[] buf = new byte[512];
            buf[510] = 0x55;
            buf[511] = (byte) 0xaa;
            if (in.read(buf) != -1) {
                //将内核读入到磁盘第0面，第0柱面，第1个扇区
                floppyDisk.writeFloppy(Floppy.MAGNETIC_HEAD.MAGNETIC_HEAD_0, 0, 1, buf);
            }
        } catch(IOException e) {
            e.printStackTrace();
            return;
        }
    }

    public OperatingSystem(String s) {
        writeFileToFloppy(s);
    }

    public void makeFullopy() {
        // floppyDisk.makeFloppy("system.img"); //test1,打印语句与内核在第一扇区

        // test2,从磁盘读取数据,Floppy.asm //打印语句在第二扇区,内核在第一扇区
        /* String s = "This is a text from cylinder 1 and sector 2";
        floppyDisk.writeFloppy(Floppy.MAGNETIC_HEAD.MAGNETIC_HEAD_0, 1, 2, s.getBytes());
        floppyDisk.makeFloppy("system.img"); */

        // test3,装载器在第一扇区,内核在第二扇区,boot.asm,kernel.asm
        writeFileToFloppy("kernel.bat", false, 1, 2);
        floppyDisk.makeFloppy("system.img");
    }

    public static void main(String[] args) {
        // 将内核写到虚拟软盘中,再写出成磁盘文件
        OperatingSystem op = new OperatingSystem("boot.bat");
        op.makeFllopy();
    }
}