Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2FA193C00
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 10:36:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C21387DDB;
	Thu, 26 Mar 2020 09:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATybHcRezgDV; Thu, 26 Mar 2020 09:36:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1DE2A87DA2;
	Thu, 26 Mar 2020 09:36:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04E10C1831;
	Thu, 26 Mar 2020 09:36:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDA05C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A710A88425
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gg1oTS7XD5TW
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B794288406
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:47 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w10so6873403wrm.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G7p7PJ6AcDeKyfPDjNpk4b1tbVGXZ0s/DSwOXa4tJGU=;
 b=MdEKy25/rECSTKfRqslDXiTmq8aAghSsjHwwsraYtjVMg3oQK/FR4Nq2Iq/su6rA+O
 HrqEBktp/2UIDjuDsUKfy6MTCLHLczrMrygOfZrt4/dGb4gee3s//As5K5zRdCQOQz6w
 OAF2yOm5oXjpmNjBHl2HKhlxdse3NT0WvqCdTsD/4lKYiygz/WPyXDQA7WW+NKzeZs8P
 zqjZEBsu675cHpDtIRgL61hZeGPZtjRtgJ/uVLoO4B3O5xsTCNj6XZ1DV+iT+s6ZVfkM
 0NYqou+KrkDnZk9UzPKso9DceJifYwBiVzS5fnacYDQr5fsNh6kS9hUpn/OhOA6h8p2V
 S3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G7p7PJ6AcDeKyfPDjNpk4b1tbVGXZ0s/DSwOXa4tJGU=;
 b=PZqvp1KAJPaBubCT/cMBeaAUTn4e5XkB8snGnKgGGym12NmPtRdvlV3wQYCsQlHh1c
 /1gy3MZCWnIG9LPsLCIVzW8jVLi0UJZTAhp2cH3FhVuxKGO/igzMbSPK39R2Wrr8lAOW
 KM3mXjGudVXcjiT2Kp96yBjEpvz91l9y8ggOZRbAzlJ7CXpbopGHCQ/h6wlcPYcO9nqQ
 AxbGvpsrgdTLlKhgEYHBZ2xjuE/lu+JnT3Y/2BEIBiyR3KtymIRr0BEGsdoLguMNXk/u
 9KMhvEDwviaU4TDdcNYnUMcJh7F4HW83PF5K3Azob7e3FGE3j3OOpAe7tPchYcKdKwA7
 SxAw==
X-Gm-Message-State: ANhLgQ3xX1WfhGRArPtpLorCF1WF/7lO+hCFgByHxevzfGaU4h8cjvQQ
 fSRLxCcV5MSlrqRIbYN4+h6Fjw==
X-Google-Smtp-Source: ADFU+vtbZ1yGAz4pBh/4O+sIsvZFx+dJfbGrrMYuEMAEEDTRAA+DU6/7rWZWh0cSNFmldDCc8fR4rw==
X-Received: by 2002:a05:6000:12c6:: with SMTP id
 l6mr8834464wrx.152.1585215405995; 
 Thu, 26 Mar 2020 02:36:45 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u8sm2670165wrn.69.2020.03.26.02.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 02:36:45 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 0/3] iommu/virtio: Misc fixes
Date: Thu, 26 Mar 2020 10:35:55 +0100
Message-Id: <20200326093558.2641019-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 joro@8bytes.org, virtualization@lists.linux-foundation.org,
 eric.auger@redhat.com, bbhushan2@marvell.com
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

A collection of fixes for the virtio-iommu driver. It might be too late
for v5.6 since they need more review. Patch 2 is new, the others were
posted separately. 

Jean-Philippe Brucker (3):
  iommu/virtio: Fix sparse warning
  iommu/virtio: Fix freeing of incomplete domains
  iommu/virtio: Reject IOMMU page granule larger than PAGE_SIZE

 include/uapi/linux/virtio_iommu.h | 12 ++++++------
 drivers/iommu/virtio-iommu.c      | 30 +++++++++++++++++++++---------
 2 files changed, 27 insertions(+), 15 deletions(-)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
