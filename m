Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD46646B4
	for <lists.virtualization@lfdr.de>; Tue, 10 Jan 2023 17:57:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2449C81F17;
	Tue, 10 Jan 2023 16:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2449C81F17
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=RTCvlCJ6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcUAkQjl_ghB; Tue, 10 Jan 2023 16:57:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9AF4681F09;
	Tue, 10 Jan 2023 16:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AF4681F09
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B530AC0078;
	Tue, 10 Jan 2023 16:57:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D4FAC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 16:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DCC0400F5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 16:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DCC0400F5
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com
 header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=RTCvlCJ6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4U0bgvxJgDHL
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 16:56:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E92684007D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E92684007D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 16:56:54 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v2so1461564wrw.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 08:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eegm6h5/4aiM1ctrp3XKGH5jYH2u1V5ZiNnFihk+Tvo=;
 b=RTCvlCJ6TqO8QFuoI+x/1khXGGuPtw1zPAY57G83xVroYLJc1p/b8Dz43z1Moa0+h8
 ZbTiHRre8fhjQyN90jmdywE/6sPxRsgSb5MsRhPW2CzNHDRC7wTxY5/cev8E6qaymsD4
 t8D+07bg9sa8/D4M9mboASKyvbGukNP6U9I+/oiNybBuPaSGcSjK+A2qyGuw/msXkErp
 c45DXW8HiuX7J/Ok70qo9IjCIH8Oz8cFhSnc/3/0aQeexKvPwibxS4IU+J0nRA3BGyPX
 HjEsqrtQDJl36OyyXPAETx4hCTunMP+1QJdp1abErz+QGvRoZDXdEAPvhLlD1UrqBKKt
 w9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eegm6h5/4aiM1ctrp3XKGH5jYH2u1V5ZiNnFihk+Tvo=;
 b=W4wy5Bu2tCbVHrP4WiOicfOkwlHG7ICL+RDsxZAF09pra4cm2SIrLpoKNGeE+tJniB
 Sb1s8GG/D9CMzzdBwntrIb8bvdDse8kNNxSRSbte1p7tgxFtmEzi+ryPUmvX9VDMsv3r
 S/V3qZZcRb4ox/4dAQHYfq0QpJqeNUzqP1LqCUk/HPI1Q8OMhZHMq1XdRMNU8XdNOYF8
 iUf90pygOCN+0wULBlTEUTBulu5oIp/uPTyX3A8VdkJslbodjSzCApJoB6T6QhEEjgcm
 xBlBm8tddRfE1ijjJ7fSoOULCXo2ox6Vdbks9cf5cbjVY7QxjhoCXPq4+0VZpSi321h8
 hZ1A==
X-Gm-Message-State: AFqh2kqdY13m5/iz9gRh8F7jwHbFu6tuZT8ERG9OrFMirEXByjk2QrAq
 FJcn3mDuGKBV1nQkKuWPPCbstw==
X-Google-Smtp-Source: AMrXdXvU3ASKi6xAOeOt/9PpjZP+UheShsILN5+rT/5Z8wsVqhoATjM4S2x99dbOzKylDESc9DHeSA==
X-Received: by 2002:a5d:4591:0:b0:2b4:790e:32f8 with SMTP id
 p17-20020a5d4591000000b002b4790e32f8mr9396175wrq.48.1673369813017; 
 Tue, 10 Jan 2023 08:56:53 -0800 (PST)
Received: from localhost.localdomain
 (bzq-84-110-153-254.static-ip.bezeqint.net. [84.110.153.254])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b00268aae5fb5bsm11918066wre.3.2023.01.10.08.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:56:52 -0800 (PST)
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
To: linux-pci@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v9 0/3] virtio: vdpa: new SolidNET DPU driver
Date: Tue, 10 Jan 2023 18:56:35 +0200
Message-Id: <20230110165638.123745-1-alvaro.karsz@solid-run.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: helgaas@kernel.org, mst@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This series adds a vDPA driver for SolidNET DPU.

Patch 1 adds SolidRun vendor ID to pci_ids.
Patch 2 adds a PCI quirk needed by the DPU.
Patch 3 has the driver source code.

Patch 1 is prerequisite for both patch 2 and patch 3.

v2:
	- Semantics fixes in commit log - Patch 1.
	- Move the vendor ID to the right place, sorted by vendor ID - Patch 1.
        - Update patch subject to be more meaningful and similar to
          previous quirks - Patch 2.
        - Update the commit log to describe better what the patch does -
	  Patch 2.
	- Auto detect the BAR used for communication - Patch 3.
	- When waiting for the DPU to write a config, wait for 5secs
	  before giving up on the device - Patch 3.
	- Return EOPNOTSUPP error code in vDPA set_vq_state callback if
	  the vq state is not the same as the initial one - Patch 3.
	- Implement a vDPA reset callback - Patch 3.
	- Wait for an ACK when sending a message to the DPU - Patch 3.
	- Add endianness comments on 64bit read/write functions - Patch 3.
	- Remove the get_iova_range and free vDPA callbacks - Patch 3.
	- Usage of managed device functions to ioremap a region - Patch 3.
	- Call pci_set_drvdata and pci_set_master before
	  vdpa_register_device - Patch 3.
	- Create DMA isolation between the vDPA devices by using the
	  chip SR-IOV feature.
	  Every vDPA device gets a PCIe VF with its own DMA device - Patch 3.

v3:
	- Validate vDPA config length while receiving the DPU's config,
	  not while trying to write the vDPA config to the DPU - Patch 3.
	- Request IRQs when vDPA status is set to
          VIRTIO_CONFIG_S_DRIVER_OK - Patch 3.
	- Remove snet_reset_dev() from the PCI remove function for a VF - Patch 3.

v4:
	- Get SolidRun vendor ID from pci_ids - Patch 3.

v5:
	- Remove "select HWMON" from Kconfig.
	  Usage of "depends on HWMON || HWMON=n" instead and usage of
	  IS_ENABLED(CONFIG_HWMON) when calling to snet hwmon functions.
	  snet_hwmon.c is compiled only if CONFIG_HWMON is defined - Patch 3.
	- Remove the  #include <linux/hwmon-sysfs.h> from snet_hwmon.c - Patch 3.
	- Remove the unnecessary (long) casting from snet_hwmon_read_reg -
	  Patch 3.
	- Remove the "_hwmon" ending from the hwmon name - Patch 3.
	- Usage of IS_ERR macro to check if devm_hwmon_device_register_with_info
	  failed - Patch 3.
	- Replace schedule() with usleep_range() in the "hot loop" in
	  psnet_detect_bar - Patch 3.
	- Remove the logging of memory allocation failures - Patch 3.
	- Add parenthesis to arguments in SNET_* macros - Patch 3.
	- Prefer sizeof(*variable) instead of sizeof(struct x) when allocating
	  memory - Patch 3.

v6:
	- SNET_WRN -> SNET_WARN - Patch 3.

v7:
	- Explain the dependency of SNET_VDPA on HWMON in Kconfig - Patch 3.
	- Fix snprintf size argument in psnet_open_pf_bar and
	  snet_open_vf_bar - Patch 3.
	- Fix kernel warning in snet_vdpa_remove_vf.
	  Call pci_free_irq_vectors after vdpa_unregister_device,
	  otherwise we'll get "remove_proc_entry: removing non-empty
	  directory 'irq/..', leaking at least '..'" warnings - Patch 3.
	- Remove the psnet_create_hwmon function empty definition if
	  HWMON is not enabled, otherwise, we'll get "warning: no
	  previous prototype for 'psnet_create_hwmon'" when compiling
	  with W=1.
	  This was reported by kernel test robot <lkp@intel.com> - Patch 3.

v8:
        - Fix the series versioning.
          I updated the versions of every patch separately,
	  which seems to be wrong.

v9:
	- Indent PCI id in pci_ids.h with tabs - Patch 1.
	- Wrap patch comment log to fill 75 columns - Patch 1 + 2.

Alvaro Karsz (3):
  PCI: Add SolidRun vendor ID
  PCI: Avoid FLR for SolidRun SNET DPU rev 1
  virtio: vdpa: new SolidNET DPU driver.

 MAINTAINERS                        |    4 +
 drivers/pci/quirks.c               |    8 +
 drivers/vdpa/Kconfig               |   18 +
 drivers/vdpa/Makefile              |    1 +
 drivers/vdpa/solidrun/Makefile     |    6 +
 drivers/vdpa/solidrun/snet_hwmon.c |  188 +++++
 drivers/vdpa/solidrun/snet_main.c  | 1110 ++++++++++++++++++++++++++++
 drivers/vdpa/solidrun/snet_vdpa.h  |  194 +++++
 include/linux/pci_ids.h            |    2 +
 9 files changed, 1531 insertions(+)
 create mode 100644 drivers/vdpa/solidrun/Makefile
 create mode 100644 drivers/vdpa/solidrun/snet_hwmon.c
 create mode 100644 drivers/vdpa/solidrun/snet_main.c
 create mode 100644 drivers/vdpa/solidrun/snet_vdpa.h

-- 
2.32.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
