Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED3408954
	for <lists.virtualization@lfdr.de>; Mon, 13 Sep 2021 12:48:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AF4E4023F;
	Mon, 13 Sep 2021 10:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fYtLR5kuDtN; Mon, 13 Sep 2021 10:47:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 790D14020B;
	Mon, 13 Sep 2021 10:47:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CA84C0022;
	Mon, 13 Sep 2021 10:47:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37C67C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 10:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26E1F40236
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 10:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ST3kQU4BiviX
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 10:47:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 727684020B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 10:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631530075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=jW3RSfCiVG035tkP4VV2MK7HMp8Gx524MEf00frh+Is=;
 b=LHPBXU5uIMV3lvi85Sg2rtrloI2LH/wPCm+bHqMUfAgKL8qt0VlKPMCH76lCSfzUgQmmV1
 8OU18Q7lfc95w/+vrJb09FyrjU3HYqxzJDIK+Nz4PjPsTL+OtaZSOb75ItgeR0ktpesB2e
 x4A8yNUDHX0MfecAqWOH+8L3bJrxJxk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-tPJAI03jOW-dEtE9w75nMw-1; Mon, 13 Sep 2021 06:47:54 -0400
X-MC-Unique: tPJAI03jOW-dEtE9w75nMw-1
Received: by mail-ed1-f72.google.com with SMTP id
 h15-20020aa7de0f000000b003d02f9592d6so4342006edv.17
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 03:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=jW3RSfCiVG035tkP4VV2MK7HMp8Gx524MEf00frh+Is=;
 b=0rVaUC4LWTDREtgy7AHRf0UYuuhStaz96R5RqD9stMl55AvB/p6MCA37kxzMkNf6x6
 239T3A4UXwwlkQiUOYZC5d9FZvI0rV5WHc9Ur0uRXGK3FREX11i0MVSt+CewRQBpDVex
 mfabkZgXkCljrVSiQm4qrcueM7pCoRa84lV8G0xSYlQY/M+7d8uvvf3W0WRYNGYcUw5u
 0O+ERnAhepxOI00DSnAbEVQAhxxD9hAJvpV0oYiTyohIRWsVIqehrlkGN+emU2/MkPsy
 UOKV/zPn758bmBdK+iRhOEB/MNXkKgK19smpRf/mtIfH10KeKayBBwx5ycTzIuEFOk2K
 WHQA==
X-Gm-Message-State: AOAM530gM+r4fHTBrmvmGKsEaM162urui17Q15cLR868YvoiRcoxERAb
 kUVLbhtpGfLo9z8eMecvXkJmpGGb3HPYjFGRREhdAzquQIS4S7GC0eofk8eA//vjEQ07Yedb0UJ
 WVvdhMWS82dKDsYLH898Du9lUIPYbZxT47DvlrRVvuA==
X-Received: by 2002:a17:906:269a:: with SMTP id
 t26mr7121205ejc.20.1631530072841; 
 Mon, 13 Sep 2021 03:47:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUzxkOpFlkukF5bylBkxuLJ8coUNDVC3dmW/I3lxI4GHhcqqXeIdferB5ZUa/gtf5ATObe8g==
X-Received: by 2002:a17:906:269a:: with SMTP id
 t26mr7121179ejc.20.1631530072612; 
 Mon, 13 Sep 2021 03:47:52 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207f:418b:5703:fd4e:73dd:1986])
 by smtp.gmail.com with ESMTPSA id o15sm3258041ejj.10.2021.09.13.03.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 03:47:52 -0700 (PDT)
Date: Mon, 13 Sep 2021 06:47:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH] virtio: don't fail on !of_device_is_compatible
Message-ID: <20210913104640.85839-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Arnd Bergmann <arnd@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bill Mills <bill.mills@linaro.org>
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

A recent change checking of_device_is_compatible on probe broke some
powerpc/pseries setups. Apparently there virtio devices do not have a
"compatible" property - they are matched by PCI vendor/device ids.

Let's just skip of_node setup but proceed with initialization like we
did previously.

Fixes: 694a1116b405 ("virtio: Bind virtio device to device-tree node")
Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Arnd could you help review this pls? Viresh is on vacation.

 drivers/virtio/virtio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index c46cc1fbc7ae..19a70a2361b4 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -347,8 +347,13 @@ static int virtio_device_of_init(struct virtio_device *dev)
 	ret = snprintf(compat, sizeof(compat), "virtio,device%x", dev->id.device);
 	BUG_ON(ret >= sizeof(compat));
 
+	/*
+	 * On powerpc/pseries virtio devices are PCI devices so PCI
+	 * vendor/device ids play the role of the "compatible" property.
+	 * Simply don't init of_node in this case.
+	 */
 	if (!of_device_is_compatible(np, compat)) {
-		ret = -EINVAL;
+		ret = 0;
 		goto out;
 	}
 
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
