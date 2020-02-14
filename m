Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACA515E51D
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 17:40:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7CDD922122;
	Fri, 14 Feb 2020 16:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXah6UDVDcWO; Fri, 14 Feb 2020 16:40:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3941B22177;
	Fri, 14 Feb 2020 16:40:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EF91C0177;
	Fri, 14 Feb 2020 16:40:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C747EC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C2E7E86E18
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUCMv3b73LJn
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:40:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5ADEE86DC5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:40:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so11610624wrt.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 08:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/y/pMWh3geg+/AvjUY3CKuL5SUYBfjeL+1EVeLwrjI=;
 b=Ubsj8M9mDcY2JazA9fq0ebdaKpZZZJTuvWmsVxyG/o8HzEPkQuvo72CFS78R2XfVk6
 zIeX+LJRAW2Z5sBbp1vFME12y3zTvYYYP+4rjNcmF3u2rj0yl4utpe/pt+lXJ79T55V+
 RMWsfI8QAUqz9O3tKva5u7Xq73QsXUT0jUf83yKUTgUpk5cws5Tv87nHQJya+2MJYNX+
 Hbo5Nbb64yxxQkN29oqd9tlcBog1Uh0+aYxa/Y9oN3ALEUHb2PbG+otfP+vs8Hr/9KYQ
 qH3O7lCnW60O7DNN7EmPIUlCyMelyqAW4lB9Z2NR2rtKUl6bsIbtfnFBptBslQIo5WId
 TIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/y/pMWh3geg+/AvjUY3CKuL5SUYBfjeL+1EVeLwrjI=;
 b=VIoA66zqTL7V4n0oKlbDg4sMMBgExwCZP1VuI1IlyUPUnEJCs0WglA6xFJX/APWRlY
 ee2RbLws0vhmRPndOCsX8gxzKo/3ZhBl+EvgQhlYf043mnGq/kCjBSmkb479Qh6exaru
 v76hRxYKT8nbFg2aDMgL9MdUFjh0/GqTsMgzxZNvMZHkOT+1D0O18UK4O+evTut2jge2
 XnPdP7CYvj4PUIwxxjPqtxWGLqEjac5XH1638QWRRDcDFRMX/T/6FcxltvefAVY4Nl3p
 PqsEsaU2wHCYHK4LLIe8loLTTSybQqJ0FCySwAsQzTZN4DTNxymflmEU7Sw9z9rZHEpg
 VIRw==
X-Gm-Message-State: APjAAAWUREeMapQKNuQKf7uTTor2f98qBDkreptjNB4OZ4ai6kCPXWSS
 YbjhY8CSw0skUzz8fD/Wq65O3g==
X-Google-Smtp-Source: APXvYqwnGt9SqtaziTW5MSaZPlzdcxPJQXO4pQLtdqS/7aMXxcPKSKifY9meLqiwqH79ZJOXc9IHqw==
X-Received: by 2002:adf:a453:: with SMTP id e19mr4738900wra.305.1581698426863; 
 Fri, 14 Feb 2020 08:40:26 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id m3sm8197796wrs.53.2020.02.14.08.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 08:40:25 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
Subject: [PATCH] iommu/virtio: Build virtio-iommu as module
Date: Fri, 14 Feb 2020 17:38:27 +0100
Message-Id: <20200214163827.1606668-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: joro@8bytes.org
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

From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

Now that the infrastructure changes are in place, enable virtio-iommu to
be built as a module. Remove the redundant pci_request_acs() call, since
it's not exported but is already invoked during DMA setup.

Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
---
This conflicts with the multiplatform work [1] since they both change
Kconfig. Locally I have this patch applied on top of that series but
there is no functional dependency between the two.

[1] https://lore.kernel.org/linux-iommu/20200214160413.1475396-1-jean-philippe@linaro.org/
---
 drivers/iommu/Kconfig        | 4 ++--
 drivers/iommu/virtio-iommu.c | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index adcbda44d473..bfd4e5fcd6aa 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -506,8 +506,8 @@ config HYPERV_IOMMU
 	  guests to run with x2APIC mode enabled.
 
 config VIRTIO_IOMMU
-	bool "Virtio IOMMU driver"
-	depends on VIRTIO=y
+	tristate "Virtio IOMMU driver"
+	depends on VIRTIO
 	depends on (ARM64 || X86)
 	select IOMMU_API
 	select IOMMU_DMA
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index f18ba8e22ebd..5429c12c879b 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -1084,7 +1084,6 @@ static int viommu_probe(struct virtio_device *vdev)
 
 #ifdef CONFIG_PCI
 	if (pci_bus_type.iommu_ops != &viommu_ops) {
-		pci_request_acs();
 		ret = bus_set_iommu(&pci_bus_type, &viommu_ops);
 		if (ret)
 			goto err_unregister;
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
