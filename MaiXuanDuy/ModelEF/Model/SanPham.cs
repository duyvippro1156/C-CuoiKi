namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]

        [Key]
        [Display(Name = "Mã sản phẩm")]
        public int MaSP { get; set; }
        [Display(Name = "Tên loại sản phẩm")]
        public int MaLoaiSP { get; set; }
        [Display(Name = "Tên thương hiệu")]
        public int MaThuongHieu { get; set; }

        [Required]
        [StringLength(500)]
        [Display(Name = "Tên sản phẩm")]
        public string TenSP { get; set; }
        [Display(Name = "Mô tả")]
        public string ThongSoKyTHuat { get; set; }

        [Column(TypeName = "money")]
        [Display(Name = "Đơn giá")]
        public decimal Gia { get; set; }
        [Display(Name = "Chiết khấu")]
        public int Discount { get; set; }
        [Display(Name = "Số lượng")]
        public int? SoLuongSP { get; set; }
        [Display(Name = "Hình ảnh")]
        public string HinhAnh { get; set; }
        [Display(Name = "Ngày thêm")]
        public DateTime? NgayThem { get; set; }
        [Display(Name = "Tình trạng")]
        public bool? TinhTrang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        [Display(Name = "Tên loại sản phẩm")]
        public virtual LoaiSP LoaiSP { get; set; }
        [Display(Name = "Tên thương hiệu")]
        public virtual ThuongHieu ThuongHieu { get; set; }
    }
}
