Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADE273773
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:09:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 772B9150E;
	Wed, 24 Jul 2019 18:59:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 52FC07F6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 13:53:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A371C224
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 13:53:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p17so39481221wrf.11
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4A+1IXOg0AUN44xOjU2IRxHAI7jKAe/Dsm+NufqoDwo=;
	b=h5xyyPGSNmBklwByUO/gVRTUPrqta7oP6slCL4V466Dk09LzZfaKpE38pxS8G5slhy
	kCEcqJytkJuTpeJ0ZkCmKFqCNrbEfC0lUXLQOENIXbxc4dFY4fY6/OIOFSzG/uq8Fa4v
	cVik26Hf7EfFjIME2gwYiHyFu/Ime6pzaPmIvGIuziJy56HmOJs6GrwoylHcUJ0SJiP+
	N4Zfu55ZuSuimc7A33dUu6HxUibxWLmeA1uTeG0hn89lx1ChoDQ/jvmIItGHJVSZKik4
	N3+eMf1E31OR4eP4wCFFWfiNFLlHmEP5mrxCgkR2Zr+NUHrxM7UvU9ht1gVrcWcerZak
	4A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4A+1IXOg0AUN44xOjU2IRxHAI7jKAe/Dsm+NufqoDwo=;
	b=LbXjUoHfwCSHWoHaC+qyXwpERXND6z/N4+MZPFDVLYYV8lysEkewg2J97ZdPIBtRNg
	5vNeloTrr0VioQITKB4yfwmYAHjG/FlTqdQGBvZIA6tNPPuzsVpOlDZMfRlrosFzD+KN
	i2EHeH7QiBiA8KL1EHx8+J+YgazpDRqyT4f+Z4PkWfRVZRGLtNxuX4+mD9rozztB7BmJ
	O3lHftr0TaC8UkgQ/Ax1kFDjTEq4TfpAdRSmhr91N2DCvrMFPVHM53o0bET1IsBKgfac
	THAkb75heSYQqVL6Mx/ly6fgT0u+4N0zcdipjUoF6GFG9i6dFnSVa5u94k5njQxmIR2b
	jjXA==
X-Gm-Message-State: APjAAAVEOJogId2I4Fc5LXajUzcIJwoy3jLbUhPeoDBZ4seVSsiauk2y
	RcD6T3O6X8EFZ2XYbo8Uwu6X4g==
X-Google-Smtp-Source: APXvYqywPiYMC6nufG0pkn9341YSKK0eKjFT1pvuf89bXzyjMLOex2BVhSg8UoynoCTGmuXI4lFN6w==
X-Received: by 2002:a5d:6650:: with SMTP id f16mr77388789wrw.89.1563803597410; 
	Mon, 22 Jul 2019 06:53:17 -0700 (PDT)
Received: from lophozonia.localdomain
	(cpc92304-cmbg19-2-0-cust820.5-4.cable.virginm.net. [82.24.199.53])
	by smtp.gmail.com with ESMTPSA id
	s10sm29821771wrt.49.2019.07.22.06.53.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 06:53:16 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH] MAINTAINERS: Update my email address
Date: Mon, 22 Jul 2019 14:44:40 +0100
Message-Id: <20190722134438.31003-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: virtio-dev@lists.oasis-open.org, lorenzo.pieralisi@arm.com, mst@redhat.com,
	linux-pci@vger.kernel.org, joro@8bytes.org, maz@kernel.org,
	will@kernel.org, kvmarm@lists.cs.columbia.edu
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Update MAINTAINERS and .mailmap with my @linaro.org address, since I
don't have access to my @arm.com address anymore.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 0fef932de3db..8ce554b9c9f1 100644
--- a/.mailmap
+++ b/.mailmap
@@ -98,6 +98,7 @@ Jason Gunthorpe <jgg@ziepe.ca> <jgunthorpe@obsidianresearch.com>
 Javi Merino <javi.merino@kernel.org> <javi.merino@arm.com>
 <javier@osg.samsung.com> <javier.martinez@collabora.co.uk>
 Jean Tourrilhes <jt@hpl.hp.com>
+<jean-philippe@linaro.org> <jean-philippe.brucker@arm.com>
 Jeff Garzik <jgarzik@pretzel.yyz.us>
 Jeff Layton <jlayton@kernel.org> <jlayton@redhat.com>
 Jeff Layton <jlayton@kernel.org> <jlayton@poochiereds.net>
diff --git a/MAINTAINERS b/MAINTAINERS
index 783569e3c4b4..bded78c84701 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17123,7 +17123,7 @@ F:	drivers/virtio/virtio_input.c
 F:	include/uapi/linux/virtio_input.h
 
 VIRTIO IOMMU DRIVER
-M:	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
+M:	Jean-Philippe Brucker <jean-philippe@linaro.org>
 L:	virtualization@lists.linux-foundation.org
 S:	Maintained
 F:	drivers/iommu/virtio-iommu.c
-- 
2.22.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
