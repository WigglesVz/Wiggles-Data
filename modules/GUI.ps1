# =============================================================================
# GUI.ps1 — Interfaz WPF/XAML + Eventos (Wiggles VZ 5.0)
# Generado automáticamente por reorganizar_v2.sh
# =============================================================================

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- XAML ---
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="WigglesVZ Ultimate v4.0 Cloud" 
        Height="780" Width="1080"
        MinHeight="600" MinWidth="800"
        WindowStartupLocation="CenterScreen" 
        ResizeMode="CanResize"
        Background="#0F0F0F" Foreground="White" FontFamily="Segoe UI">

    <Window.Resources>
        <Style TargetType="Button">
            <Setter Property="Background" Value="#1A1A1A"/>
            <Setter Property="Foreground" Value="#EEEEEE"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="Padding" Value="10,5"/>
            <Setter Property="Margin" Value="5"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="RenderTransformOrigin" Value="0.5, 0.5"/>
            <Setter Property="RenderTransform">
                <Setter.Value><ScaleTransform ScaleX="1" ScaleY="1"/></Setter.Value>
            </Setter>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Name="border" Background="{TemplateBinding Background}" CornerRadius="3" Padding="{TemplateBinding Padding}" BorderBrush="#333" BorderThickness="1">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Trigger.EnterActions>
                                    <BeginStoryboard>
                                        <Storyboard>
                                            <ColorAnimation Storyboard.TargetName="border" Storyboard.TargetProperty="(Border.Background).(SolidColorBrush.Color)" To="#00FF41" Duration="0:0:0.2"/>
                                            <ColorAnimation Storyboard.TargetProperty="Foreground.Color" To="Black" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleX" To="1.05" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleY" To="1.05" Duration="0:0:0.2"/>
                                        </Storyboard>
                                    </BeginStoryboard>
                                </Trigger.EnterActions>
                                <Trigger.ExitActions>
                                    <BeginStoryboard>
                                        <Storyboard>
                                            <ColorAnimation Storyboard.TargetName="border" Storyboard.TargetProperty="(Border.Background).(SolidColorBrush.Color)" To="#1A1A1A" Duration="0:0:0.2"/>
                                            <ColorAnimation Storyboard.TargetProperty="Foreground.Color" To="#EEEEEE" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleX" To="1.0" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleY" To="1.0" Duration="0:0:0.2"/>
                                        </Storyboard>
                                    </BeginStoryboard>
                                </Trigger.ExitActions>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style x:Key="BotonVerde" TargetType="Button">
            <Setter Property="Background" Value="#006400"/>
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="FontSize" Value="18"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Padding" Value="10,5"/>
            <Setter Property="Margin" Value="5"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="RenderTransformOrigin" Value="0.5, 0.5"/>
            <Setter Property="RenderTransform">
                <Setter.Value><ScaleTransform ScaleX="1" ScaleY="1"/></Setter.Value>
            </Setter>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Name="border" Background="{TemplateBinding Background}" CornerRadius="3" Padding="{TemplateBinding Padding}" BorderBrush="#00FF41" BorderThickness="1">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Trigger.EnterActions>
                                    <BeginStoryboard>
                                        <Storyboard>
                                            <ColorAnimation Storyboard.TargetName="border" Storyboard.TargetProperty="(Border.Background).(SolidColorBrush.Color)" To="#00FF41" Duration="0:0:0.2"/>
                                            <ColorAnimation Storyboard.TargetProperty="Foreground.Color" To="Black" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleX" To="1.05" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleY" To="1.05" Duration="0:0:0.2"/>
                                        </Storyboard>
                                    </BeginStoryboard>
                                </Trigger.EnterActions>
                                <Trigger.ExitActions>
                                    <BeginStoryboard>
                                        <Storyboard>
                                            <ColorAnimation Storyboard.TargetName="border" Storyboard.TargetProperty="(Border.Background).(SolidColorBrush.Color)" To="#006400" Duration="0:0:0.2"/>
                                            <ColorAnimation Storyboard.TargetProperty="Foreground.Color" To="White" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleX" To="1.0" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleY" To="1.0" Duration="0:0:0.2"/>
                                        </Storyboard>
                                    </BeginStoryboard>
                                </Trigger.ExitActions>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style x:Key="BotonDorado" TargetType="Button">
            <Setter Property="Background" Value="#B8860B"/>
            <Setter Property="Foreground" Value="Black"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Padding" Value="10,5"/>
            <Setter Property="Margin" Value="5"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="RenderTransformOrigin" Value="0.5, 0.5"/>
            <Setter Property="RenderTransform">
                <Setter.Value><ScaleTransform ScaleX="1" ScaleY="1"/></Setter.Value>
            </Setter>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Name="border" Background="{TemplateBinding Background}" CornerRadius="3" Padding="{TemplateBinding Padding}" BorderBrush="#FFD700" BorderThickness="1">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Trigger.EnterActions>
                                    <BeginStoryboard>
                                        <Storyboard>
                                            <ColorAnimation Storyboard.TargetName="border" Storyboard.TargetProperty="(Border.Background).(SolidColorBrush.Color)" To="#FFD700" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleX" To="1.05" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleY" To="1.05" Duration="0:0:0.2"/>
                                        </Storyboard>
                                    </BeginStoryboard>
                                </Trigger.EnterActions>
                                <Trigger.ExitActions>
                                    <BeginStoryboard>
                                        <Storyboard>
                                            <ColorAnimation Storyboard.TargetName="border" Storyboard.TargetProperty="(Border.Background).(SolidColorBrush.Color)" To="#B8860B" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleX" To="1.0" Duration="0:0:0.2"/>
                                            <DoubleAnimation Storyboard.TargetProperty="RenderTransform.ScaleY" To="1.0" Duration="0:0:0.2"/>
                                        </Storyboard>
                                    </BeginStoryboard>
                                </Trigger.ExitActions>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style TargetType="TextBox">
            <Setter Property="Background" Value="#252526"/>
            <Setter Property="Foreground" Value="#00FF41"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Padding" Value="5"/>
            <Setter Property="VerticalContentAlignment" Value="Center"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="FontFamily" Value="Consolas"/>
        </Style>

        <Style TargetType="Label">
            <Setter Property="Foreground" Value="#888888"/>
            <Setter Property="FontSize" Value="12"/>
            <Setter Property="FontWeight" Value="Bold"/>
        </Style>

        <Style TargetType="TabItem">
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="Foreground" Value="#666666"/>
            <Setter Property="FontSize" Value="16"/>
            <Setter Property="Padding" Value="20,10"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="TabItem">
                        <Border Name="Border" Background="{TemplateBinding Background}" Margin="0,0,5,0" CornerRadius="5,5,0,0" BorderBrush="#333" BorderThickness="0,0,0,2">
                            <ContentPresenter x:Name="ContentSite" VerticalAlignment="Center" HorizontalAlignment="Center" ContentSource="Header" Margin="10,5"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsSelected" Value="True">
                                <Setter TargetName="Border" Property="BorderBrush" Value="#00FF41"/>
                                <Setter Property="Foreground" Value="#00FF41"/>
                                <Setter Property="FontWeight" Value="Bold"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>

    <Window.Triggers>
        <EventTrigger RoutedEvent="Window.Loaded">
            <BeginStoryboard>
                <Storyboard>
                    <DoubleAnimation Storyboard.TargetProperty="Opacity" From="0.0" To="1.0" Duration="0:0:0.5"/>
                    <DoubleAnimation Storyboard.TargetName="MainGridTransform" Storyboard.TargetProperty="Y" From="30" To="0" Duration="0:0:0.6" DecelerationRatio="0.5"/>
                </Storyboard>
            </BeginStoryboard>
        </EventTrigger>
    </Window.Triggers>

    <Grid>
        <Grid.RenderTransform>
            <TranslateTransform x:Name="MainGridTransform" Y="0"/>
        </Grid.RenderTransform>

        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="30"/>
        </Grid.RowDefinitions>

        <Border Grid.Row="0" Background="#111" Padding="20,15" BorderBrush="#00FF41" BorderThickness="0,0,0,1">
            <DockPanel>
                <TextBlock Text="WIGGLES VZ" FontSize="24" FontWeight="Bold" Foreground="#00FF41" VerticalAlignment="Center" FontFamily="Consolas"/>
                <TextBlock Text=" // SYSTEM TOOLKIT" FontSize="18" Foreground="#555" VerticalAlignment="Center" Margin="10,4,0,0" FontFamily="Consolas"/>
                <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
                    <TextBlock Name="txtUserInfo" Text="User: Admin" VerticalAlignment="Center" Foreground="#DDD" Margin="0,0,20,0"/>
                </StackPanel>
            </DockPanel>
        </Border>

        <TabControl Grid.Row="1" Background="Transparent" BorderThickness="0" Margin="10">
            
            <TabItem Header="🚀 AUTO-PILOT">
                <Grid Margin="30">
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>

                    <StackPanel Grid.Row="0" HorizontalAlignment="Center" Margin="0,0,0,20">
                        <TextBlock Text="MODO DESATENDIDO (POST-FORMATO)" FontSize="24" FontWeight="Bold" Foreground="#00FF41" HorizontalAlignment="Center" Margin="0,0,0,10"/>
                        <TextBlock Text="Secuencia automática de configuración de equipo." Foreground="#888" HorizontalAlignment="Center" Margin="0,0,0,20"/>
                        
                        <StackPanel Orientation="Horizontal" HorizontalAlignment="Center" Margin="0,0,0,20">
                            <TextBlock Text="Seleccione Proveedor:" VerticalAlignment="Center" Foreground="White" Margin="0,0,10,0"/>
                            <ComboBox Name="cmbProvAuto" Width="200" Height="28" VerticalContentAlignment="Center"/>

                            <TextBlock Text="Nº Lote / Orden:" VerticalAlignment="Center" Foreground="White" Margin="25,0,10,0" FontWeight="Bold"/>
                            <TextBox Name="txtLoteAuto" Width="120" Height="28" VerticalContentAlignment="Center" Background="#222" Foreground="Cyan" BorderThickness="1" BorderBrush="#555"/>
                        </StackPanel>
                        
                        <Button Name="btnAutoStart" Content="▶️ INICIAR SECUENCIA" Width="450" Height="60" Style="{DynamicResource BotonVerde}" Margin="0,10,0,0"/>
                    </StackPanel>

                    <Border Grid.Row="1" Background="#151515" CornerRadius="5" Padding="20" BorderBrush="#333" BorderThickness="1">
                        <StackPanel>
                            <TextBlock Text="SECUENCIA DE TAREAS:" FontWeight="Bold" Foreground="#00FF41" Margin="0,0,0,10"/>
                            <TextBlock Text="1. 📋 Escaneo y Registro en Base de Datos Nube" Foreground="#AAA" Margin="5"/>
                            <TextBlock Text="2. 🛠️ Herramientas de Fabricante (Dell/HP/Lenovo)" Foreground="#AAA" Margin="5"/>
                            <TextBlock Text="3. 💿 Instalación Office 2024 LTSC" Foreground="#AAA" Margin="5"/>
                            <TextBlock Text="4. 🔑 Activación Windows + Office" Foreground="#AAA" Margin="5"/>
                        </StackPanel>
                    </Border>
                </Grid>
            </TabItem>

            <TabItem Header="📦 RECEPCIÓN">
                <Grid Margin="20">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="2*"/>
                        <ColumnDefinition Width="1*"/>
                    </Grid.ColumnDefinitions>

                    <StackPanel Grid.Column="0" Margin="0,0,20,0">
                        <TextBlock Text="DATOS DE RECEPCIÓN" FontSize="18" Foreground="#00FF41" Margin="0,0,0,15"/>
                        
                        <Grid>
                            <Grid.ColumnDefinitions><ColumnDefinition/><ColumnDefinition/></Grid.ColumnDefinitions>
                            <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="Auto"/><RowDefinition Height="Auto"/><RowDefinition Height="Auto"/></Grid.RowDefinitions>
                            
                            <StackPanel Grid.Row="0" Grid.Column="0" Margin="0,0,10,10">
                                <Label Content="PROVEEDOR"/>
                                <ComboBox Name="cmbProvID" IsEditable="True" SelectedIndex="0" FontSize="16" Padding="5"/>
                            </StackPanel>
                            <StackPanel Grid.Row="0" Grid.Column="1" Margin="10,0,0,10">
                                <Label Content="NÚMERO DE ORDEN"/>
                                <TextBox Name="txtOrden" IsReadOnly="False" Background="#111" BorderThickness="1" BorderBrush="#444" ToolTip="Ingrese Nro de Lote u Orden"/>
                            </StackPanel>

                            <StackPanel Grid.Row="1" Grid.Column="0" Margin="0,0,10,10">
                                <Label Content="MARCA"/>
                                <TextBox Name="txtMarca"/>
                            </StackPanel>
                            <StackPanel Grid.Row="1" Grid.Column="1" Margin="10,0,0,10">
                                <Label Content="MODELO"/>
                                <TextBox Name="txtModelo"/>
                            </StackPanel>

                            <StackPanel Grid.Row="2" Grid.ColumnSpan="2" Margin="0,0,0,10">
                                <Label Content="SERIAL / TAG"/>
                                <TextBox Name="txtSerial" FontSize="16" FontWeight="Bold" Background="#1A1A1A"/>
                            </StackPanel>
                            
                            <StackPanel Grid.Row="3" Grid.ColumnSpan="2" Margin="0,0,0,20">
                                <Label Content="COMENTARIOS / FALLA"/>
                                <TextBox Name="txtComentario" Height="60" TextWrapping="Wrap" AcceptsReturn="True"/>
                            </StackPanel>
                        </Grid>

                        <Grid>
                            <Grid.ColumnDefinitions><ColumnDefinition/><ColumnDefinition/><ColumnDefinition/></Grid.ColumnDefinitions>
                            <Button Grid.Column="0" Name="btnEscanear" Content="🔍 Escanear"/>
                            <Button Grid.Column="1" Name="btnEtiqueta" Content="🖨️ Etiqueta QR"/>
                            <Button Grid.Column="2" Name="btnGuardarInv" Content="💾 Guardar Nube"/>
                        </Grid>
                    </StackPanel>

                    <Border Grid.Column="1" Background="#151515" CornerRadius="5" Padding="15" BorderBrush="#333" BorderThickness="1">
                        <StackPanel>
                            <TextBlock Text="HARDWARE INFO" FontSize="16" FontWeight="Bold" Foreground="#00FF41" Margin="0,0,0,10"/>
                            
                            <Label Content="PROCESADOR"/>
                            <TextBox Name="txtCPU" IsReadOnly="True" Background="#111" Foreground="#AAA"/>
                            
                            <Label Content="MEMORIA RAM"/>
                            <TextBox Name="txtRAM" IsReadOnly="True" Background="#111" Foreground="#AAA"/>
                            
                            <Label Content="BATERÍA"/>
                            <TextBox Name="txtBateria" IsReadOnly="True" Background="#111" Foreground="#AAA"/>
                            
                            <Grid Margin="0,10,0,0">
                                <Grid.ColumnDefinitions><ColumnDefinition/><ColumnDefinition/><ColumnDefinition/></Grid.ColumnDefinitions>
                                <StackPanel Grid.Column="0" Margin="0,0,5,0">
                                    <Label Content="VOLTS"/>
                                    <TextBox Name="txtVolts" IsReadOnly="True" Background="#111" Foreground="Yellow" FontWeight="Bold"/>
                                </StackPanel>
                                <StackPanel Grid.Column="1" Margin="5,0,5,0">
                                    <Label Content="AMPS"/>
                                    <TextBox Name="txtAmps" IsReadOnly="True" Background="#111" Foreground="Yellow" FontWeight="Bold"/>
                                </StackPanel>
                                <StackPanel Grid.Column="2" Margin="5,0,0,0">
                                    <Label Content="WATTS"/>
                                    <TextBox Name="txtWatts" IsReadOnly="True" Background="#111" Foreground="Yellow" FontWeight="Bold"/>
                                </StackPanel>
                            </Grid>
                        </StackPanel>
                    </Border>
                </Grid>
            </TabItem>

            <TabItem Header="🛠️ MANTENIMIENTO">
                <Grid Margin="20">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition/>
                        <ColumnDefinition/>
                    </Grid.ColumnDefinitions>
                    
                    <StackPanel Grid.Column="0" Margin="0,0,20,0">
                        <TextBlock Text="PREPARACIÓN" FontSize="18" Foreground="#00FF41" Margin="0,0,0,15"/>
                        <Button Name="btnBackupDrivers" Content="📂 Backup Drivers" HorizontalContentAlignment="Left"/>
                        <Button Name="btnMiniBackup" Content="📂 Mini-Backup Usuario (Robocopy)" HorizontalContentAlignment="Left" Foreground="#FFD700"/>
                        <Button Name="btnRestoreDrivers" Content="♻️ Restaurar Drivers (Importar)" HorizontalContentAlignment="Left"/>
                        <Button Name="btnRestorePoint" Content="1. Crear Punto Restauración" HorizontalContentAlignment="Left"/>
                        <Button Name="btnWinPro" Content="2. Actualizar a Win Pro" HorizontalContentAlignment="Left"/>
                        <Button Name="btnAdminLocal" Content="3. Crear Admin Local" HorizontalContentAlignment="Left"/>
                        <Button Name="btnBloatware" Content="4. Eliminar Bloatware" HorizontalContentAlignment="Left"/>
                        <Button Name="btnSFC" Content="5. CompactOS / SFC" HorizontalContentAlignment="Left"/>
                        <Button Name="btnExplorerTweaks" Content="👁️ Ver Archivos Ocultos" HorizontalContentAlignment="Left"/>
                    </StackPanel>

                    <StackPanel Grid.Column="1">
                        <TextBlock Text="OPTIMIZACIÓN" FontSize="18" Foreground="#00FF41" Margin="0,0,0,15"/>
                        <Button Name="btnRed" Content="📡 Reparar Red (Reset)" HorizontalContentAlignment="Left"/>
                        <Button Name="btnDrivers" Content="🧹 Limpieza Profunda Drivers" HorizontalContentAlignment="Left"/>
                        <Button Name="btnOptimizacion" Content="🚀 Optimización Rápida" HorizontalContentAlignment="Left"/>
                        <Button Name="btnPower" Content="⚡ Plan Máximo Rendimiento" HorizontalContentAlignment="Left"/>
                        
                        <TextBlock Text="AVANZADO" FontSize="18" Foreground="#00FF41" Margin="0,20,0,15"/>
                        <Button Name="btnDISM" Content="🚑 Reparar Imagen (DISM)" HorizontalContentAlignment="Left"/>
                        <Button Name="btnFixUpdates" Content="🔄 Reset Windows Update" HorizontalContentAlignment="Left"/>
                        <Button Name="btnFixStore" Content="🛍️ Reparar Tienda" HorizontalContentAlignment="Left"/>
                        <Button Name="btnChkDsk" Content="hdd️ ScanDisk Rápido" HorizontalContentAlignment="Left"/>
                    </StackPanel>
                </Grid>
            </TabItem>

            <TabItem Header="💿 SOFTWARE">
                <Grid Margin="20">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="1.5*"/>
                        <ColumnDefinition Width="1*"/>
                    </Grid.ColumnDefinitions>

                    <StackPanel Grid.Column="0" Margin="0,0,20,0">
                        <TextBlock Text="OFFICE 2024 LTSC" FontSize="18" Foreground="#00FF41" Margin="0,0,0,10"/>
                        <Border Background="#151515" Padding="15" CornerRadius="5" Margin="0,0,0,20" BorderBrush="#333" BorderThickness="1">
                            <StackPanel>
                                <TextBlock Text="Instalación offline segura desde USB." Foreground="#666" Margin="0,0,0,10"/>
                                <Button Name="btnInstalarOffice" Content="💿 Instalar Office 2024" Height="40" FontWeight="Bold"/>
                                <Button Name="btnStopUpdate" Content="🛡️ Stop Updates" Margin="5,10,5,5"/>
                            </StackPanel>
                        </Border>

                        <TextBlock Text="ACTIVACIÓN (MAS)" FontSize="18" Foreground="#00FF41" Margin="0,0,0,10"/>
                        <Button Name="btnActivar" Content="🔑 Activar Windows y Office" Height="40" Style="{StaticResource BotonDorado}"/>
                    </StackPanel>

                    <StackPanel Grid.Column="1">
                        <TextBlock Text="PERFILES (WINGET)" FontSize="18" Foreground="#00FF41" Margin="0,0,0,10"/>
                        <ComboBox Name="cmbPerfiles" Margin="5,0,5,5" Padding="5"/>
                        <Border Background="#151515" CornerRadius="3" Padding="10" Margin="5,0,5,10">
                            <TextBlock Name="txtPerfilDesc" Text="Seleccione perfil..." Foreground="#AAA" FontSize="11" TextWrapping="Wrap" FontStyle="Italic"/>
                        </Border>
                        <Button Name="btnInstalarPerfil" Content="⬇️ Instalar Perfil" Margin="5,0,5,5"/>
                        <TextBlock Text="HERRAMIENTAS PDF &amp; LIMPIEZA" FontSize="18" Foreground="#00FF41" Margin="0,20,0,10"/>
                        <Button Name="btnNitro" Content="📄 Instalar Nitro Pro 9 (+Serial)" HorizontalContentAlignment="Left" Margin="5,0,5,5"/>
                        <Button Name="btnUninstallTool" Content="🗑️ Uninstall Tool Portable" HorizontalContentAlignment="Left" Margin="5,0,5,5"/>
                        <TextBlock Text="UTILIDADES" FontSize="18" Foreground="#00FF41" Margin="0,30,0,10"/>
                        <Button Name="btnRuntimes" Content="📦 Instalar Runtimes" HorizontalContentAlignment="Left"/>
                    </StackPanel>
                </Grid>
            </TabItem>

            <TabItem Header="⚡ HERRAMIENTAS">
                <WrapPanel Margin="20" ItemWidth="200" ItemHeight="100">
                    <Button Name="btnGetKey" Content="🔑 Clave BIOS" Margin="10" FontWeight="Bold"/>
                    <Button Name="btnCrystal" Content="CrystalDiskInfo" Margin="10"/>
                    <Button Name="btnCrystalMark" Content="CrystalDiskMark" Margin="10"/>
                    <Button Name="btnHWiNFO" Content="HWiNFO" Margin="10"/>
                    <Button Name="btnDriverBooster" Content="Drivers (3DP Chip/Net)" Margin="10"/>
                    <Button Name="btnDell" Content="Dell Support" Margin="10"/>
                    <Button Name="btnHP" Content="HP Support" Margin="10"/>
                    <Button Name="btnLenovo" Content="Lenovo Vantage" Margin="10"/>
                </WrapPanel>
            </TabItem>

        </TabControl>

        <Border Grid.Row="2" Background="#00FF41" Padding="10,0">
            <DockPanel VerticalAlignment="Center">
                <TextBlock Name="txtStatus" Text="Sistema listo." Foreground="Black" FontWeight="Bold" FontFamily="Consolas"/>
                <StackPanel Orientation="Horizontal" DockPanel.Dock="Right" Margin="0,0,20,0">
                    <TextBlock Text="🌡️ DISCO: " Foreground="Black" FontWeight="Bold"/>
                    <TextBlock Name="txtTemp" Text="-- °C" Foreground="Black" FontWeight="Bold"/>
                </StackPanel>
                <ProgressBar Name="progressBar" Width="200" Height="15" HorizontalAlignment="Right" DockPanel.Dock="Right" Visibility="Hidden" Background="#222" Foreground="Black"/>
            </DockPanel>
        </Border>
    </Grid>
</Window>
"@

$Reader = (New-Object System.Xml.XmlNodeReader $XAML)
$Window = [Windows.Markup.XamlReader]::Load($Reader)
$XAML.SelectNodes("//*[@Name]") | ForEach-Object {
    Set-Variable -Name ($_.Name) -Value $Window.FindName($_.Name) -Scope Script
}

# --- Helpers visuales ---
function Start-Loading {
    $Window.Dispatcher.Invoke([Action]{
        if ($progressBar) { $progressBar.Visibility = "Visible"; $progressBar.IsIndeterminate = $true }

function Stop-Loading {
    $Window.Dispatcher.Invoke([Action]{
        if ($progressBar) { $progressBar.IsIndeterminate = $false; $progressBar.Visibility = "Hidden" }

function Invoke-Task {
    param($Button, $TextRunning, $ScriptBlock, $ConfirmMsg=$null)
    if ($ConfirmMsg) { if ((Show-Msg $ConfirmMsg "Confirmar Acción" "YesNo" "Question") -eq "No") { return }

function Test-IsConnected {
    try { Test-Connection -ComputerName 8.8.8.8 -Count 1 -ErrorAction Stop | Out-Null; return $true }

function Test-SerialNumberFormat {
    param([string]$SerialNumber, [string]$Manufacturer)
    if (-not $global:manufacturerPatterns.ContainsKey($Manufacturer)) { return @{IsValid=$false; Reason="Desconocido"}


# --- Eventos ---
$Window.Add_Loaded({
    Update-Status "Iniciando sistema..."
    Load-ProveedoresNube
    
    if ($global:ListaProveedoresData) {
        $ItemsCombo = $global:ListaProveedoresData | ForEach-Object { "$($_.ID) - $($_.Nombre)" }
        $cmbProvID.Items.Clear(); $cmbProvAuto.Items.Clear()
        foreach ($item in $ItemsCombo) { $cmbProvID.Items.Add($item); $cmbProvAuto.Items.Add($item) }
        $cmbProvID.SelectedIndex = 0; $cmbProvAuto.SelectedIndex = 0
    }
    
    if ($global:SoftPath -and (Test-Path $global:SoftPath)) { 
        Get-ChildItem "$global:SoftPath\*.txt" | ForEach-Object { $cmbPerfiles.Items.Add($_.Name) }
        if ($cmbPerfiles.Items.Count -gt 0) { $cmbPerfiles.SelectedIndex = 0 } 
    }
})

$TimerTemp.Add_Tick({ $txtTemp.Text = Get-DiskTemperature })

$btnEscanear.Add_Click({
    Start-Loading # Bloquea la UI
    Update-Status "Escaneando hardware..."
    $Info = Get-SystemInfoAdvanced 
    
    if ($Info) {
        $txtMarca.Text = $Info.Marca; $txtModelo.Text = $Info.Model; $txtSerial.Text = $Info.Serial
        $txtCPU.Text = $Info.CPU; $txtRAM.Text = $Info.RAM; $txtBateria.Text = $Info.Bateria
        $global:InfoEscaneada = $Info
        
        # Validación de color de Serial
        $Val = Test-SerialNumberFormat -SerialNumber $Info.Serial -Manufacturer $Info.Marca
        if (-not $Val.IsValid) { $txtSerial.Background = "#550000" } # Rojo si sospechoso
        else { $txtSerial.Background = "#1A1A1A" } # Normal si es correcto
        
        $txtOrden.IsReadOnly = $false; $txtOrden.Focus()
        Update-Status "✅ Listo: $($Info.Tipo) detectado."
    } else { Show-Msg "Fallo al leer hardware." }
    Stop-Loading # Desbloquea la UI
})

$btnGuardarInv.Add_Click({
    if ([string]::IsNullOrWhiteSpace($txtSerial.Text) -or $txtSerial.Text.Length -lt 3) { Show-Msg "Serial obligatorio." "Aviso"; return }
    $btnGuardarInv.IsEnabled = $false
    Update-Status "Subiendo a la nube..."
    
    $ID_Prov = $cmbProvID.Text.Split("-")[0].Trim()
    $ProvData = $global:ListaProveedoresData | Where-Object { $_.ID -eq $ID_Prov } | Select-Object -First 1
    $Dias = if ($ProvData) { $ProvData.Garantia_Dias } else { 30 }
    
    $Datos = [PSCustomObject]@{
        Fecha = (Get-Date -Format "yyyy-MM-dd")
        LOTE = if ($txtOrden.Text) { $txtOrden.Text } else { "MANUAL" }
        CO_prov = $ID_Prov; Proveedor = $ID_Prov; CO_Art = "MANUAL"
        Garantia_Hasta = (Get-Date).AddDays([int]$Dias).ToString("yyyy-MM-dd")
        Garantia_360 = (Get-Date).AddMonths(6).ToString("yyyy-MM-dd")
        Marca = $txtMarca.Text; Modelo = $txtModelo.Text; Serial = $txtSerial.Text; Estado = "Ingresado"
        Procesador = $txtCPU.Text; RAM = $txtRAM.Text
        Storage = if($global:InfoEscaneada){ $global:InfoEscaneada.Storage } else { "N/A" }
        SistemaOperativo = if($global:InfoEscaneada){ $global:InfoEscaneada.OS } else { "N/A" }
        FF_o_In = if($global:InfoEscaneada){ $global:InfoEscaneada.FF_o_In } else { "N/A" }
        Unid = 1; Recibido = "OK"
        Tipo = if($global:InfoEscaneada){ $global:InfoEscaneada.Tipo } else { "N/A" }
        Usuario_Registra = $env:USERNAME; Comentarios = $txtComentario.Text
    }

    if (Save-To-CentralDB -Datos $Datos) { 
        Show-Msg "✅ Guardado en Nube OK" 
        Update-Status "Guardado: $($txtSerial.Text)" 
    } else { Show-Msg "Error conectando a Google Sheets." "Error" }
    $btnGuardarInv.IsEnabled = $true
})

$btnAutoStart.Add_Click({
    if (-not $global:InfoEscaneada) { Show-Msg "Primero ESCANEA el equipo."; return }
    $ProvTxt = $cmbProvAuto.Text; if (-not $ProvTxt) { return }
    if ((Show-Msg "⚠️ ¿INICIAR AUTO-PILOT?`n`nSe instalarán Apps, Drivers, Office, se activará y notificará." "Confirmar" "YesNo" "Question") -eq "No") { return }
    
    $btnAutoStart.IsEnabled = $false; $OriginalText = $btnAutoStart.Content; $btnAutoStart.Content = "🚀 EJECUTANDO SECUENCIA..."
    
    $ID_Prov_Str = $ProvTxt.Split("-")[0].Trim()
    $ProvData = $global:ListaProveedoresData | Where-Object { [int]$_.ID -eq [int]$ID_Prov_Str } | Select-Object -First 1
    $DiasGarantia = if ($ProvData) { [int]$ProvData.Garantia_Dias } else { 30 }
    
    try {
        # 1. Ejecutar Guardado Web
        Update-Status "PASO 1/5: Subiendo Inventario..."
        $DatosAuto = [PSCustomObject]@{
            Fecha=(Get-Date -Format "yyyy-MM-dd"); LOTE=$txtLoteAuto.Text; CO_prov=$ID_Prov_Str; Proveedor=$ID_Prov_Str; CO_Art="AUTO"
            Garantia_Hasta=(Get-Date).AddDays($DiasGarantia).ToString("yyyy-MM-dd"); Garantia_360=(Get-Date).AddMonths(6).ToString("yyyy-MM-dd")
            Marca=$global:InfoEscaneada.Marca; Modelo=$global:InfoEscaneada.Model; Serial=$global:InfoEscaneada.Serial
            Estado="Ingresado"; Procesador=$global:InfoEscaneada.CPU; RAM=$global:InfoEscaneada.RAM; Storage=$global:InfoEscaneada.Storage
            SistemaOperativo=$global:InfoEscaneada.OS; FF_o_In=$global:InfoEscaneada.FF_o_In; Unid=1; Recibido="OK"; Tipo=$global:InfoEscaneada.Tipo
            Usuario_Registra="AUTOPILOT"
        }
        Save-To-CentralDB -Datos $DatosAuto | Out-Null
        
        # 2. Herramientas de Fabricante (Detecta si hay USB)
        Update-Status "PASO 2/5: Instalando Soporte de Fabricante..."
        if ($global:ExternalPath) {
            $Manuf = $global:InfoEscaneada.Marca
            $LocalFolder = ""; $SilentArgs = ""
            if ($Manuf -match "Dell") { $LocalFolder = "Dell\DellSupportAssist_Install"; $SilentArgs = "/s /v`"/qn`"" } 
            elseif ($Manuf -match "HP") { $LocalFolder = "HP\HPSupport_Install"; $SilentArgs = "SPECIAL_HP" } 
            elseif ($Manuf -match "Lenovo") { $LocalFolder = "Lenovo\LenovoVantage_Install"; $SilentArgs = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART" }

            if ($LocalFolder) {
                $InstaladorLocal = Get-ChildItem -Path (Join-Path $global:VendorToolsPath (Split-Path $LocalFolder -Parent)) -Filter "*.exe" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
                if ($InstaladorLocal) {
                    if ($SilentArgs -eq "SPECIAL_HP") {
                        $TempDir = "$env:TEMP\Wiggles_HP_Install"; New-Item -Path $TempDir -ItemType Directory -Force | Out-Null
                        Start-Process -FilePath $InstaladorLocal.FullName -ArgumentList "/s /f `"$TempDir`"" -Wait -NoNewWindow
                        $RealSetup = Get-ChildItem -Path $TempDir -Include "Install.cmd","Setup.exe","*.msi" -Recurse | Select-Object -First 1
                        if ($RealSetup) {
                            if ($RealSetup.Extension -eq ".msi") { Start-Process "msiexec.exe" -ArgumentList "/i `"$($RealSetup.FullName)`" /qn" -Wait -NoNewWindow } 
                            elseif ($RealSetup.Name -eq "Install.cmd") { Start-Process $RealSetup.FullName -Wait -NoNewWindow } 
                            else { Start-Process $RealSetup.FullName -ArgumentList "/s /v`"/qn`"" -Wait -NoNewWindow }
                        }
                        Remove-Item $TempDir -Recurse -Force -ErrorAction SilentlyContinue
                    } else { Start-Process -FilePath $InstaladorLocal.FullName -ArgumentList $SilentArgs -Wait -NoNewWindow }
                }
            }
        }

        # 3. Office 2024 (Solo si hay USB)
        Update-Status "PASO 3/5: Verificando Office 2024..."
        if ($global:OfficePath) {
            $Setup = Join-Path $global:OfficePath "setup.exe"; $Conf = Join-Path $global:OfficePath "Configuration.xml"
            if (Test-Path $Setup) { Start-Process -FilePath $Setup -ArgumentList "/configure `"$Conf`"" -WorkingDirectory $global:OfficePath -Wait -NoNewWindow }
        }

        # 4. Optimización y Activación
        Update-Status "PASO 4/5: Optimizando y Activando..."
        Invoke-WinScriptTweaks
        Activate-MAS

        # 5. Notificación Telegram
        Update-Status "PASO 5/5: Notificando..."
        try {
            $Nombre_Prov = if ($ProvData) { $ProvData.Nombre } else { "Genérico" }
            $FechaGarantiaFin = (Get-Date).AddDays($DiasGarantia).ToString("yyyy-MM-dd")
            $FechaGarantia360 = (Get-Date).AddMonths(6).ToString("yyyy-MM-dd")

            $TelegramMessage = @"
✅ REPORTE AUTO-PILOT FINALIZADO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🧾 ORDEN / LOTE: $($txtLoteAuto.Text)
💻 Equipo: $($env:COMPUTERNAME)
🏷️ Marca: $($global:InfoEscaneada.Marca)
🔢 Modelo: $($global:InfoEscaneada.Model)
🆔 Serial: $($global:InfoEscaneada.Serial)

🧠 CPU: $($global:InfoEscaneada.CPU)
💾 RAM: $($global:InfoEscaneada.RAM)
💿 Disco: $($global:InfoEscaneada.Storage)
🪟 SO: $($global:InfoEscaneada.OS)

🏢 Proveedor: $Nombre_Prov
📅 Garantía Prov: $FechaGarantiaFin
🛡️ Garantía 360: $FechaGarantia360

🕐 Hora Fin: $(Get-Date -Format "HH:mm:ss")
"@
            $Uri = "https://api.telegram.org/bot$($global:TelegramToken)/sendMessage"
            $Body = @{ chat_id = $global:TelegramChatID; text = $TelegramMessage; parse_mode = "HTML" }
            Invoke-RestMethod -Uri $Uri -Method Post -Body $Body -ContentType "application/x-www-form-urlencoded" | Out-Null
        } catch { Update-Status "❌ Error enviando Telegram." }

        Show-Msg "¡Auto-Pilot Completado Exitosamente!" "Éxito"

    } catch { 
        Show-Msg "Error Crítico Auto-Pilot: $_" "Error"
    } finally {
        $btnAutoStart.Content = $OriginalText; $btnAutoStart.IsEnabled = $true; Update-Status "Sistema Listo."
    }
})

$btnBackupDrivers.Add_Click({
    Invoke-Task -Button $btnBackupDrivers -TextRunning "⏳ Exportando Drivers..." -ScriptBlock {
        $PCName = $env:COMPUTERNAME
        try { $Model = (Get-CimInstance Win32_ComputerSystem).Model.Trim() -replace "[^a-zA-Z0-9]", "_" } catch { $Model = "Generic" }
        $FullPath = Join-Path "C:\Backups_Drivers" "$($PCName)_$($Model)"
        if (-not (Test-Path $FullPath)) { New-Item -Path $FullPath -ItemType Directory -Force | Out-Null }
        Export-WindowsDriver -Online -Destination $FullPath -ErrorAction Stop
        Show-Msg "✅ Backup guardado en C:\Backups_Drivers"
        Invoke-Item $FullPath
    }
})

$btnRestoreDrivers.Add_Click({
    if ((Show-Msg "⚠️ ¿Restaurar drivers desde C:\Backups_Drivers?" "Confirmar" "YesNo") -eq "Yes") {
        $FolderDlg = New-Object System.Windows.Forms.FolderBrowserDialog
        $FolderDlg.SelectedPath = "C:\Backups_Drivers" 
        if ($FolderDlg.ShowDialog() -eq "OK") {
            Invoke-Task -Button $btnRestoreDrivers -TextRunning "⏳ Instalando..." -ScriptBlock {
                $Proc = Start-Process "pnputil.exe" -ArgumentList "/add-driver `"$($FolderDlg.SelectedPath)\*.inf`" /subdirs /install" -NoNewWindow -Wait -PassThru
                if ($Proc.ExitCode -eq 0 -or $Proc.ExitCode -eq 3010) { Show-Msg "✅ Restauración finalizada." }
            }
        }
    }
})

$btnMiniBackup.Add_Click({
    Invoke-Task -Button $btnMiniBackup -TextRunning "📂 Copiando..." -ConfirmMsg "¿Iniciar respaldo de usuario?" -ScriptBlock {
        if ($global:USBRoot) {
            $BackupPath = Start-MiniBackup -DestinoUSB $global:USBRoot
            Show-Msg "✅ Backup completado en: $BackupPath"
            Invoke-Item $BackupPath
        } else { Show-Msg "Modo Solo-Nube. Conecta la USB para hacer backup." "Error" }
    }
})

$btnRestorePoint.Add_Click({ Invoke-Task -Button $btnRestorePoint -TextRunning "⏳ Creando Punto..." -ScriptBlock { if (Create-RestorePoint "WigglesVZ_Auto") { Show-Msg "✅ Punto Creado." } } })

$btnWinPro.Add_Click({ Invoke-Task -Button $btnWinPro -TextRunning "⏳ Actualizando..." -ConfirmMsg "¿Intentar upgrade a Win Pro?" -ScriptBlock { Update-WindowsEdition } })

$btnAdminLocal.Add_Click({ Invoke-Task -Button $btnAdminLocal -TextRunning "⏳ Creando Admin..." -ScriptBlock { New-LocalAdmin; Show-Msg "✅ Admin 'SoporteLocal' creado." } })

$btnBloatware.Add_Click({ Invoke-Task -Button $btnBloatware -TextRunning "🧹 Limpiando..." -ConfirmMsg "¿Ejecutar limpieza agresiva de Bloatware?" -ScriptBlock { Remove-Bloatware } })

$btnSFC.Add_Click({
    $Resp = Show-Msg "Seleccione acción:`n[SÍ] = CompactOS (Comprimir Sistema)`n[NO] = SFC /Scannow" "Opción" "YesNo"
    if ($Resp -eq "Yes") { Invoke-Task -Button $btnSFC -TextRunning "🗜️ Comprimiendo..." -ScriptBlock { Enable-CompactOS } } 
    else { Invoke-Task -Button $btnSFC -TextRunning "🔍 Escaneando..." -ScriptBlock { Start-Process "sfc" "/scannow" -Wait } }
})

$btnRed.Add_Click({ Invoke-Task -Button $btnRed -TextRunning "📡 Reseteando Red..." -ScriptBlock { Repair-NetworkStack } })

$btnDrivers.Add_Click({ Invoke-Task -Button $btnDrivers -TextRunning "🚛 Eliminando..." -ConfirmMsg "¿Borrar drivers antiguos/fantasmas?" -ScriptBlock { Clean-OldDeviceDrivers } })

$btnOptimizacion.Add_Click({ Invoke-Task -Button $btnOptimizacion -TextRunning "🚀 Optimizando..." -ScriptBlock { Optimize-SystemQuick } })

$btnPower.Add_Click({
    Invoke-Task -Button $btnPower -TextRunning "⚡ Activando..." -ScriptBlock {
        powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Out-Null
        $Plan = Get-CimInstance -ClassName Win32_PowerPlan -Namespace root\cimv2\power | Where-Object { $_.ElementName -match "Ultimate|Máximo" } | Select-Object -First 1
        if ($Plan) { powercfg -setactive $Plan.InstanceID.Split("}")[1].Trim() }
        Show-Msg "✅ Plan 'Máximo Rendimiento' activado."
    }
})

$btnDISM.Add_Click({ Invoke-Task -Button $btnDISM -TextRunning "🚑 Reparando..." -ConfirmMsg "¿Ejecutar DISM RestoreHealth? (Tarda 10+ min)" -ScriptBlock { Start-Process "dism.exe" "/Online /Cleanup-Image /RestoreHealth" -Wait -NoNewWindow } })

$btnFixUpdates.Add_Click({
    Invoke-Task -Button $btnFixUpdates -TextRunning "🔄 Reseteando WU..." -ConfirmMsg "¿Reiniciar servicios de Windows Update?" -ScriptBlock {
        Stop-Service wuauserv, bits, cryptsvc -Force -ErrorAction SilentlyContinue
        Remove-Item "$env:systemroot\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue
        Start-Service wuauserv, bits, cryptsvc -ErrorAction SilentlyContinue
        Show-Msg "✅ Windows Update reiniciado."
    }
})

$btnFixStore.Add_Click({ Invoke-Task -Button $btnFixStore -TextRunning "🛍️ Reseteando..." -ScriptBlock { Start-Process "wsreset.exe" -Wait -NoNewWindow; Show-Msg "✅ Tienda reseteada." } })

$btnChkDsk.Add_Click({ 
    $Opcion = Show-Msg "[SÍ] = Programar Reparación al reinicio`n[NO] = Escaneo rápido online" "CHKDSK" "YesNoCancel"
    if ($Opcion -eq "Yes") { Invoke-Task -Button $btnChkDsk -TextRunning "⏳ Programando..." -ScriptBlock { Start-Process "cmd.exe" -ArgumentList "/c echo y | chkdsk C: /f" -Verb RunAs -WindowStyle Hidden -Wait; Show-Msg "✅ Reinicie el equipo para reparar." } } 
    elseif ($Opcion -eq "No") { Invoke-Task -Button $btnChkDsk -TextRunning "🔍 Escaneando..." -ScriptBlock { Start-Process "cmd.exe" "/k chkdsk C: /scan" -Wait } }
})

$btnExplorerTweaks.Add_Click({ Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0; Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Hidden" 1; Stop-Process -Name explorer -Force })

$btnInstalarPerfil.Add_Click({ if($global:SoftPath){ Install-From-Profile (Join-Path $global:SoftPath $cmbPerfiles.SelectedItem); Show-Msg "Perfil Instalado." } })

$btnActivar.Add_Click({ Invoke-Task -Button $btnActivar -TextRunning "⏳ Activando..." -ConfirmMsg "¿Activar Online (MAS)?" -ScriptBlock { Activate-MAS; Show-Msg "✅ Activación Finalizada." } })

$btnInstalarOffice.Add_Click({ 
    if ($global:OfficePath) { Invoke-Task -Button $btnInstalarOffice -TextRunning "⏳ Instalando Office..." -ScriptBlock { if (Install-Office-Local) { Show-Msg "Office Instalado." } else { Show-Msg "Error en instalación." "Error" } } } 
    else { Show-Msg "Conecta la USB para instalar Office." "Error" }
})

$btnStopUpdate.Add_Click({ New-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" "EnableAutomaticUpdates" 0 -PropertyType DWord -Force -ErrorAction SilentlyContinue; Show-Msg "Updates de Office Desactivados." })

$btnNitro.Add_Click({
    if ($global:ExternalPath) {
        $NitroPath = Join-Path $global:ExternalPath "Software\NitroPro9\nitro_pro9.exe"
        if (Test-Path $NitroPath) {
            if ((Show-Msg "¿Instalar Nitro Pro 9?" "Instalación" "YesNo") -eq "Yes") {
                [System.Windows.Forms.Clipboard]::SetText("www.intercambiosvirtuales.org")
                Start-Process -FilePath $NitroPath -Wait
                Show-Msg "📋 PASO 1: Pegue 'www.intercambiosvirtuales.org' en Nombre.`n`nLuego pulse ACEPTAR aquí." "Licencia 1/2"
                [System.Windows.Forms.Clipboard]::SetText("NP9D6A6944155477777")
                Show-Msg "🔑 PASO 2: Serial copiado.`nPegue con Ctrl+V." "Licencia 2/2"
            }
        } else { Show-Msg "Falta nitro_pro9.exe" "Error" }
    }
})

$btnUninstallTool.Add_Click({ if($global:ExternalPath){ $P=Join-Path $global:ExternalPath "UninstallTool\UninstallToolPortable.exe"; if(Test-Path $P){Start-Process $P}else{Show-Msg "Falta UninstallTool" "Error"} } })

$btnRuntimes.Add_Click({ if($global:ExternalPath){ $P=Join-Path $global:ExternalPath "Software\Runtimes\aio-runtimes.exe"; if(Test-Path $P){Start-Process $P}else{Show-Msg "Falta aio-runtimes.exe" "Error"} } })

$btnCrystal.Add_Click({ Run-Tool "PortableApps\CrystalDiskInfoPortable\CrystalDiskInfoPortable.exe" })

$btnCrystalMark.Add_Click({ Run-Tool "PortableApps\CrystalDiskMarkPortable\CrystalDiskMarkPortable.exe" })

$btnHWiNFO.Add_Click({ Run-Tool "PortableApps\HWiNFOPortable\HWiNFOPortable.exe" })

$btnDell.Add_Click({ Run-Tool "VendorTools\Dell\DellSupportAssist_Install.exe" })

$btnHP.Add_Click({ Run-Tool "VendorTools\HP\HPSupport_Install.exe" })

$btnLenovo.Add_Click({ Run-Tool "VendorTools\Lenovo\LenovoVantage_Install.exe" })

$btnDriverBooster.Add_Click({ 
    if (Test-IsConnected) { Run-Tool "PortableApps\3DP\Chip\3DP_Chip.exe" } 
    else { Show-Msg "⚠️ Sin Internet: Abriendo 3DP Net para red." "Offline" "OK" "Warning"; Run-Tool "PortableApps\3DP\Net\3DP_Net.exe" }
})

$btnGetKey.Add_Click({ 
    try { $Key = (Get-CimInstance -Query "SELECT OA3xOriginalProductKey FROM SoftwareLicensingService").OA3xOriginalProductKey
    if ($Key) { [System.Windows.Forms.Clipboard]::SetText($Key); Show-Msg "Clave OEM copiada: $Key" } else { Show-Msg "No hay clave OEM en BIOS." } } catch { Show-Msg "Error leyendo licencia." } 
})


# Lanzar ventana
$Window.ShowDialog() | Out-Null
