module WickedPdfHelper
  if Rails.env.development?
    if RbConfig::CONFIG['host_os'] =~ /linux/
      executable = RbConfig::CONFIG['host_cpu'] == 'x86_64' ? 'wkhtmltopdf_linux_x64' : 'wkhtmltopdf_linux_386'
    elsif RbConfig::CONFIG['host_os'] =~ /darwin/
      executable = 'wkhtmltopdf_darwin_386'
    else
      raise 'Invalid platform. Must be running linux or intel-based Mac OS.'
    end

    WickedPdf.config = { exe_path: "#{Gem.bin_path('wkhtmltopdf-binary').match(/(.+)\/.+/).captures.first}/#{executable}" }
  end
end
