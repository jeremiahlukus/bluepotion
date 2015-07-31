class Benchmark
  class << self
    def decimal_formatter
      @_decimal_formatter ||= Potion::DecimalFormat.new("#,###,###")
    end

    def run_single(setup_desc, code_desc, iterations, &block)
      start_time = Time.milliseconds_since_epoch
      0.upto(iterations) do
        block.call
      end
      end_time = Time.milliseconds_since_epoch

      total_time = end_time - start_time
      per_item = total_time / iterations.to_f
      out =  "\nBenchmark  Started at: #{decimal_formatter.format(start_time)}"
      out << "\n  Iterations: #{decimal_formatter.format(iterations)}"
      out << "\n  Setup: #{setup_desc}\n  Code: #{code_desc}"
      out << "\n  Total milliseconds: #{decimal_formatter.format(total_time)}"
      out << "\n  Milliseconds per iteration: #{per_item}"
      mp out
      out
    end
  end
end