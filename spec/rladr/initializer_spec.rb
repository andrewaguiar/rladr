RSpec.describe Rladr::Initializer do
  context 'when directory is not set' do
    it 'creates the .rladr config file and the directory ./adrs' do
      expect(FileUtils).to receive(:mkdir_p).with('./adrs')
      expect(File).to receive(:write).with('.rladr', 'adrs')

      expect_any_instance_of(Kernel).to receive(:puts).with(':: Initialized in adrs')

      expect(Rladr::New).to receive(:execute).with('Record architecture decisions')

      described_class.execute(['new'])
    end
  end

  context 'when directory is set' do
    it 'creates the .rladr config file and the directory specified' do
      expect(FileUtils).to receive(:mkdir_p).with('./yay')
      expect(File).to receive(:write).with('.rladr', 'yay')

      expect_any_instance_of(Kernel).to receive(:puts).with(':: Initialized in yay')

      expect(Rladr::New).to receive(:execute).with('Record architecture decisions')

      described_class.execute(['new', 'yay'])
    end
  end
end
