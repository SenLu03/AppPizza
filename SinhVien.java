package Buoi4.Bai3;

import java.util.Scanner;

public class SinhVien {
    private String maSinhVien;
    private String hoTen;
    private double diemToan;
    private double diemLy;
    private double diemHoa;
    public Scanner input = new Scanner(System.in);

    SinhVien(){}

    SinhVien(String maSinhVien, String hoTen, double diemToan, double diemLy, double diemHoa){
        this.maSinhVien = maSinhVien;
        this.hoTen = hoTen;
        this.diemToan = diemToan;
        this.diemLy = diemLy;
        this.diemHoa = diemHoa;
    }

    public String getMaSinhVien() {
        return maSinhVien;
    }

    public void setMaSinhVien(String maSinhVien) {
        this.maSinhVien = maSinhVien;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public double getDiemToan() {
        return diemToan;
    }

    public void setDiemToan(double diemToan) {
        this.diemToan = diemToan;
    }

    public double getDiemLy() {
        return diemLy;
    }

    public void setDiemLy(double diemLy) {
        this.diemLy = diemLy;
    }

    public double getDiemHoa() {
        return diemHoa;
    }

    public void setDiemHoa(double diemHoa) {
        this.diemHoa = diemHoa;
    }
    public void nhap() {
        System.out.println("Nhập thông tin sinh viên:");
        System.out.print("Nhập mã sinh viên: ");
        maSinhVien = input.nextLine();
        System.out.print("Nhập họ tên: ");
        hoTen = input.nextLine();
        System.out.print("Nhập điểm toán: ");
        double temp;
        temp = input.nextInt();
        diemToan = (temp >= 0 && temp <= 10) ? temp : (temp < 0 ? 0 : 10);
        System.out.print("Nhập điểm lý: ");
        temp = input.nextInt();
        diemLy = (temp >= 0 && temp <= 10) ? temp : (temp < 0 ? 0 : 10);
        System.out.print("Nhập điểm hóa: ");
        temp = input.nextInt();
        diemHoa = (temp >= 0 && temp <= 10) ? temp : (temp < 0 ? 0 : 10);
    }

    public void xuat() {
        System.out.printf("%-15s%-30s%-10s%-10s%-10s\n", maSinhVien, hoTen, diemToan, diemLy, diemHoa);
    }
}