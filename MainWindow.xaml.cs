using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

using System.Speech.Synthesis;
using Microsoft.Win32;

namespace RoboBlather
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>

    public partial class Window1 : System.Windows.Window
    {
        SpeechSynthesizer _synth = null;
        System.Speech.Synthesis.SayAs _sayAs = SayAs.Text;
        System.Speech.Synthesis.PromptRate _rate = PromptRate.Medium;
        bool _waveFile = false;
        public Window1()
        {
            InitializeComponent();
            // Populate speed dialog box
            this.cbSpeed.Items.Add("Extra Slow");
            this.cbSpeed.Items.Add("Slow");
            this.cbSpeed.Items.Add("Medium");
            this.cbSpeed.Items.Add("Fast");
            this.cbSpeed.Items.Add("Extra Fast");
            this.cbSpeed.SelectedIndex = 2;
            txtFilename.Text = "Speech.wav";

            _synth = new SpeechSynthesizer();
            _synth.SelectVoiceByHints( VoiceGender.Male, VoiceAge.Adult );
            _synth.SetOutputToDefaultAudioDevice();
            System.Collections.ObjectModel.ReadOnlyCollection<InstalledVoice> voices = _synth.GetInstalledVoices();
            foreach (InstalledVoice voice in voices)
            {
                cbVoice.Items.Add(voice.VoiceInfo.Name);
            }
            if (cbVoice.Items.Count > 0)
            {
                cbVoice.SelectedIndex = 0;
            }
        }

        void SpeedSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (cbSpeed.SelectedIndex)
            {
                case -1:
                case 2:
                    _rate = PromptRate.Medium;
                    break;
                case 0:
                    _rate = PromptRate.ExtraSlow;
                    break;
                case 1:
                    _rate = PromptRate.Slow;
                    break;
                case 3:
                    _rate = PromptRate.Fast;
                    break;
                case 4:
                    _rate = PromptRate.ExtraFast;
                    break;
            }
        }

        void VoiceSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string name = String.Empty;
            if( cbVoice.SelectedIndex != -1 )
            {
                name = cbVoice.Items[cbVoice.SelectedIndex] as string;
                try
                {
                    _synth.SelectVoice(name);
                }
                catch( Exception ex )
                {
                    MessageBox.Show(ex.ToString(), "Cannot Set Voice");
                }
            }
        }

        void SpeakClick(object sender, EventArgs e)
        {
            PromptBuilder prompt = new PromptBuilder();
            string name = String.Empty;
            if (cbVoice.SelectedIndex != -1)
            {
                name = cbVoice.Items[cbVoice.SelectedIndex] as string;
                prompt.StartVoice(name);
            }
            prompt.StartStyle(new PromptStyle(_rate));
            prompt.AppendTextWithHint(txtInput.Text, _sayAs);
            prompt.EndStyle();
            prompt.EndVoice();
            if (chkWriteFile.IsChecked != false)
            {
                txtFilename.Background = Brushes.Green;
                this.UpdateLayout();
                _synth.Speak(prompt);
                txtFilename.Background = Brushes.Black;
                MessageBox.Show("Audio render complete.");
            }
            else
            {
                _synth.SpeakAsync(prompt);
            }
        }

        void StopClick(object sender, EventArgs e)
        {
            _synth.SpeakAsyncCancelAll();
        }

        void AboutClick(object sender, EventArgs e)
        {
            MessageBox.Show("RoboBlather Version 1.2 (Freeware)\nCopyright (c) 2008-2016 Zeta Centauri\nhttp://zetacentauri.com\n\nWritten by Jason Champion.\n", "About RoboBlather");
        }

        void WriteFileOn(object sender, RoutedEventArgs e)
        {
            _waveFile = true;
            _synth.SpeakAsyncCancelAll();
            if (!String.IsNullOrEmpty(txtFilename.Text))
            {
                _synth.SetOutputToWaveFile(txtFilename.Text);
            }
            else
            {
                _synth.SetOutputToWaveFile("Speech.wav");
            }
        }

        void WriteFileOff(object sender, RoutedEventArgs e)
        {
            _waveFile = false;
            _synth.SetOutputToDefaultAudioDevice();
        }

        void SpellOutOff(object sender, RoutedEventArgs e)
        {
            _sayAs = SayAs.Text;
        }

        void SpellOutOn(object sender, RoutedEventArgs e)
        {
            _sayAs = SayAs.SpellOut;
        }

        private void BrowseClick(object sender, RoutedEventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.AddExtension = true;
            saveFileDialog.DefaultExt = ".wav";
            saveFileDialog.FileName = txtFilename.Text;
            if (saveFileDialog.ShowDialog() == true)
                txtFilename.Text = saveFileDialog.FileName;
        }

        private void txtFilename_TextChanged(object sender, TextChangedEventArgs e)
        {
        }

        private void windowSizeChanged(object sender, SizeChangedEventArgs e)
        {
            txtInput.Width = e.NewSize.Width - 24;
            txtInput.Height = e.NewSize.Height - 144;
        }

        private void OnInputFocus(object sender, RoutedEventArgs e)
        {
            if (txtInput.Text == "Type or paste text to be spoken here.")
            {
                txtInput.Text = "";
            } 
        }

        //void SetMaleVoice(object sender, RoutedEventArgs e)
        //{
        //    _synth.SelectVoiceByHints(VoiceGender.Male, _synth.Voice.Age);
        //}

        //void SetFemaleVoice(object sender, RoutedEventArgs e)
        //{
        //    _synth.SelectVoiceByHints(VoiceGender.Female, _synth.Voice.Age);
        //}

        //void SetAdultVoice(object sender, RoutedEventArgs e)
        //{
        //    _synth.SelectVoiceByHints(_synth.Voice.Gender, VoiceAge.Adult);
        //}

        //void SetChildVoice(object sender, RoutedEventArgs e)
        //{
        //    _synth.SelectVoiceByHints(_synth.Voice.Gender, VoiceAge.Child);
        //}

    }
}
